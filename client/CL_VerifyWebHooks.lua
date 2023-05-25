     
RegisterNetEvent(Config.ScriptName..":catch:RefreshWebHooks")
AddEventHandler(Config.ScriptName..":catch:RefreshWebHooks", function(WebhookData) 
	print(Config.ScriptName..":catch:RefreshWebHooks")  
	Config.Webhook = WebhookData	
end)  