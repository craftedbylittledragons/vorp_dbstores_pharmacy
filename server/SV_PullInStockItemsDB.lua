function GetInStock_() 

    storeStock = {}
    trigger_itemsstores = false
    print("Config.Stores", Config.Stores, #Config.Stores) 
    for key,StoreTable in pairs(Config.Stores) do
        if Config.Stores[key].activeStore == true or Config.Stores[key].activeStore == 1 then  
            SQL_READ_QUERY_ITEM  = "SELECT * FROM `vorp_store_item` WHERE `store_id` = '"..Config.Stores[key].StoreId.."';"   
            exports.ghmattimysql:execute(SQL_READ_QUERY_ITEM, function(InStockItems_result)     	
                local id = "" 
                local store_id = 0	
                local store_type  = "" 
                local item_id  = ""
                local in_stock = ""  
                local r = 0 	

                print ("GetStoresItems_", #InStockItems_result)
                if InStockItems_result[1] ~= nil then 
                    for n,m in pairs(InStockItems_result) do   
                        if type(m) == "table" then 
                            for s,t in pairs(m) do      
                                if(s == "id")           then    if t ~= nil then    id = t          end end                
                                if(s == "store_id")     then    if t ~= nil then    store_id = t    end end   
                                if(s == "store_type")   then    if t ~= nil then    store_type = t  end end  
                                if(s == "item_id")      then    if t ~= nil then    item_id = t     end end   
                                if(s == "in_stock")     then    if t ~= nil then    in_stock = t    end end                                                      
                            end                     
                        end  
                        storeStock[storeId] = {}
                        storeStock[storeId][item_id] = {}
                        storeStock[storeId][item_id].id = id 
                        storeStock[storeId][item_id].store_id = store_id  
                        storeStock[storeId][item_id].store_type = store_type   
                        storeStock[storeId][item_id].item_id = item_id    
                        storeStock[storeId][item_id].in_stock = in_stock   
                    end     
                end 
                trigger_itemsstores = true
            end)  -- exports.ghmattimysql:execute   
            while trigger_itemsstores == false do 
                Citizen.Wait(100)
            end    
        end  
    end 
    return(true) 
end --- end the function to load items 
    
RegisterServerEvent(GetCurrentResourceName()..':RefreshInStock')
AddEventHandler(GetCurrentResourceName()..':RefreshInStock', function()
    local _source = source
    print(GetCurrentResourceName()..':RefreshInStock')
    while StoresLoaded == false do 
        Citizen.Wait(100)
    end 
    print(GetCurrentResourceName()..':sendShopStock')
    TriggerClientEvent(Config.ScriptName..":sendShopStock", _source, storeStock)
    Citizen.Wait(2000) 
end)  