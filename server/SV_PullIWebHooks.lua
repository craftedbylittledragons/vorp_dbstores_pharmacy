function GetWebHooks_()

    local trigger_gethooks = false 
    local malformed_entry = false 
    local rowtoupdate = 0 

	SQL_READ_QUERY_ITEM  = "SELECT * FROM `discord_webhooks`"..
    " WHERE `hook_type` = '"..Config.StoreType.."';"  
    -- call the database

    exports.ghmattimysql:execute(SQL_READ_QUERY_ITEM, function(result)     	

        local HookId = 0	
        local hook_type = "" 
        local UseWebhook = ""
        local WebhookTitle = "" 
        local WebhookChannel = "" 
        local WebhookKey  = ""	  
        local WebhookColor  = ""	 
        local WebhookName  = ""	 
        local WebhookLogo  = ""	 
        local WebhookLogo2  = ""		 
        local WebhookAvatar  = ""		 
        local r = 0 	

        print ("GetWebHooks_", #result)
        if result[1] ~= nil then 
            for n,m in pairs(result) do   
                if type(m) == "table" then 
                    for s,t in pairs(m) do 
                        --code goes here     
                        if(s == "id") then              if t ~= nil then    HookId = t          end end                
                        if(s == "hook_type") then       if t ~= nil then    hook_type = t       end end   
                        if(s == "UseWebhook") then      if t ~= nil then    UseWebhook = t      end end  
                        if(s == "WebhookTitle") then    if t ~= nil then    WebhookTitle = t    end end   
                        if(s == "WebhookChannel") then  if t ~= nil then    WebhookChannel = t  end end    
                        if(s == "WebhookKey") then      if t ~= nil then    WebhookKey = t      end end                         
                        if(s == "WebhookColor") then    if t ~= nil then    WebhookColor = t    end end                         
                        if(s == "WebhookName") then     if t ~= nil then    WebhookName = t     end end                         
                        if(s == "WebhookLogo") then     if t ~= nil then    WebhookLogo = t     end end                         
                        if(s == "WebhookLogo2") then    if t ~= nil then    WebhookLogo2 = t    end end                         
                        if(s == "WebhookAvatar") then   if t ~= nil then    WebhookAvatar = t    end end                                      
                    end                     
                end     

                if UseWebhook == true or UseWebhook == 1 then 
                    --Webhook Section, description is in translation
                    Config.Webhook.UseWebhook = UseWebhook -- Use webhook
                    --Mandatory Webhook Parts
                    Config.Webhook.WebhookTitle = WebhookTitle 
                    Config.Webhook.WebhookChannel = WebhookChannel
                    Config.Webhook.WebhookKey = WebhookKey
                    Config.Webhook.WebhookURL = "https://discord.com/api/webhooks/"..WebhookChannel.."/"..WebhookKey
                    --Optional Webhook Parts, if not filled will default vorp_core config
                    Config.Webhook.WebhookColor = WebhookColor
                    Config.Webhook.WebhookName = WebhookName
                    Config.Webhook.WebhookLogo = WebhookLogo
                    Config.Webhook.WebhookLogo2 = WebhookLogo2
                    Config.Webhook.WebhookAvatar = WebhookAvatar
                end             
            end     
        end 
        trigger_gethooks = true
    end) -- exports.ghmattimysql:execute   
    while trigger_gethooks == false do 
        Citizen.Wait(100)
    end  
    return(true) 
end --- end the function to load items 
    
RegisterServerEvent(GetCurrentResourceName()..':RefreshWebHooks')
AddEventHandler(GetCurrentResourceName()..':RefreshWebHooks', function()
    local _source = source
    while WebHooksLoaded == false do 
        Citizen.Wait(100)
    end 
    print(GetCurrentResourceName()..':RefreshWebHooks')
    TriggerClientEvent(Config.ScriptName..":catch:RefreshWebHooks", _source, Config.Webhook)
    Citizen.Wait(2000) 
end)  