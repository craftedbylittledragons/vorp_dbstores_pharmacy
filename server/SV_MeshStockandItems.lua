function MeshStockLevels_()     
    for store_name,store_table in pairs(Config.Stores) do    
        Store_Id = Config.Stores[store_name].StoreId 
        Store_Active = Config.Stores[store_name].activeStore 
        Store_Name = Config.Stores[store_name].storeName         
        if Store_Active == true or Store_Active == 1 then 
            Items_to_Sell = Config.SellItems[store_name]
            for item_rand_key,item_data in pairs(Items_to_Sell) do 
                print("item_rand_key,item_data",item_rand_key,item_data)  
                Item_Name = Items_to_Sell[item_rand_key]["itemName"]  
                Max_Carry = Items_to_Sell[item_rand_key]["max_carry"]  
                Item_Id = Items_to_Sell[item_rand_key]["id"]          
                QuantityOnHand = Items_to_Sell[item_rand_key]["qoh"] 
                if storeStock[store_name][Item_Id].in_stock < QuantityOnHand then 
                    Config.SellItems[store_name][item_rand_key]["qoh"] = storeStock[store_name][Item_Id].in_stock 
                    print(Store_Id, Store_Active, Store_Name, Item_Name, Max_Carry, Item_Id, QuantityOnHand)
                end  
            end
        end      
    end 
end