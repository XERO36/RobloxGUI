local function getPlayer()
    return plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
end

local function bringItems(itemName)
    local root = getPlayer()
    if not root then return end
    
    for i,v in pairs(workspace.Items:GetChildren()) do
        if string.find(string.lower(v.Name), string.lower(itemName)) then
            local part = v:FindFirstChildOfClass("BasePart")
            if part then
                part.CFrame = root.CFrame * CFrame.new(math.random(-3,3), 2, math.random(-3,3))
            end
        end
    end
end
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

local bringmeat = mainTab:AddButton({
    Name = "Bring all Meat",
    Default = false,
    Callback = function()
        local campfire = Vector3.new(1.87, 4.33, -3.67)
        for i,v in pairs(workspace.Items:GetChildren()) do
            if string.find(string.lower(v.Name), "meat") then
                local part = v:FindFirstChildOfClass("BasePart")
                if part then
                    part.CFrame = CFrame.new(campfire + Vector3.new(math.random(-1,1), 1, math.random(-1,1)))
                end
            end
        end
    end
})


-- the end 
imgui:notify("99 nights in the forest Script", "Successfully executed!", "rbxassetid://6031091004")

