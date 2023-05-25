
function InstallStock_()   
    for store_name,store_table in pairs(Config.Stores) do    
        Store_Id = Config.Stores[store_name].StoreId 
        Store_Active = Config.Stores[store_name].activeStore 
        Store_Name = Config.Stores[store_name].storeName         
        Store_Type = Config.Stores[storeVarName].store_type 

        if Store_Active == true or Store_Active == 1 then 
            Items_to_Sell = Config.SellItems[store_name]

            for item_rand_key,item_data in pairs(Items_to_Sell) do 
                print("item_rand_key,item_data",item_rand_key,item_data)  
                DisplayName = _Items_SELL[item_rand_key]["itemLabel"]
                Item_Name = Items_to_Sell[item_rand_key]["itemName"]  
                Max_Carry = Items_to_Sell[item_rand_key]["max_carry"]  
                Item_Id = Items_to_Sell[item_rand_key]["id"]          
                QuantityOnHand = Items_to_Sell[item_rand_key]["qoh"]      
                print(Store_Id, Store_Active, Store_Name, Item_Name, Max_Carry, Item_Id, QuantityOnHand)
            
                SQL_READ_QUERY_ITEM  = "INSERT INTO `vorp_store_item` "..
                                    "(`id`, `store_id`, `store_name`, `store_type`, ".. 
                                    "`item_id`, `item_name`, `in_stock`)"..
                                    " VALUES (NULL, '"..Store_Id.."', "..
                                    "'"..Store_Name.."', "..
                                    "'"..Store_Type.."', "..
                                    "'"..Item_Id.."', "..
                                    "'"..Item_Name.."', "..
                                    "'"..Config.StarterQuantity.."');"                                       

                exports.ghmattimysql:execute(SQL_READ_QUERY_ITEM, function(InStockItems_result)                      
                    print(Store_Id, Store_Active, Store_Name, Item_Name, Item_Id, Store_Type)
                    if InStockItems_result[1] ~= nil then        
                    end 
                end)  -- exports.ghmattimysql:execute  
            end                 
        end  
    end  
end --- end the function to load items 