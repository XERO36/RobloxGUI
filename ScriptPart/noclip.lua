local Players = game:Service("Players")
local RunService = game:Service("RunService")
local UserInputService = game:Service("UserInputService")
local TweenService = game:Service("TweenService")

local speaker = Players.LocalPlayer

-- Configuration
local TOGGLE_KEY = Enum.KeyCode.E

-- State Variables
local isNoclip = false

----------------------------------------------------------------
-- CREATING THE GUI VIA SCRIPT
----------------------------------------------------------------
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NoclipSystemGui"
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 180, 0, 70)
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
toggleButton.Size = UDim2.new(0, 150, 0, 40)
toggleButton.Position = UDim2.new(0.5, -75, 0, 15)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.Text = "NOCLIP: OFF"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 14
toggleButton.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = toggleButton

if not UserInputService.TouchEnabled then
	local keybindLabel = Instance.new("TextLabel")
	keybindLabel.Size = UDim2.new(0, 180, 0, 15)
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
-- CORE NOCLIP TOGGLE
----------------------------------------------------------------
local function toggleNoclip()
	local character = speaker.Character
	if not character then return end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	isNoclip = not isNoclip

	if isNoclip then
		-- Turn UI Green when Active
		TweenService:Create(toggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(46, 204, 113)}):Play()
		toggleButton.Text = "NOCLIP: ON"
	else 
		-- Turn UI Blue when Inactive
		TweenService:Create(toggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 170, 255)}):Play()
		toggleButton.Text = "NOCLIP: OFF"
		
		-- Safely restore collision immediately upon turning off
		for _, part in ipairs(character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = true
			end
		end
	end
end

----------------------------------------------------------------
-- ACTIVATION LISTENERS
----------------------------------------------------------------
toggleButton.Activated:Connect(toggleNoclip)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == TOGGLE_KEY then 
		toggleNoclip() 
	end
end)

speaker.CharacterAdded:Connect(function()
	if isNoclip then 
		isNoclip = false
		toggleButton.Text = "NOCLIP: OFF"
		toggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	end
end)

----------------------------------------------------------------
-- RUNTIME PHYSICS FRAMEWORK
----------------------------------------------------------------
-- Runs continuous checks right before the physics engine calculates collision steps
RunService.Stepped:Connect(function()
	if isNoclip then
		local character = speaker.Character
		if not character then return end
		
		-- Forces character elements to ignore environmental geometry collisions
		for _, part in ipairs(character:GetDescendants()) do
			if part:IsA("BasePart") and part.CanCollide then
				part.CanCollide = false
			end
		end
	end
end)
