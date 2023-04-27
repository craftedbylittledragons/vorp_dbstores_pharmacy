
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


--Webhook Section, description is in translation
Config.UseWebhook = false -- Use webhook

--Mandatory Webhook Parts
Config.WebhookTitle = ""
Config.Webhook = ""

--Optional Webhook Parts, if not filled will default vorp_core config
Config.WebhookColor = ""
Config.WebhookName = ""
Config.WebhookLogo = ""
Config.WebhookLogo2 = ""
Config.WebhookAvatar = ""


    --- STORES ---

Config.Stores = {
 
-----------------------------------------------------------------------------
--------------------------------------Valentine------------------------------
-----------------------------------------------------------------------------
 
    ValPharmacy = {
        blipAllowed = true,
        BlipName = "Pharmacy",
        storeName = "Valentine Pharmacy",
        PromptName = "Pharmacy",
        sprite = 1109348405,
        x = -288.03, y = 804.23, z = 119.39, h = 297.74,
        distanceOpenStore = 2.5,
        NpcAllowed = true,
        NpcModel = "U_M_M_RHDDOCTOR_01",
        AllowedJobs = {}, -- jobs allowed
        JobGrade = 0,
        category = { "Medicine","Firstaid"},
        storeType = { "Buy", "Sell" }, -- only one type
        StoreHoursAllowed = false,
        RandomPrices = false,
        StoreOpen = 7, -- am
        StoreClose = 21 -- pm

    },  
}


-----------------------------------------------------------------------------
-------------------------------------ITEMS-----------------------------------
-----------------------------------------------------------------------------

    -- ItemLable = translate here
    -- itemName = same as in your databse
    -- curencytype = "cash" or "gold" only use one.
    -- price = numbers only
    -- desc = a description of the item
    -- category = where the item will be displayed at
 
    Pharmacy_Items_SELL = {            
    --Medicine
{ itemLabel = "Acetaminophen", itemName = "tylenol", currencyType = "cash", sellprice = 15, randomprice = math.random(40, 65), desc = "Sell Acetaminophen", category = "Medicine" },
{ itemLabel = "Plastic Surgery Appointement", itemName = "secondchance", currencyType = "cash", sellprice = 150, randomprice = math.random(40, 65), desc = "Sell Plastic Surgery Appointment", category = "Medicine" },
--Firstaid
{ itemLabel = "Bandage", itemName = "bandage", currencyType = "cash", sellprice = 10, randomprice = math.random(40, 65), desc = "Sell Bandage", category = "Firstaid" },
{ itemLabel = "Anti-Poison", itemName = "antipoison", currencyType = "cash", sellprice = 10, randomprice = math.random(40, 65), desc = "Sell Anti-Poison", category = "Firstaid" }

 }
 
-----------------------------------------------------------------------------
--------------------------------------SELL ITEMS ----------------------------
-----------------------------------------------------------------------------
Config.SellItems = {
      
    -----------------------------------------------------------------------------
    --------------------------------------Armadillo------------------------------
    -----------------------------------------------------------------------------
 
    -----------------------------------------------------------------------------
    --------------------------------------Blackwater------------------------------
    -----------------------------------------------------------------------------
  
    -----------------------------------------------------------------------------
    --------------------------------------Rhodes---------------------------------
    -----------------------------------------------------------------------------
 
    -----------------------------------------------------------------------------
    --------------------------------------St-Denis-------------------------------
    -----------------------------------------------------------------------------
 
        StDenisPharmacy = Pharmacy_Items_SELL,
    -----------------------------------------------------------------------------
    --------------------------------------Strawberry-----------------------------
    -----------------------------------------------------------------------------
 
        StrawbPharmacy = Pharmacy_Items_SELL,
    -----------------------------------------------------------------------------
    --------------------------------------Tumbleweed-----------------------------
    -----------------------------------------------------------------------------
  
    -----------------------------------------------------------------------------
    --------------------------------------Valentine------------------------------
    -----------------------------------------------------------------------------
 
        ValPharmacy = Pharmacy_Items_SELL,
    -----------------------------------------------------------------------------
    --------------------------------------Vanhorn--------------------------------
    -----------------------------------------------------------------------------
         
}

-------------------------------------ITEMS-----------------------------------
-----------------------------------------------------------------------------

    -- ItemLable = translate here
    -- itemName = same as in your databse
    -- curencytype = "cash" or "gold" only use one.
    -- price = numbers only
    -- desc = a description of the item
    -- category = where the item will be displayed at
  
   
    Pharmacy_Items_BUY = {            
    --Medicine
        { itemLabel = "Acetaminophen", itemName = "tylenol", currencyType = "cash", buyprice = 15, randomprice = math.random(40, 65), desc = "Buy Acetaminophen", category = "Medicine" },
        { itemLabel = "Plastic Surgery Appointement", itemName = "secondchance", currencyType = "cash", buyprice = 150, randomprice = math.random(40, 65), desc = "Buy Plastic Surgery Appointement", category = "Medicine" },
    --Firstaid
        { itemLabel = "Bandage", itemName = "bandage", currencyType = "cash", buyprice = 10, randomprice = math.random(40, 65), desc = "Buy Bandage", category = "Firstaid" },
        { itemLabel = "Anti-Poison", itemName = "antipoison", currencyType = "cash", buyprice = 10, randomprice = math.random(40, 65), desc = "Buy Anti-Poison", category = "Firstaid" }
    }

        
-----------------------------------------------------------------------------
--------------------------------------BUY ITEMS ----------------------------
-----------------------------------------------------------------------------
Config.BuyItems = {
    
    -----------------------------------------------------------------------------
    --------------------------------------Armadillo- ----------------------------
    -----------------------------------------------------------------------------
 
    -----------------------------------------------------------------------------
    --------------------------------------Blackwater------------------------------
    -----------------------------------------------------------------------------
 
    -----------------------------------------------------------------------------
    --------------------------------------Rhodes---------------------------------
    -----------------------------------------------------------------------------
 
    -----------------------------------------------------------------------------
    --------------------------------------St-Denis-------------------------------
    -----------------------------------------------------------------------------
 
        StDenisPharmacy = Pharmacy_Items_BUY,
    -----------------------------------------------------------------------------
    --------------------------------------Strawberry-----------------------------
    -----------------------------------------------------------------------------
 
        StrawbPharmacy = Pharmacy_Items_BUY,
    -----------------------------------------------------------------------------
    --------------------------------------Tumbleweed-----------------------------
    -----------------------------------------------------------------------------
 
    -----------------------------------------------------------------------------
    --------------------------------------Valentine------------------------------
    -----------------------------------------------------------------------------
 
        ValPharmacy = Pharmacy_Items_BUY,
    -----------------------------------------------------------------------------
    --------------------------------------Vanhorn--------------------------------
    -----------------------------------------------------------------------------
 
    
 
    
}
