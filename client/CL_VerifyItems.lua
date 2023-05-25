
     
RegisterNetEvent(Config.ScriptName..":catch:RefreshStores")
AddEventHandler(Config.ScriptName..":catch:RefreshStores", function(StoresData) 
	print(Config.ScriptName..":catch:RefreshStores")  
	Config.Stores = StoresData	
end) 
 
RegisterNetEvent(Config.ScriptName..":catch:RefreshBuy")
AddEventHandler(Config.ScriptName..":catch:RefreshBuy", function(BuyItemsData)  	
	print(Config.ScriptName..":catch:RefreshBuy") 
	Config.BuyItems = BuyItemsData	
end) 
 
RegisterNetEvent(Config.ScriptName..":catch:RefreshSell")
AddEventHandler(Config.ScriptName..":catch:RefreshSell", function(SellItemsData) 	
	print(Config.ScriptName..":catch:RefreshSell") 
	Config.SellItems = SellItemsData	
end) 
 
RegisterCommand(Config.StoreType..":RefreshStorePrices", function() 
	TriggerServerEvent(Config.ScriptName..":RefreshStorePrices")
end)
RegisterCommand(Config.StoreType..":RefreshBuy", function() 
	TriggerServerEvent(Config.ScriptName..":RefreshBuy")
end)
RegisterCommand(Config.StoreType..":RefreshSell", function() 
	TriggerServerEvent(Config.ScriptName..":RefreshSell")
end)
RegisterCommand(Config.StoreType..":RefreshStores", function() 
	TriggerServerEvent(Config.ScriptName..":RefreshStores")
end)
 