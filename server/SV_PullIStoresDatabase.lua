function GetStores_()

    local trigger_getstores = false 
    local malformed_entry = false 
    local rowtoupdate = 0 

	SQL_READ_QUERY_ITEM  = "SELECT * FROM `vorp_stores`"..
    " WHERE `store_type` = '"..Config.StoreType.."';"  
    -- call the database

    exports.ghmattimysql:execute(SQL_READ_QUERY_ITEM, function(GetStores_result)     	

        local StoreId = 0	
        local storeVarName = "" 
        local activeStore = ""
        local storeName = "" 
        local store_type = "" 
        local blipAllowed  = ""	  
        local BlipName  = ""	 
        local PromptName  = ""	 
        local sprite  = ""	 
        local vector_x  = 0	 
        local vector_y  = 0	 
        local vector_z  = 0	 
        local vector_h = 0	   
        local distanceOpenStore = 0	 	  
        local NpcAllowed = 0	 	 
        local NpcModel = 0 	 
        local AllowedJobs = 0	  
        local JobGrade = 0	 	 
        local category = 0 	 
        local storeType = 0	
        local StoreHoursAllowed = 0	
        local RandomPrices = 0	
        local StoreOpen = 0	
        local StoreClose = 0	
        local r = 0 	

        print ("GetStores_", #GetStores_result)
        if GetStores_result[1] ~= nil then 
            for n,m in pairs(GetStores_result) do   
                if type(m) == "table" then 
                    for s,t in pairs(m) do 
                        --code goes here     
                        if(s == "id") then          if t ~= nil then    StoreId = t      end end                
                        if(s == "store_type") then  if t ~= nil then    store_type = t    end end   
                        if(s == "activeStore") then  if t ~= nil then    activeStore = t    end end  
                        if(s == "store_var_name") then  if t ~= nil then storeVarName = t end end   
                        if(s == "blipAllowed") then if t ~= nil then    blipAllowed = t    end end    
                        if(s == "BlipName") then    if t ~= nil then    BlipName = t     end end                         
                        if(s == "storeName") then   if t ~= nil then    storeName = t      end end                         
                        if(s == "PromptName") then  if t ~= nil then    PromptName = t   end end                         
                        if(s == "sprite") then      if t ~= nil then    sprite = t   end end                         
                        if(s == "vector_x") then    if t ~= nil then    vector_x = t   end end                        
                        if(s == "vector_y") then    if t ~= nil then    vector_y = t   end end                        
                        if(s == "vector_z") then    if t ~= nil then    vector_z = t   end end                        
                        if(s == "vector_h") then    if t ~= nil then    vector_h = t   end end                        
                        if(s == "distanceOpenStore") then   if t ~= nil then    distanceOpenStore = t   end end                        
                        if(s == "NpcAllowed") then  if t ~= nil then    NpcAllowed = t   end end                        
                        if(s == "NpcModel") then    if t ~= nil then    NpcModel = t   end end                        
                        if(s == "AllowedJobs") then if t ~= nil then    AllowedJobs = t   end end                        
                        if(s == "JobGrade") then    if t ~= nil then    JobGrade = t   end end                        
                        if(s == "category") then    if t ~= nil then    category = t   end end                        
                        if(s == "storeType") then   if t ~= nil then    storeType = t   end end                        
                        if(s == "StoreHoursAllowed") then   if t ~= nil then    StoreHoursAllowed = t   end end                        
                        if(s == "RandomPrices") then    if t ~= nil then    RandomPrices = t   end end                        
                        if(s == "StoreOpen") then   if t ~= nil then    StoreOpen = t   end end                        
                        if(s == "StoreClose") then  if t ~= nil then    StoreClose = t   end end                                              
                    end                     
                end     

                if activeStore == true or activeStore == 1 then 
                    Config.Stores[storeVarName] = {}
                    Config.SellItems[storeVarName] = {}  
                    Config.BuyItems[storeVarName] = {}  
                    Config.Stores[storeVarName].StoreId = StoreId
                    Config.Stores[storeVarName].store_type = store_type
                    Config.Stores[storeVarName].activeStore = activeStore
                    Config.Stores[storeVarName].blipAllowed = blipAllowed
                    Config.Stores[storeVarName].BlipName = BlipName
                    Config.Stores[storeVarName].storeName = storeName
                    Config.Stores[storeVarName].PromptName = PromptName
                    Config.Stores[storeVarName].sprite = tonumber(sprite)
                    Config.Stores[storeVarName].x = tonumber(vector_x)
                    Config.Stores[storeVarName].y = tonumber(vector_y)
                    Config.Stores[storeVarName].z = tonumber(vector_z)
                    Config.Stores[storeVarName].h = tonumber(vector_h)
                    Config.Stores[storeVarName].distanceOpenStore = tonumber(distanceOpenStore)
                    Config.Stores[storeVarName].NpcAllowed = NpcAllowed
                    Config.Stores[storeVarName].NpcModel = NpcModel 
                    if AllowedJobs == "{}" then
                        Config.Stores[storeVarName].AllowedJobs = {}
                    else 
                        Config.Stores[storeVarName].AllowedJobs = {}
                    end 
                    Config.Stores[storeVarName].JobGrade = tonumber(JobGrade)
                    if category == "{}" then
                        Config.Stores[storeVarName].category = {}
                    end  
                    if storeType == '{ "Buy", "Sell" }' then
                        Config.Stores[storeVarName].storeType = { "Buy","Sell" }
                    else 
                        Config.Stores[storeVarName].storeType = { "Buy","Sell" }
                    end 
                    Config.Stores[storeVarName].StoreHoursAllowed = StoreHoursAllowed
                    Config.Stores[storeVarName].RandomPrices = RandomPrices
                    Config.Stores[storeVarName].StoreOpen = tonumber(StoreOpen)
                    Config.Stores[storeVarName].StoreClose = tonumber(StoreClose) 
                end             
            end     
        end 
        trigger_getstores = true
    end) -- exports.ghmattimysql:execute   
    while trigger_getstores == false do 
        Citizen.Wait(100)
    end     
    return(true) 
end --- end the function to load items 
    
RegisterServerEvent(GetCurrentResourceName()..':RefreshStoreLocations')
AddEventHandler(GetCurrentResourceName()..':RefreshStoreLocations', function()
    local _source = source
    while StoresLoaded == false do 
        Citizen.Wait(100)
    end 
    print(GetCurrentResourceName()..':RefreshStoreLocations')
    TriggerClientEvent(Config.ScriptName..":catch:RefreshStoreLocations", _source, Config.Stores)
    Citizen.Wait(2000) 
end)  