local SGUI = Instance.new("ScreenGui", game.CoreGui)
SGUI.Name = "SGUI"
SGUI.ResetOnSpawn = false

local diaco = Instance.new("Frame", SGUI)
diaco.Size = UDim2.new(0, 300, 0, 260)
diaco.Position = UDim2.new(0.5, -150, 0.5, -130)
diaco.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
diaco.BorderSizePixel = 0

Instance.new("UICorner", diaco).CornerRadius = UDim.new(0, 10)

-- TAB BUTTONS
local tab1Btn = Instance.new("TextButton", diaco)
tab1Btn.Size = UDim2.new(0, 140, 0, 30)
tab1Btn.Position = UDim2.new(0, 10, 0, 5)
tab1Btn.Text = "Tab 1"
tab1Btn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
tab1Btn.TextColor3 = Color3.fromRGB(255,255,255)

local tab2Btn = Instance.new("TextButton", diaco)
tab2Btn.Size = UDim2.new(0, 140, 0, 30)
tab2Btn.Position = UDim2.new(0, 150, 0, 5)
tab2Btn.Text = "Tab 2"
tab2Btn.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
tab2Btn.TextColor3 = Color3.fromRGB(255,255,255)

-- TAB FRAMES
local bkot = Instance.new("Frame", diaco) -- Execute
bkot.Name = "bkot"
bkot.Size = UDim2.new(1, -20, 1, -50)
bkot.Position = UDim2.new(0, 10, 0, 40)
bkot.BackgroundColor3 = Color3.fromRGB(45, 45, 50)

local bibo = Instance.new("Frame", diaco) -- Cloud
bibo.Name = "bibo"
bibo.Size = UDim2.new(1, -20, 1, -50)
bibo.Position = UDim2.new(0, 10, 0, 40)
bibo.BackgroundColor3 = Color3.fromRGB(45, 45, 50)

-- TAB FUNCTION
local function showTab(tab)
	if tab == "bkot" then
    bkot.Visible = true
    bibo.Visible = false 
  elseif tab == "bibo" then
    bkot.Visible = false
    bibo.Visibile = true
		
  else
    warn("nottabwin")
end

-- DEFAULT TAB
showTab("bkot")

-- BUTTON EVENTS
tab1Btn.MouseButton1Click:Connect(function()
	showTab("bkot")
end)

tab2Btn.MouseButton1Click:Connect(function()
	showTab("bibo")
end)
