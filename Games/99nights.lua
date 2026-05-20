local heal = {"MedKit", "Bandage"}
local fuel = {"Fuel Canister", "Coal", "Log", "Bio Fuel", "Oil Barrel", "Cultist", "Crossbow Cultist", "Wolf Corpse", "Alpha Wolf Corpse", "Bear Corpse"}
local Scraps = {"Old Radio", "Sheet Metal", "Bolt", "UFO Junk", "UFO Component", "Broken Fan", "Broken Microwave", "Tyre", "Metal Chair", "Old Car Engine", "Washing Machine", "Cultist Experiment", "Cultist Prototype", "UFO Scrap"}
local Ammo = {"Revolver Ammo", "Rifle Ammo", "Shotgun Ammo"}
local Armor = {"Leather Body", "Iron Body", "Thorn Body", "Riot Shield", "Alien Armor"}
local weapons = {"Spear", "Morningstar", "Laser Sword", "Ice Sword", "Revolver", "Rifle", "Shotgun"}
local eatable = {"Carrot", "Berry", "Chilli", "Apple", "Cooked Morsel", "Cooked Steak"}
local tobring = {"Carrot", "Berry", "Chilli", "Apple", "Morsel", "Steak"}

local enemys = workspace:FindFirstChild("Characters")

local feedFire = false
local lookingforpl = false

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
        feedFire = state
        
        if state then
            print("Auto fire enabled")
        else
            print("Auto fire disabled")
        end
    end
})

-- Create buttons for each scrap item
for _, scrapName in ipairs(Scraps) do
    mainTab:AddButton({
        Name = scrapName,
        Callback = function()
            print("Bring:", scrapName)

            -- your bring code here
        end
    })
end

local MValuer = mainTab:AddLabel("Main Values for the Main functions")






-- the end 
imgui:notify("99 nights in the forest Script", "Successfully executed!", "rbxassetid://6031091004")

