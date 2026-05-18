--// Editable Countdown Popup System
--// LocalScript inside StarterPlayerScripts

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--------------------------------------------------
-- GUI
--------------------------------------------------

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EditableCountdown"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BackgroundTransparency = 0.35
bg.Parent = screenGui

-- Popup
local popup = Instance.new("Frame")
popup.Size = UDim2.new(0,0,0,0)
popup.Position = UDim2.new(0.5,-275,0.5,-190)
popup.BackgroundColor3 = Color3.fromRGB(25,25,25)
popup.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,12)
corner.Parent = popup

TweenService:Create(
	popup,
	TweenInfo.new(0.4, Enum.EasingStyle.Back),
	{
		Size = UDim2.new(0,550,0,380)
	}
):Play()

--------------------------------------------------
-- TITLE
--------------------------------------------------

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Text = "⏳ Editable Countdown Timer"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)
title.Parent = popup

--------------------------------------------------
-- INPUT SECTION
--------------------------------------------------

local inputHolder = Instance.new("Frame")
inputHolder.Size = UDim2.new(1,-40,0,60)
inputHolder.Position = UDim2.new(0,20,0,70)
inputHolder.BackgroundTransparency = 1
inputHolder.Parent = popup

local layout = Instance.new("UIListLayout")
layout.FillDirection = Enum.FillDirection.Horizontal
layout.Padding = UDim.new(0,10)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Parent = inputHolder

local function createBox(place)
	local box = Instance.new("TextBox")
	box.Size = UDim2.new(0,100,1,0)
	box.BackgroundColor3 = Color3.fromRGB(40,40,40)
	box.TextColor3 = Color3.new(1,1,1)
	box.PlaceholderText = place
	box.Text = ""
	box.Font = Enum.Font.GothamBold
	box.TextScaled = true
	box.ClearTextOnFocus = false
	box.Parent = inputHolder
	
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0,8)
	c.Parent = box
	
	return box
end

local daysBox = createBox("Days")
local hoursBox = createBox("Hours")
local minsBox = createBox("Minutes")
local secsBox = createBox("Seconds")

--------------------------------------------------
-- START BUTTON
--------------------------------------------------

local startButton = Instance.new("TextButton")
startButton.Size = UDim2.new(0,200,0,45)
startButton.Position = UDim2.new(0.5,-100,0,150)
startButton.BackgroundColor3 = Color3.fromRGB(0,170,255)
startButton.Text = "START TIMER"
startButton.Font = Enum.Font.GothamBold
startButton.TextScaled = true
startButton.TextColor3 = Color3.new(1,1,1)
startButton.Parent = popup

local startCorner = Instance.new("UICorner")
startCorner.CornerRadius = UDim.new(0,8)
startCorner.Parent = startButton

--------------------------------------------------
-- COUNTDOWN DISPLAY
--------------------------------------------------

local countdownLabel = Instance.new("TextLabel")
countdownLabel.Size = UDim2.new(1,-40,0,100)
countdownLabel.Position = UDim2.new(0,20,0,230)
countdownLabel.BackgroundTransparency = 1
countdownLabel.Text = "00 : 00 : 00 : 00"
countdownLabel.Font = Enum.Font.GothamBlack
countdownLabel.TextScaled = true
countdownLabel.TextColor3 = Color3.new(1,1,1)
countdownLabel.Parent = popup

--------------------------------------------------
-- TIMER SYSTEM
--------------------------------------------------

local running = false

local function format(num)
	return string.format("%02d", num)
end

startButton.MouseButton1Click:Connect(function()

	if running then return end
	running = true

	local days = tonumber(daysBox.Text) or 0
	local hours = tonumber(hoursBox.Text) or 0
	local mins = tonumber(minsBox.Text) or 0
	local secs = tonumber(secsBox.Text) or 0

	local total =
		(days * 86400) +
		(hours * 3600) +
		(mins * 60) +
		secs

	while total > 0 do

		local d = math.floor(total / 86400)
		local h = math.floor((total % 86400) / 3600)
		local m = math.floor((total % 3600) / 60)
		local s = total % 60

		countdownLabel.Text =
			format(d).." : "..
			format(h).." : "..
			format(m).." : "..
			format(s)

		total -= 1

		task.wait(1)
	end

	countdownLabel.Text = "🎉 TIMER ENDED!"
	running = false
end)
