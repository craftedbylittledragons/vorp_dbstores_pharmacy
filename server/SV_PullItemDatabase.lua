function GetItems_()

    local trigger_getitems = false 
    local malformed_entry = false 
    local rowtoupdate = 0
    local _category = {}

	SQL_READ_QUERY_ITEM  = "SELECT `id`, `item`, `label`, `max_carry`, " ..	 
    "  `can_sell`, `can_buy` , `valuerank`, `category` " ..	 
    " FROM `items`  WHERE `"..Config.StoreType.."` = 1;"  
    -- call the database

    exports.ghmattimysql:execute(SQL_READ_QUERY_ITEM, function(result)     	

        local ItemId = 0	
        local ItemName = "" 
        local DisplayName = ""	   
        local ValueRank = 0	   
        local MaxCarry = 0	 	  
        local CanBuy = 0	 	 
        local CanSell = 0 	 
        local Category = 0	
        local r = 0 	

        print ("GetItems_", #result)
        if result[1] ~= nil then 
            for n,m in pairs(result) do   
                if type(m) == "table" then 
                    for s,t in pairs(m) do 
                        --code goes here     
                        if(s == "id") then          if t ~= nil then    ItemId = t      end end                
                        if(s == "item") then        if t ~= nil then    ItemName = t    end end   
                        if(s == "label") then       if t ~= nil then    DisplayName = t end end   
                        if(s == "max_carry") then   if t ~= nil then    MaxCarry = t    end end    
                        if(s == "can_sell") then    if t ~= nil then    CanSell = t     end end                         
                        if(s == "can_buy") then     if t ~= nil then    CanBuy = t      end end                         
                        if(s == "valuerank") then   if t ~= nil then    ValueRank = t   end end                         
                        if(s == "category") then    if t ~= nil then    Category = t   end end                                               
                    end                     
                end   
                
                
                local base_max= ValueRank * Config.PriceMultiplier
                local not_a_decimal = math.floor(base_max * 100)   
                local made_it_a_decimal = not_a_decimal/100   
                local random_not_a_decimal = math.random( 1, not_a_decimal )     
                local random_made_it_a_decimal = random_not_a_decimal/100 

                --print ("GetItems_", n,ItemId,ItemName,DisplayName,MaxCarry,CanSell,CanBuy,ValueRank,Category)
                if CanBuy == 1 or CanBuy == true then 
                    r = #_Items_BUY +1
                    _Items_BUY[r] = {}                        
                    _Items_BUY[r]["itemLabel"] = DisplayName     
                    _Items_BUY[r]["itemName"] = ItemName     
                    _Items_BUY[r]["max_carry"] = MaxCarry    
                    _Items_BUY[r]["id"] = ItemId    
                    _Items_BUY[r]["currencyType"] = "cash"   
                    _Items_BUY[r]["valuerank"] = ValueRank      
                    _Items_BUY[r]["price"] = made_it_a_decimal      
                    _Items_BUY[r]["randomprice"] = random_made_it_a_decimal
                    _Items_BUY[r]["desc"] = "Buy a "..DisplayName
                    _Items_BUY[r]["category"] = Category    
                    _Items_SELL[r]["purchaseLimit"] = 50  --- per player purchase limit  

                    local trigger_check = false                         
                    for key,entry in pairs(_category) do  
                        if entry == Category then 
                            trigger_check = true   -- no change needed.
                        end 
                    end  
                    if trigger_check == false then                                                 
                        table.insert(_category, Category) 
                    end   
                    --print("Buy:",_Items_BUY[r]["itemLabel"],_Items_BUY[r]["itemName"],_Items_BUY[r]["price"],_Items_BUY[r]["category"])
                end 
                if CanSell == 1 or CanSell == true then 
                    r = #_Items_SELL +1
                    _Items_SELL[r] = {}                        
                    _Items_SELL[r]["itemLabel"] = DisplayName     
                    _Items_SELL[r]["itemName"] = ItemName  
                    _Items_SELL[r]["max_carry"] = MaxCarry    
                    _Items_SELL[r]["id"] = ItemId       
                    _Items_SELL[r]["currencyType"] = "cash"   
                    _Items_SELL[r]["valuerank"] = ValueRank                   
                    _Items_SELL[r]["price"] = made_it_a_decimal           
                    _Items_SELL[r]["randomprice"] = random_made_it_a_decimal
                    _Items_SELL[r]["desc"] = "Sell a "..DisplayName
                    _Items_SELL[r]["category"] = Category        
                    _Items_SELL[r]["qoh"] = 0     --- quantity sold to the store available to buy               
                    local trigger_check = false                         
                    for key,entry in pairs(_category) do  
                        if entry == Category then 
                            trigger_check = true  -- no change needed.
                        end 
                    end  
                    if trigger_check == false then                                                 
                        table.insert(_category, Category) 
                    end
                    --print("Sell:",_Items_SELL[r]["itemLabel"],_Items_SELL[r]["itemName"],_Items_SELL[r]["price"],_Items_SELL[r]["category"])       
                end 
            end        
        end 
        trigger_getitems = true
    end) -- exports.ghmattimysql:execute   

    while trigger_getitems == false do 
        Citizen.Wait(100)
    end 
      
    for key,table in pairs(Config.SellItems) do 
        Config.SellItems[key] = _Items_SELL   
    end 
    ItemsSellLoaded = true   
 
    for key,table in pairs(Config.BuyItems) do 
        Config.BuyItems[key] = _Items_BUY    
    end 
    ItemsBuyLoaded = true

    MeshStockLevels = false 
    MeshStockLevels = MeshStockLevels_() 

    for store_name,store_table in pairs(Config.Stores) do   
        Config.Stores[store_name].category = _category   
    end
    
    return(true) 
end --- end the function to load items 
 

RegisterServerEvent(GetCurrentResourceName()..':RefreshStores')
AddEventHandler(GetCurrentResourceName()..':RefreshStores', function()
    local _source = source
    while StoresLoaded == false do 
        Citizen.Wait(100)
    end 
    print(GetCurrentResourceName()..':RefreshStores')
    TriggerClientEvent(Config.ScriptName..":catch:RefreshStores", _source, Config.Stores)
    Citizen.Wait(2000) 
end) 

RegisterServerEvent(GetCurrentResourceName()..':RefreshBuy')
AddEventHandler(GetCurrentResourceName()..':RefreshBuy', function()
    local _source = source
    while StoresLoaded == false do 
        Citizen.Wait(100)
    end 
    
    for key,table in pairs(Config.BuyItems) do 
        Config.BuyItems[key] = _Items_BUY    
    end 
    ItemsBuyLoaded = true
    
    print(GetCurrentResourceName()..':RefreshBuy')
    TriggerClientEvent(Config.ScriptName..":catch:RefreshBuy", _source, Config.BuyItems)
    Citizen.Wait(2000) 
end) 

RegisterServerEvent(GetCurrentResourceName()..':RefreshSell')
AddEventHandler(GetCurrentResourceName()..':RefreshSell', function()
    local _source = source
    while StoresLoaded == false do 
        Citizen.Wait(100)
    end 
    
    for key,table in pairs(Config.SellItems) do 
        Config.SellItems[key] = _Items_SELL   
    end 
    ItemsSellLoaded = true   

    print(GetCurrentResourceName()..':RefreshSell')
    TriggerClientEvent(Config.ScriptName..":catch:RefreshSell", _source, Config.SellItems)
    Citizen.Wait(2000) 
end) 