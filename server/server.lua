--------------------------------------------------------------------------------------------------------------
--------------------------------------------- SERVER SIDE ----------------------------------------------------
local VORPcore = {}
local VORPinv

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

VORPinv = exports.vorp_inventory:vorp_inventoryApi()
 
--------------------------------------------------------------------------------------------------------------
--------------------------------------------- SELL -----------------------------------------------------------

RegisterServerEvent(GetCurrentResourceName()..':sell')
AddEventHandler(GetCurrentResourceName()..':sell', function(label, name, type, price, qty, storeId)
    local _source = source
    local Character = VORPcore.getUser(_source).getUsedCharacter
    local ItemName = name
    local ItemPrice = price
    local ItemLabel = label
    local currencyType = type
    
    local QuantityOnHand = VORPinv.getItemCount(_source, ItemName)
    local count = QuantityOnHand
    
    local OrderQuantity = qty
    local quantity = OrderQuantity

    local OrderTotal = ItemPrice * quantity
    local total = OrderTotal
    local total2 = (math.floor(OrderTotal * 100) / 100)

    local itemFound= false
    local storeconfig = Config.Stores[storeId]
    
    if QuantityOnHand >= OrderQuantity then 
        if storeStock[storeId][item_id].in_stock then --when store have no limited items
            sellItems(_source,Character,ItemName,quantity,ItemLabel,total,total2,currencyType)
        else --store have limited items
            for k, items in pairs(storeLimits[storeId]) do
                if items.itemName == ItemName and items.type == "sell" then
                    itemFound = true
                    if items.amount >= quantity then
                        sellItems(_source,Character,ItemName,quantity,ItemLabel,total,total2,currencyType)
                        items.amount = items.amount-quantity --update amount left for store
                    else
                        VORPcore.NotifyRightTip( _source, _U("limitSell"), 3000)
                    end
                end
            end
            if not itemFound then
                sellItems(_source,Character,ItemName,quantity,ItemLabel,total,total2,currencyType)
            end
        end
        if storeconfig.DynamicStore then
            dynamicStoreHandler(storeconfig,storeId,ItemName,quantity)
        end
    else
        VORPcore.NotifyRightTip( _source,_U("youdontsell"), 3000)
    end
end)


function sellItems(_source,Character,ItemName,quantity,ItemLabel,total,total2,currencyType)
    if currencyType == "cash" then
        VORPinv.subItem(_source, ItemName, quantity)
        Character.addCurrency(0, total)

        VORPcore.NotifyRightTip( _source, _U("yousold") .. quantity .. " " .. ItemLabel .. _U("frcash") .. total .. _U("ofcash"), 3000)
    end

    if currencyType == "gold" then

        VORPinv.subItem(_source, ItemName, quantity)
        Character.addCurrency(1, total)
        VORPcore.NotifyRightTip( _source, _U("yousold") .. quantity .. "" .. ItemLabel .. _U("fr") .. total .. _U("ofgold"), 3000)
    end
    
end

function dynamicStoreHandler(storeconfig,storeId,ItemName,quantity)

        for k, items in pairs(storeLimits[storeId]) do
            if items.itemName == ItemName and items.type == "buy" then
                items.amount = items.amount+quantity
            end
        end
end

------------------------------------------------------------------------------------------------------------------------
---------------------------------------------- BUY ---------------------------------------------------------------------


RegisterServerEvent(GetCurrentResourceName()..':buy')
AddEventHandler(GetCurrentResourceName()..':buy', function(label, name, type, price, qty,storeId)
    local _source = source
    local Character = VORPcore.getUser(_source).getUsedCharacter
    local money = Character.money
    local gold = Character.gold
    local ItemName = name
    local ItemPrice = price
    local ItemLabel = label
    local currencyType = type
    local quantity = qty
    local total = ItemPrice * quantity
    local total2 = (math.floor(total * 100) / 100)
    local itemFound = false
    local canCarry = VORPinv.canCarryItems(_source, quantity) --can carry inv space
    local canCarry2 = VORPinv.canCarryItem(_source, ItemName, quantity) --cancarry item limit
    local itemCheck = VORPinv.getDBItem(_source, ItemName) --check items exist in DB    
    
    if itemCheck then
        if canCarry and canCarry2 then

            if storeStock[storeId][Item_Id].in_stock then --when store have no limited items
                buyItems(_source,Character,money,gold,currencyType,ItemPrice, total,ItemName,quantity,ItemLabel,total2)
            else
                for k, items in pairs(storeLimits[storeId]) do
                    if items.itemName == ItemName and items.type == "buy" then
                        itemFound = true
                        if items.amount >= quantity then
                            buyItems(_source,Character,money,gold,currencyType,ItemPrice, total,ItemName,quantity,ItemLabel,total2)
                            items.amount = items.amount-quantity --update amount left for store
                        else
                            VORPcore.NotifyRightTip(_source, _U("limitBuy"), 3000)
                        end
                    end
                end
                if not itemFound then
                    buyItems(_source,Character,money,gold,currencyType,ItemPrice, total,ItemName,quantity,ItemLabel,total2)
                end
            end
        else
            VORPcore.NotifyRightTip(_source, _U("cantcarry"), 3000)
        end
    else
        VORPcore.NotifyRightTip(_source, "item does not exist", 3000)
    end
end)

function buyItems(_source,Character,money,gold,currencyType,ItemPrice, total,ItemName,quantity,ItemLabel,total2)
    if money >= total then
        if currencyType == "cash" then
            VORPinv.addItem(_source, ItemName, quantity)
            Character.removeCurrency(0, total)
           
            local Message  = _U("youbought") .. quantity .. " " .. ItemLabel .. _U("frcash") .. total .. _U("ofcash")
            VORPcore.NotifyRightTip(_source, Message,3000)
            if Config.Webhook[UseWebhook] == true or Config.Webhook[UseWebhook] == 1 then 
                local title = "📋` Bought Item` " 
                local webhook = Config.Webhook[WebhookChannel]
                local description = "`\n**PlayerID** `" .. _source .. "` \n"..Message.."`"
                local color = Config.Webhook[WebhookColor]
                local name = Config.Webhook[WebhookName]
                local logo = Config.Webhook[WebhookLogo]
                local footerlogo = Config.Webhook[WebhookLogo2]
                local avatar = Config.Webhook[WebhookAvatar]
                TriggerEvent('vorp_core:addWebhook', title, webhook, description, color, name, logo, footerlogo, avatar)
            end 

        end
    else
        VORPcore.NotifyRightTip(_source, _U("youdontcash"), 3000)
    end

    if gold >= total then
        if currencyType == "gold" then
            if gold >= ItemPrice then
                VORPinv.addItem(_source, ItemName, quantity)
                Character.removeCurrency(1, total)

                local Message  = _U("youbought") .. quantity .. "" .. ItemLabel .. _U("fr") .. total .. _U("ofgold")
                VORPcore.NotifyRightTip(_source, Message,3000)
                if Config.Webhook[UseWebhook] == true or Config.Webhook[UseWebhook] == 1 then 
                    local title = "📋` Bought Item` " 
                    local webhook = Config.Webhook[WebhookChannel]
                    local description = "`\n**PlayerID** `" .. _source .. "` \n"..Message.."`"
                    local color = Config.Webhook[WebhookColor]
                    local name = Config.Webhook[WebhookName]
                    local logo = Config.Webhook[WebhookLogo]
                    local footerlogo = Config.Webhook[WebhookLogo2]
                    local avatar = Config.Webhook[WebhookAvatar]
                    TriggerEvent('vorp_core:addWebhook', title, webhook, description, color, name, logo, footerlogo, avatar)
                end     
                           
            else
                VORPcore.NotifyRightTip(_source, _U("youdontgold"), 3000)
            end
        end
    end
    
end


-------------------- GetStocks --------------------
RegisterServerEvent(GetCurrentResourceName()..':getShopStock')
AddEventHandler(GetCurrentResourceName()..':getShopStock', function()
    local _source = source 
    TriggerClientEvent(GetCurrentResourceName()..':sendShopStock', _source, storeStock)
end)

-------------------- GetJOB --------------------
RegisterServerEvent(GetCurrentResourceName()..':getPlayerJob')
AddEventHandler(GetCurrentResourceName()..':getPlayerJob', function()
    local _source = source
    local Character = VORPcore.getUser(_source).getUsedCharacter
    local CharacterJob = Character.job
    local CharacterGrade = Character.jobGrade

    TriggerClientEvent(GetCurrentResourceName()..':sendPlayerJob', _source, CharacterJob, CharacterGrade)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end 
end)

GetRefreshedPrices = false
RegisterServerEvent(GetCurrentResourceName()..':GetRefreshedPrices')
AddEventHandler(GetCurrentResourceName()..':GetRefreshedPrices', function()
    local _source = source    
    if GetRefreshedPrices == false then 
        GetRefreshedPrices = true    
        print(GetCurrentResourceName()..':GetRefreshedPrices')       

        TriggerClientEvent(Config.ScriptName..":catch:RefreshBuy", _source, Config.BuyItems)
        Citizen.Wait(10000)
        TriggerClientEvent(Config.ScriptName..":catch:RefreshSell", _source, Config.SellItems)
        Citizen.Wait(10000)
        GetRefreshedPrices = false
    end 
end) 


SendReadyRunning = false
RegisterServerEvent(GetCurrentResourceName()..':SendReady')
AddEventHandler(GetCurrentResourceName()..':SendReady', function()
    local _source = source
    if SendReadyRunning == false then 
        SendReadyRunning = true    
        print(GetCurrentResourceName()..':SendReady')

        ---- WebHooks --- 
        while WebHooksLoaded == false do 
            Citizen.Wait(100) -- this delay is to wait till the data has loaded from the database.
        end   
        TriggerClientEvent(Config.ScriptName..":catch:RefreshWebHooks", _source, Config.Webhook)
        Citizen.Wait(5000) -- delay is a throttle so the client can handle the data input. 

        ---- Store Locations and Details db vorp_stores --- 
        while StoreLocationsLoaded == false do 
            Citizen.Wait(100) -- this delay is to wait till the data has loaded from the database.
        end   
        TriggerClientEvent(Config.ScriptName..":catch:RefreshStoreLocations", _source, Config.Stores)
        Citizen.Wait(5000) -- delay is a throttle so the client can handle the data input. 
        
        ---- Store Items from items Database --- 
        while StoresLoaded == false do 
            Citizen.Wait(100) -- this delay is to wait till the data has loaded from the database.
        end   
        TriggerClientEvent(Config.ScriptName..":catch:RefreshStores", _source, Config.Stores)
        Citizen.Wait(5000) -- delay is a throttle so the client can handle the data input. 
        
        ---- Store Items Stock data from vorp_store_item  --- 
        while StoreInstockLoaded == false do 
            Citizen.Wait(100) -- this delay is to wait till the data has loaded from the database.
        end   
        TriggerClientEvent(Config.ScriptName..":catch:RefreshInStock", _source, Config.Stores)
        Citizen.Wait(5000) -- delay is a throttle so the client can handle the data input. 
    
        ---- Store Items data in buy format from above data  --- 
        while ItemsBuyLoaded == false do 
            Citizen.Wait(100) -- this delay is to wait till the data has loaded from the database.
        end   
        TriggerClientEvent(Config.ScriptName..":catch:RefreshBuy", _source, Config.BuyItems)
        Citizen.Wait(5000) -- delay is a throttle so the client can handle the data input. 
       
        ---- Store Items data in sell format from above data  --- 
        while ItemsSellLoaded == false do 
            Citizen.Wait(100) -- this delay is to wait till the data has loaded from the database.
        end   
        TriggerClientEvent(Config.ScriptName..":catch:RefreshSell", _source, Config.SellItems)
        Citizen.Wait(5000) -- delay is a throttle so the client can handle the data input. 

        SendReadyRunning = false
    end 
end)  

Citizen.CreateThread(function()  
    if Config.Install_ScriptTables == true or Config.Install_ScriptTables == 1 then
        InstallTables_()
    end 
    if Config.Install_StarterItems == true or Config.Install_StarterItems == 1 then
        InstallStock_()
    end 
end) 

Citizen.CreateThread(function()  
     
    WebHooksLoaded = false
    WebHooksLoaded = GetWebHooks_()  

    StoreLocationsLoaded = false 
    StoreLocationsLoaded = GetStores_() 

    StoreInstockLoaded = false 
    StoreInstockLoaded = GetInStock_()    

    ItemsBuyLoaded = false
    ItemsSellLoaded = false
    StoresLoaded = false 
    StoresLoaded = GetItems_() 
 
end)  