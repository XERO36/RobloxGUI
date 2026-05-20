local imgui = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/HacksCreator102/ImGUI-/refs/heads/main/source.lua"
))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer

--// SETTINGS
local running = false
local currentPosition = 0
local teleportDelay = 1.2

local autoPlatform = true
local platformTransparency = 0
local platformMaterial = Enum.Material.Neon

local walkSpeedValue = 16
local jumpPowerValue = 50

local spawnedPlatforms = {}

local positions = {
    CFrame.new(-51.5656433, 65.0000458, 1369.09009),
    CFrame.new(-51.5656433, 65.0000458, 2139.09009),
    CFrame.new(-51.5656433, 65.0000458, 2909.09009),
    CFrame.new(-51.5656433, 65.0000458, 3679.09009),
    CFrame.new(-51.5656433, 65.0000458, 4449.08984),
    CFrame.new(-53.5669785, 72.6005325, 5218.14209),
    CFrame.new(-51.5656433, 65.0000458, 5989.08984),
    CFrame.new(-51.5656433, 65.0000458, 6759.08984),
    CFrame.new(-51.5656433, 65.0000458, 7529.08984),
    CFrame.new(-51.5656433, 65.0000458, 8299.08984),
    CFrame.new(-55.7065125, -358.739624, 9492.35645)
}

--// HELPERS
local function getCharacter()
    return lp.Character or lp.CharacterAdded:Wait()
end

local function getHRP()
    return getCharacter():WaitForChild("HumanoidRootPart")
end

local function getHumanoid()
    return getCharacter():WaitForChild("Humanoid")
end

--// PLATFORM
local function createPlatform(cf)

    if not autoPlatform then
        return
    end

    local platform = Instance.new("Part")

    platform.Name = "BABFT_PLATFORM"
    platform.Anchored = true
    platform.CanCollide = true
    platform.Size = Vector3.new(30,1,30)

    --// -5 below player
    platform.CFrame = cf * CFrame.new(0,-5,0)

    platform.Material = platformMaterial
    platform.Transparency = platformTransparency

    platform.Color = Color3.fromRGB(0,255,255)

    platform.Parent = workspace

    table.insert(spawnedPlatforms, platform)
end

local function clearPlatforms()

    for _,v in pairs(spawnedPlatforms) do
        pcall(function()
            v:Destroy()
        end)
    end

    table.clear(spawnedPlatforms)

    imgui:notify(
        "Platforms",
        "Cleared all platforms",
        "rbxassetid://6031071053"
    )
end

--// AUTOFARM
local function stopFarm()

    running = false

    imgui:notify(
        "BABFT",
        "Autofarm Disabled",
        "rbxassetid://6031091004"
    )
end

local function startFarm()

    if running then
        return
    end

    running = true

    imgui:notify(
        "BABFT",
        "Autofarm Enabled",
        "rbxassetid://6031075938"
    )

    task.spawn(function()

        while running do

            for i, cf in ipairs(positions) do

                if not running then
                    break
                end

                pcall(function()

                    local hrp = getHRP()

                    if hrp then

                        createPlatform(cf)

                        hrp.CFrame = cf

                        currentPosition = i
                    end
                end)

                task.wait(teleportDelay)
            end

            task.wait(25)
        end
    end)
end

--// WINDOW
local window = imgui:createWindow({

    Main = {
        Name = "VCL Hub",
        Creator = "Denis"
    }
})

--// AUTOFARM TAB
local autofarm = window:createTab("Autofarm")

local statusLabel = autofarm:AddLabel("Status : Stopped")
local positionLabel = autofarm:AddLabel("Position : 0")

autofarm:AddToggle({
    Name = "Enable Autofarm",
    Default = false,

    Callback = function(v)

        if v then
            startFarm()
        else
            stopFarm()
        end
    end
})

autofarm:AddToggle({
    Name = "Auto Platform",
    Default = true,

    Callback = function(v)

        autoPlatform = v

        imgui:notify(
            "Platform",
            "Auto Platform : "..tostring(v),
            "rbxassetid://6031280882"
        )
    end
})

autofarm:AddSlider({
    Name = "Teleport Delay",
    Min = 1,
    Max = 10,
    Default = 1,

    Callback = function(v)

        teleportDelay = v
    end
})

autofarm:AddSlider({
    Name = "Platform Transparency",
    Min = 0,
    Max = 10,
    Default = 0,

    Callback = function(v)

        platformTransparency = v / 10
    end
})

autofarm:AddButton({
    Name = "Clear Platforms",

    Callback = function()
        clearPlatforms()
    end
})

autofarm:AddButton({
    Name = "Teleport To End",

    Callback = function()

        local hrp = getHRP()

        if hrp then
            hrp.CFrame = positions[#positions]
        end
    end
})

--// PLAYER TAB
local player = window:createTab("Player")

player:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 200,
    Default = 16,

    Callback = function(v)

        walkSpeedValue = v

        local hum = getHumanoid()

        if hum then
            hum.WalkSpeed = v
        end
    end
})

player:AddSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 300,
    Default = 50,

    Callback = function(v)

        jumpPowerValue = v

        local hum = getHumanoid()

        if hum then
            hum.JumpPower = v
        end
    end
})

player:AddButton({
    Name = "Infinite Jump",

    Callback = function()

        imgui:notify(
            "Infinite Jump",
            "Enabled",
            "rbxassetid://6031075938"
        )

        local UIS = game:GetService("UserInputService")

        UIS.JumpRequest:Connect(function()

            local hum = getHumanoid()

            if hum then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
})

player:AddButton({
    Name = "Fly",

    Callback = function()

        local Players = game:Service("Players")
local RunService = game:Service("RunService")
local UserInputService = game:Service("UserInputService")
local TweenService = game:Service("TweenService")

local speaker = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Configuration
local DEFAULT_SPEED = 50
local MAX_SPEED = 150
local MIN_SPEED = 10
local SPEED_STEP = 5
local currentSpeed = DEFAULT_SPEED
local TOGGLE_KEY = Enum.KeyCode.E

-- State Variables
local nowe = false
local bodyVelocity = nil
local bodyGyro = nil

----------------------------------------------------------------
-- CREATING THE GUI VIA SCRIPT
----------------------------------------------------------------
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlySystemGui"
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 110)
mainFrame.Position = UserInputService.TouchEnabled and UDim2.new(0.75, 0, 0.45, 0) or UDim2.new(0.02, 0, 0.75, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(60, 60, 60)
uiStroke.Thickness = 1.5
uiStroke.Parent = mainFrame

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 170, 0, 40)
toggleButton.Position = UDim2.new(0.5, -85, 0, 15)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.Text = "FLY: OFF"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 14
toggleButton.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = toggleButton

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 100, 0, 20)
speedLabel.Position = UDim2.new(0.5, -50, 0, 60)
speedLabel.BackgroundTransparency = 1
speedLabel.Font = Enum.Font.GothamSemibold
speedLabel.Text = "Speed: " .. currentSpeed
speedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
speedLabel.TextSize = 12
speedLabel.Parent = mainFrame

local minusButton = Instance.new("TextButton")
minusButton.Size = UDim2.new(0, 20, 0, 20)
minusButton.Position = UDim2.new(0.5, -85, 0, 60)
minusButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
minusButton.Font = Enum.Font.GothamBold
minusButton.Text = "-"
minusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minusButton.TextSize = 14
minusButton.Parent = mainFrame

local minusCorner = Instance.new("UICorner")
minusCorner.CornerRadius = UDim.new(0, 4)
minusCorner.Parent = minusButton

local plusButton = Instance.new("TextButton")
plusButton.Size = UDim2.new(0, 20, 0, 20)
plusButton.Position = UDim2.new(0.5, 65, 0, 60)
plusButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
plusButton.Font = Enum.Font.GothamBold
plusButton.Text = "+"
plusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
plusButton.TextSize = 14
plusButton.Parent = mainFrame

local plusCorner = Instance.new("UICorner")
plusCorner.CornerRadius = UDim.new(0, 4)
plusCorner.Parent = plusButton

local sliderTrack = Instance.new("TextButton")
sliderTrack.Size = UDim2.new(0, 170, 0, 6)
sliderTrack.Position = UDim2.new(0.5, -85, 0, 90)
sliderTrack.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
sliderTrack.Text = ""
sliderTrack.Parent = mainFrame

local trackCorner = Instance.new("UICorner")
trackCorner.CornerRadius = UDim.new(0, 3)
trackCorner.Parent = sliderTrack

local sliderFill = Instance.new("Frame")
sliderFill.Size = UDim2.new((currentSpeed - MIN_SPEED) / (MAX_SPEED - MIN_SPEED), 0, 1, 0)
sliderFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
sliderFill.BorderSizePixel = 0
sliderFill.Parent = sliderTrack

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(0, 3)
fillCorner.Parent = sliderFill

if not UserInputService.TouchEnabled then
        local keybindLabel = Instance.new("TextLabel")
        keybindLabel.Size = UDim2.new(0, 200, 0, 15)
        keybindLabel.Position = UDim2.new(0, 0, 1, 5)
        keybindLabel.BackgroundTransparency = 1
        keybindLabel.Font = Enum.Font.Helvetica
        keybindLabel.Text = "Press [E] to quickly toggle"
        keybindLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        keybindLabel.TextSize = 11
        keybindLabel.Parent = mainFrame
end

screenGui.Parent = speaker:WaitForChild("PlayerGui")

----------------------------------------------------------------
-- TOGGLE FLY CORE LOGIC (Using your Humanoid State Setup)
----------------------------------------------------------------
local function toggleFly()
        local character = speaker.Character
        if not character then return end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not rootPart then return end

        -- Your custom state structure integrated cleanly
        if nowe == true then
                nowe = false

                -- Turn off Fly visual feedback
                TweenService:Create(toggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 170, 255)}):Play()
                toggleButton.Text = "FLY: OFF"

                -- Clean up physical body movers
                if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
                if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end

                -- Reset State Framework
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
                humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
        else 
                nowe = true

                -- Turn on Fly visual feedback
                TweenService:Create(toggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(46, 204, 113)}):Play()
                toggleButton.Text = "FLY: ON"

                -- Setup flight stability forces
                bodyGyro = Instance.new("BodyGyro")
                bodyGyro.maxTorque = Vector3.new(400000, 400000, 400000)
                bodyGyro.cframe = rootPart.CFrame
                bodyGyro.Parent = rootPart

                bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.maxForce = Vector3.new(400000, 400000, 400000)
                bodyVelocity.velocity = Vector3.new(0, 0, 0)
                bodyVelocity.Parent = rootPart

                -- Isolate state behavior to avoid conflicting with default walk gravity animations
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
                humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end
end

----------------------------------------------------------------
-- UI INTERACTION HANDLING
----------------------------------------------------------------
local function setSpeed(newSpeed)
        currentSpeed = math.clamp(newSpeed, MIN_SPEED, MAX_SPEED)
        speedLabel.Text = "Speed: " .. currentSpeed
        local percentage = (currentSpeed - MIN_SPEED) / (MAX_SPEED - MIN_SPEED)
        sliderFill.Size = UDim2.new(percentage, 0, 1, 0)
end

plusButton.Activated:Connect(function() setSpeed(currentSpeed + SPEED_STEP) end)
minusButton.Activated:Connect(function() setSpeed(currentSpeed - SPEED_STEP) end)

local dragging = false
local function updateSlider(input)
        local relativeX = input.Position.X - sliderTrack.AbsolutePosition.X
        local percentage = math.clamp(relativeX / sliderTrack.AbsoluteSize.X, 0, 1)
        setSpeed(math.round(MIN_SPEED + (percentage * (MAX_SPEED - MIN_SPEED))))
end

sliderTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                updateSlider(input)
        end
end)

UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                updateSlider(input)
        end
end)

UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
        end
end)

toggleButton.Activated:Connect(toggleFly)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == TOGGLE_KEY then toggleFly() end
end)

-- Clean exit on reset/respawn
speaker.CharacterAdded:Connect(function()
        if nowe then toggleFly() end
end)

----------------------------------------------------------------
-- RUNTIME PHYSICS FRAMEWORK
----------------------------------------------------------------
RunService.RenderStepped:Connect(function()
        if nowe then
                local character = speaker.Character
                if not character then return end
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                local rootPart = character:FindFirstChild("HumanoidRootPart")

                if rootPart and bodyVelocity and bodyGyro and humanoid then
                        bodyGyro.cframe = camera.CFrame
                        local moveDirection = humanoid.MoveDirection

                        if moveDirection.Magnitude > 0 then
                                local cameraCFrame = camera.CFrame
                                local flyDirection = cameraCFrame:VectorToWorldSpace(Vector3.new(moveDirection.X, 0, moveDirection.Z))

                                if moveDirection.Z ~= 0 then
                                        flyDirection = flyDirection + Vector3.new(0, cameraCFrame.LookVector.Y * -moveDirection.Z, 0)
                                end

                                bodyVelocity.velocity = flyDirection.Unit * currentSpeed
                        else
                                bodyVelocity.velocity = Vector3.new(0, 0, 0)
                        end
                end
        end
end)

        imgui:notify(
            "Fly",
            "Fly Enabled",
            "rbxassetid://6031075938"
        )
    end
})

--// VISUAL TAB
local visual = window:createTab("Visual")

visual:AddButton({
    Name = "Neon Platforms",

    Callback = function()

        platformMaterial = Enum.Material.Neon

        imgui:notify(
            "Visual",
            "Neon Material Enabled",
            "rbxassetid://6031280882"
        )
    end
})

visual:AddButton({
    Name = "ForceField Platforms",

    Callback = function()

        platformMaterial = Enum.Material.ForceField

        imgui:notify(
            "Visual",
            "ForceField Material Enabled",
            "rbxassetid://6031280882"
        )
    end
})

visual:AddButton({
    Name = "Glass Platforms",

    Callback = function()

        platformMaterial = Enum.Material.Glass

        imgui:notify(
            "Visual",
            "Glass Material Enabled",
            "rbxassetid://6031280882"
        )
    end
})

--// MISC TAB
local misc = window:createTab("Misc")

misc:AddButton({
    Name = "Destroy UI",

    Callback = function()

        for _,v in pairs(game.CoreGui:GetChildren()) do

            if v.Name == "VCL Hub" then
                v:Destroy()
            end
        end
    end
})

misc:AddButton({
    Name = "Rejoin",

    Callback = function()

        game:GetService("TeleportService"):Teleport(
            game.PlaceId,
            lp
        )
    end
})

--// UPDATE LOOP
task.spawn(function()

    while task.wait(0.2) do

        statusLabel:SetText(
            "Status : "..(running and "Running" or "Stopped")
        )

        positionLabel:SetText(
            "Position : "..tostring(currentPosition)
        )
    end
end)