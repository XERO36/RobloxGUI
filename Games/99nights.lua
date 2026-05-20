local heal = {"MedKit", "Bandage"}
local fuel = {"Fuel Canister", "Coal", "Log", "Bio Fuel", "Oil Barrel", "Cultist", "Crossbow Cultist", "Wolf Corpse", "Alpha Wolf Corpse", "Bear Corpse"}
local Scraps = {"Old Radio", "Sheet Metal", "Bolt", "UFO Junk", "UFO Component", "Broken Fan", "Broken Microwave", "Tyre", "Metal Chair", "Old Car Engine", "Washing Machine", "Cultist Experiment", "Cultist Prototype", "UFO Scrap"}
local Ammo = {"Revolver Ammo", "Rifle Ammo", "Shotgun Ammo"}
local Armor = {"Leather Body", "Iron Body", "Thorn Body", "Riot Shield", "Alien Armor"}
local weapons = {"Spear", "Morningstar", "Laser Sword", "Ice Sword", "Revolver", "Rifle", "Shotgun"}
local eatable = {"Carrot", "Berry", "Chilli", "Apple", "Cooked Morsel", "Cooked Steak"}
local tobring = {"Carrot", "Berry", "Chilli", "Apple", "Morsel", "Steak"}
local enemys = workspace:FindFirstChild("Characters") -- but check each item inside the folder without getting the players body yk what I mean
local feedFire = false
local lookingforpl = false
-- Example layout setup if loading inline
local imgui = loadstring(game:HttpGet("https://raw.githubusercontent.com/XERO36/RobloxGUI/refs/heads/main/CustomImGUI/source.lua"))()

local window = imgui:createWindow({
    Main = {
        Name = "99 Nights in The Forest",
        Creator = "ShadowDev"
    }
})
local mainTab = window:createTab("Main")
local visualTab = window:createTab("Visual")
local MFunc = mainTab:AddLabel("Main functions")
local autoFire = mainTab:AddToggle({
    Name = "Auto Fire",
    Default = false,
    Callback = function(state)
        -- auto fire function 
    end
})
for _, in ipairs(Scraps) do 
  local killBtn = mainTab:AddButton({
    Name = Scraps,
    Callback = function()
        -- bring
    end
})
end

local MValuer = mainTab:AddLabel("Main Values for the Main functions")
