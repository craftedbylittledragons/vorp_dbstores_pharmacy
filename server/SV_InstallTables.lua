function InstallTables_()   

    SQL_INSERT_QUERY_ITEM  = "CREATE TABLE `vorp_store_item` ( " ..
    " `id` int(255) NOT NULL COMMENT 'unique id auto assigned',"..
    " `store_id` int(255) NOT NULL COMMENT 'store id in vorp_stores',"..
    " `store_name` varchar(255) NOT NULL,"..
    " `store_type` varchar(255) NOT NULL,"..
    " `item_id` int(255) NOT NULL COMMENT 'id for item in items db',"..
    " `item_name` varchar(255) NOT NULL,"..
    " `in_stock` int(255) NOT NULL COMMENT 'quantity on hand'"..
    " ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;"                                     

    exports.ghmattimysql:execute(SQL_INSERT_QUERY_ITEM, function(InstallTables_result)                      
        print(Store_Id, Store_Active, Store_Name, Item_Name, Item_Id, Store_Type)
        if InstallTables_result[1] ~= nil then        
        end 
    end)  -- exports.ghmattimysql:execute  

    SQL_INSERT_QUERY_ITEM  = "CREATE TABLE `vorp_stores` (" ..
    " `id` int(11) NOT NULL COMMENT 'auto assigned no not change'," ..
    " `store_type` varchar(50) NOT NULL COMMENT 'store type match items flags columns'," ..
    " `store_var_name` varchar(75) NOT NULL COMMENT 'string '," ..
    " `activeStore` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = on 0 = off'," ..
    " `blipAllowed` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = yes 0 = no'," ..
    " `BlipName` varchar(75) NOT NULL COMMENT 'string '," ..
    " `storeName` varchar(75) NOT NULL COMMENT 'string '," ..
    " `PromptName` varchar(25) NOT NULL COMMENT 'string '," ..
    " `sprite` varchar(25) NOT NULL COMMENT 'in game sprite hash code'," ..
    " `vector_x` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'position of the npc and store'," ..
    " `vector_y` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'position of the npc and store'," ..
    " `vector_z` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'position of the npc and store'," ..
    " `vector_h` decimal(10,3) NOT NULL DEFAULT 0.000 COMMENT 'position of the npc and store'," ..
    " `distanceOpenStore` decimal(10,3) NOT NULL DEFAULT 2.500 COMMENT 'distance between player and store to pop menu prompt'," ..
    " `NpcAllowed` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = yes 0 = no'," ..
    " `NpcModel` varchar(255) NOT NULL DEFAULT 'MP_CAMPDEF_gaptoothbreach_females_01' COMMENT 'in game model to load'," ..
    " `AllowedJobs` varchar(255) NOT NULL DEFAULT '{}' COMMENT 'string of allowed jobs'," ..
    " `JobGrade` int(2) NOT NULL DEFAULT 0 COMMENT '1 to 99'," ..
    " `category` varchar(255) NOT NULL DEFAULT '{}' COMMENT 'do not change'," ..
    " `storeType` varchar(255) NOT NULL DEFAULT '{ \"Buy\",\"Sell\" }' COMMENT 'do not change'," ..
    " `StoreHoursAllowed` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = yes 0 = no'," ..
    " `RandomPrices` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = yes 0 = no'," ..
    " `StoreOpen` int(3) NOT NULL DEFAULT 7 COMMENT 'interger 0 to 23'," ..
    " `StoreClose` int(3) NOT NULL DEFAULT 21 COMMENT 'interger 0 to 23'" ..
    " ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;"                                     

    exports.ghmattimysql:execute(SQL_INSERT_QUERY_ITEM, function(InstallTables_result)                      
        print(Store_Id, Store_Active, Store_Name, Item_Name, Item_Id, Store_Type)
        if InstallTables_result[1] ~= nil then        
        end 
    end)  -- exports.ghmattimysql:execute  

end 