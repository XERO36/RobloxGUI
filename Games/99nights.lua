local imgui = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/XERO36/RobloxGUI/refs/heads/main/CustomImGUI/source.lua"
))()

local plr = game.Players.LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")

----------------------------------------------------
-- SETTINGS
----------------------------------------------------

local settings = {
    noclip = false,
    playerEsp = false,
    itemEsp = false,
    wolfHitbox = false,
    hitboxSize = 15,
    autoCollect = false
}

----------------------------------------------------
-- HELPERS
----------------------------------------------------

local function getRoot()
    local char = plr.Character or plr.CharacterAdded:Wait()
    return char:FindFirstChild("HumanoidRootPart")
end

local function notify(title, text)
    imgui:notify(
        title,
        text,
        "rbxassetid://6031091004"
    )
end

local function bringItems(itemName)

    local root = getRoot()
    if not root then return end

    for _,v in pairs(workspace.Items:GetChildren()) do

        if string.find(
            string.lower(v.Name),
            string.lower(itemName)
        ) then

            local part = v:FindFirstChildWhichIsA("BasePart")

            if part then
                part.CFrame =
                    root.CFrame
                    * CFrame.new(
                        math.random(-4,4),
                        2,
                        math.random(-4,4)
                    )
            end
        end
    end
end

----------------------------------------------------
-- ESP
----------------------------------------------------

local function createESP(obj,color,text)

    if not obj or obj:FindFirstChild("NightESP") then
        return
    end

    local folder = Instance.new("Folder")
    folder.Name = "NightESP"
    folder.Parent = obj

    local hl = Instance.new("Highlight")
    hl.Parent = folder
    hl.FillTransparency = 1
    hl.OutlineColor = color
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

    local gui = Instance.new("BillboardGui")
    gui.Parent = folder
    gui.Size = UDim2.new(0,100,0,40)
    gui.StudsOffset = Vector3.new(0,3,0)
    gui.AlwaysOnTop = true

    local label = Instance.new("TextLabel")
    label.Parent = gui
    label.Size = UDim2.new(1,0,1,0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextScaled = true
    label.TextColor3 = color
    label.Font = Enum.Font.GothamBold
end

local function removeESP(obj)

    if obj and obj:FindFirstChild("NightESP") then
        obj.NightESP:Destroy()
    end
end

----------------------------------------------------
-- WINDOW
----------------------------------------------------

local window = imgui:createWindow({
    Main = {
        Name = "99 Nights",
        Creator = "ShadowDev"
    }
})

local mainTab = window:createTab("Main")
local playerTab = window:createTab("Player")
local espTab = window:createTab("ESP")
local miscTab = window:createTab("Misc")

----------------------------------------------------
-- MAIN
----------------------------------------------------

mainTab:AddLabel("Item Functions")

mainTab:AddButton({
    Name = "Bring Meat",
    Callback = function()
        bringItems("meat")
        notify("Items","Brought meat")
    end
})

mainTab:AddButton({
    Name = "Bring Wood",
    Callback = function()
        bringItems("wood")
        notify("Items","Brought wood")
    end
})

mainTab:AddButton({
    Name = "Bring Scrap",
    Callback = function()
        bringItems("scrap")
        notify("Items","Brought scrap")
    end
})

mainTab:AddButton({
    Name = "Bring Everything",
    Callback = function()

        local root = getRoot()
        if not root then return end

        for _,v in pairs(workspace.Items:GetChildren()) do

            local part =
                v:FindFirstChildWhichIsA("BasePart")

            if part then

                part.CFrame =
                    root.CFrame
                    * CFrame.new(
                        math.random(-8,8),
                        2,
                        math.random(-8,8)
                    )
            end
        end

        notify("Items","Brought all items")
    end
})

mainTab:AddToggle({
    Name = "Auto Collect Meat",
    Default = false,
    Callback = function(v)

        settings.autoCollect = v

        while settings.autoCollect do
            bringItems("meat")
            task.wait(1)
        end
    end
})

----------------------------------------------------
-- PLAYER
----------------------------------------------------

playerTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(v)

        local hum =
            plr.Character
            and plr.Character:FindFirstChild("Humanoid")

        if hum then
            hum.WalkSpeed = v
        end
    end
})

playerTab:AddSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 200,
    Default = 50,
    Callback = function(v)

        local hum =
            plr.Character
            and plr.Character:FindFirstChild("Humanoid")

        if hum then
            hum.JumpPower = v
        end
    end
})

playerTab:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = function(v)

        settings.noclip = v

        while settings.noclip do

            if plr.Character then

                for _,part in pairs(
                    plr.Character:GetDescendants()
                ) do

                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end

            runService.Stepped:Wait()
        end
    end
})

----------------------------------------------------
-- ESP
----------------------------------------------------

espTab:AddToggle({
    Name = "Player ESP",
    Default = false,
    Callback = function(v)

        settings.playerEsp = v

        while settings.playerEsp do

            for _,p in pairs(
                game.Players:GetPlayers()
            ) do

                if p ~= plr and p.Character then

                    createESP(
                        p.Character,
                        Color3.fromRGB(0,255,0),
                        p.Name
                    )
                end
            end

            task.wait(1)
        end

        for _,p in pairs(game.Players:GetPlayers()) do
            if p.Character then
                removeESP(p.Character)
            end
        end
    end
})

espTab:AddToggle({
    Name = "Item ESP",
    Default = false,
    Callback = function(v)

        settings.itemEsp = v

        while settings.itemEsp do

            for _,item in pairs(
                workspace.Items:GetChildren()
            ) do

                createESP(
                    item,
                    Color3.fromRGB(255,255,0),
                    item.Name
                )
            end

            task.wait(2)
        end

        for _,item in pairs(
            workspace.Items:GetChildren()
        ) do
            removeESP(item)
        end
    end
})

----------------------------------------------------
-- HITBOX
----------------------------------------------------

espTab:AddToggle({
    Name = "Wolf Hitbox",
    Default = false,
    Callback = function(v)
        settings.wolfHitbox = v
    end
})

espTab:AddSlider({
    Name = "Hitbox Size",
    Min = 5,
    Max = 40,
    Default = 15,
    Callback = function(v)
        settings.hitboxSize = v
    end
})

task.spawn(function()

    while true do

        if settings.wolfHitbox then

            for _,mob in pairs(
                workspace.Characters:GetChildren()
            ) do

                if mob.Name:lower():find("wolf") then

                    local hrp =
                        mob:FindFirstChild(
                            "HumanoidRootPart"
                        )

                    if hrp then

                        hrp.Size = Vector3.new(
                            settings.hitboxSize,
                            settings.hitboxSize,
                            settings.hitboxSize
                        )

                        hrp.Transparency = 0.5
                        hrp.Material =
                            Enum.Material.ForceField

                        hrp.CanCollide = false
                    end
                end
            end
        end

        task.wait(1)
    end
end)

----------------------------------------------------
-- MISC
----------------------------------------------------

miscTab:AddButton({
    Name = "Teleport Camp",
    Callback = function()

        local root = getRoot()

        if root then
            root.CFrame = CFrame.new(13,4,0)
        end
    end
})

miscTab:AddButton({
    Name = "Instant Prompts",
    Callback = function()

        for _,v in pairs(
            workspace:GetDescendants()
        ) do

            if v:IsA("ProximityPrompt") then
                v.HoldDuration = 0
            end
        end

        notify("Misc","Instant prompts enabled")
    end
})

----------------------------------------------------
-- DONE
----------------------------------------------------

notify(
    "99 Nights",
    "Loaded Successfully"
)
