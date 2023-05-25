
Config = {}
Config.ScriptName = GetCurrentResourceName()
    -- TODO
    -- CAMERA FACE NPC
    -- NPC ANIMATION

    --menu position
    -- "center" / "top-left" / "top-right"
Config.Align = "top-left"
Config.defaultlang = "en_lang"

       -- open stores
Config.Key = 0x760A9C6F --[G]

Config.PriceMultiplier = 0.11
Config.StoreType = "pharmacy"
Config.Install_ScriptTables = false 
Config.Install_StarterItems = true 
Config.StarterQuantity = 50

--Webhook Section, description is in translation
Config.Webhook = {
    UseWebhook = false, -- Use webhook
    --Mandatory Webhook Parts
    WebhookTitle = "",
    WebhookURL = "",
    WebhookChannel = "",
    WebhookKey = "",
    --Optional Webhook Parts, if not filled will default vorp_core config
    WebhookColor = "",
    WebhookName = "",
    WebhookLogo = "",
    WebhookLogo2 = "",
    WebhookAvatar = "",
}

--- STORES ---
Config.Stores = { } 
--- ITEMS ---
_Items_SELL = { }
_Items_BUY = { }
--- BUY OR SELL ---
Config.SellItems = { } 
Config.BuyItems = { }
