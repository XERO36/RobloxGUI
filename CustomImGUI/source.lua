local imgui = {}

function imgui:notify(title, text, icon)
    
    local TweenService = game:GetService("TweenService")
    local Debris = game:GetService("Debris")

    
    title = title or "Notification"
    text = text or "Hello world!"
    icon = icon or "rbxassetid://6031091004"

    
    local gui = Instance.new("ScreenGui")
    gui.Name = "imgui_notify"
    gui.ResetOnSpawn = false
    gui.Parent = game:GetService("CoreGui")

    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 80)
    frame.Position = UDim2.new(1, 320, 1, -100)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

  
    local image = Instance.new("ImageLabel")
    image.Size = UDim2.new(0, 40, 0, 40)
    image.Position = UDim2.new(0, 15, 0.5, -20)
    image.BackgroundTransparency = 1
    image.Image = icon
    image.Parent = frame

  local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -70, 0, 25)
    titleLabel.Position = UDim2.new(0, 60, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 16
    titleLabel.TextColor3 = Color3.new(1,1,1)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = frame

  
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -70, 0, 35)
    textLabel.Position = UDim2.new(0, 60, 0, 35)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextSize = 14
    textLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    textLabel.TextWrapped = true
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextYAlignment = Enum.TextYAlignment.Top
    textLabel.Parent = frame

  
    TweenService:Create(
        frame,
        TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        {Position = UDim2.new(1, -320, 1, -100)}
    ):Play()

  
    task.wait(3)

  
    local tween = TweenService:Create(
        frame,
        TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
        {Position = UDim2.new(1, 320, 1, -100)}
    )

    tween:Play()

    tween.Completed:Connect(function()
        gui:Destroy()
    end)

    Debris:AddItem(gui, 5)
end




function imgui:createWindow(settings)

    settings = settings or {}

    settings.Main = settings.Main or {}
    settings.Discord = settings.Discord or {}

    settings.Main.Name = settings.Main.Name or "ImGUI"
    settings.Main.Creator = settings.Main.Creator or "ShadowDev"

    settings.Discord.Enabled = settings.Discord.Enabled or false
    settings.Discord.Link = settings.Discord.Link or "????????????"

    -- Window Object
    local window = {}

    -- Gui
    local fe7wiw = Instance.new("ScreenGui")
    fe7wiw.Name = settings.Main.Name
    fe7wiw.ResetOnSpawn = false
    fe7wiw.Parent = game:GetService("CoreGui")

    -- Main Frame
    local mainframe = Instance.new("Frame")
    mainframe.Parent = fe7wiw
    mainframe.Size = UDim2.new(0, 500, 0, 300)
    mainframe.Position = UDim2.new(0.5, -250, 0.5, -150)
    mainframe.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    mainframe.BorderSizePixel = 0

    local uicornermain = Instance.new("UICorner")
    uicornermain.Parent = mainframe
    uicornermain.CornerRadius = UDim.new(0, 8)

    -- Top Bar
    local topbar = Instance.new("Frame")
    topbar.Parent = mainframe
    topbar.Size = UDim2.new(1, 0, 0, 35)
    topbar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    topbar.BorderSizePixel = 0

    local topcorner = Instance.new("UICorner")
    topcorner.Parent = topbar
    topcorner.CornerRadius = UDim.new(0, 8)

    -- Title
    local title = Instance.new("TextLabel")
    title.Parent = topbar
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, -10, 1, 0)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.Font = Enum.Font.GothamBold
    title.Text = settings.Main.Name .. " | " .. settings.Main.Creator
    title.TextColor3 = Color3.new(1,1,1)
    title.TextSize = 15
    title.TextXAlignment = Enum.TextXAlignment.Left

    -- Tabs Holder
    local tabsHolder = Instance.new("Frame")
    tabsHolder.Parent = mainframe
    tabsHolder.Position = UDim2.new(0, 0, 0, 35)
    tabsHolder.Size = UDim2.new(0, 120, 1, -35)
    tabsHolder.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    tabsHolder.BorderSizePixel = 0

    local tabsLayout = Instance.new("UIListLayout")
    tabsLayout.Parent = tabsHolder
    tabsLayout.Padding = UDim.new(0, 5)

    -- Content Holder
    local contentHolder = Instance.new("Frame")
    contentHolder.Parent = mainframe
    contentHolder.Position = UDim2.new(0, 120, 0, 35)
    contentHolder.Size = UDim2.new(1, -120, 1, -35)
    contentHolder.BackgroundTransparency = 1

    -- Create Tab
    function window:createTab(tabName)

        local tab = {}

        -- Tab Button
        local button = Instance.new("TextButton")
        button.Parent = tabsHolder
        button.Size = UDim2.new(1, -10, 0, 35)
        button.Position = UDim2.new(0, 5, 0, 0)
        button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        button.BorderSizePixel = 0
        button.Text = tabName or "Tab"
        button.Font = Enum.Font.Gotham
        button.TextColor3 = Color3.new(1,1,1)
        button.TextSize = 14

        local buttonCorner = Instance.new("UICorner")
        buttonCorner.Parent = button
        buttonCorner.CornerRadius = UDim.new(0, 6)

        -- Tab Page
        local page = Instance.new("Frame")
        page.Parent = contentHolder
        page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.Visible = false

        -- Show tab
        button.MouseButton1Click:Connect(function()

            for _,v in pairs(contentHolder:GetChildren()) do
                if v:IsA("Frame") then
                    v.Visible = false
                end
            end

            page.Visible = true
        end)

        -- Auto open first tab
        if #contentHolder:GetChildren() == 1 then
            page.Visible = true
        end


    
--// BUTTON
function tab:AddButton(settings)

    local btn = {}

    settings = settings or {}
    settings.Name = settings.Name or "Button"
    settings.Hint = settings.Hint or "This is a Hint"
    settings.Callback = settings.Callback or function() end

    local button = Instance.new("TextButton")
    button.Parent = pageHolder
    button.Size = UDim2.new(1, -10, 0, 35)
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.BorderSizePixel = 0
    button.Text = settings.Name
    button.Font = Enum.Font.Gotham
    button.TextColor3 = Color3.new(1,1,1)
    button.TextSize = 14

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.Parent = button
    buttonCorner.CornerRadius = UDim.new(0, 6)

    button.MouseButton1Click:Connect(function()
        settings.Callback()
    end)

    -- Updates
    function btn:SetText(text)
        button.Text = text
    end

    function btn:SetCallback(callback)
        settings.Callback = callback
    end

    function btn:Destroy()
        button:Destroy()
    end

    return btn
end


--// TOGGLE
function tab:AddToggle(settings)

    local toggle = {}

    settings = settings or {}
    settings.Name = settings.Name or "Toggle"
    settings.Default = settings.Default or false
    settings.Callback = settings.Callback or function() end

    local enabled = settings.Default

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Parent = pageHolder
    toggleBtn.Size = UDim2.new(1, -10, 0, 35)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Text = settings.Name .. " : " .. tostring(enabled)
    toggleBtn.Font = Enum.Font.Gotham
    toggleBtn.TextColor3 = Color3.new(1,1,1)
    toggleBtn.TextSize = 14

    local corner = Instance.new("UICorner")
    corner.Parent = toggleBtn
    corner.CornerRadius = UDim.new(0, 6)

    toggleBtn.MouseButton1Click:Connect(function()

        enabled = not enabled
        toggleBtn.Text = settings.Name .. " : " .. tostring(enabled)

        settings.Callback(enabled)
    end)

    -- Updates
    function toggle:Set(state)
        enabled = state
        toggleBtn.Text = settings.Name .. " : " .. tostring(enabled)
        settings.Callback(enabled)
    end

    function toggle:SetText(text)
        settings.Name = text
        toggleBtn.Text = text .. " : " .. tostring(enabled)
    end

    function toggle:Get()
        return enabled
    end

    function toggle:Destroy()
        toggleBtn:Destroy()
    end

    return toggle
end


--// LABEL
function tab:AddLabel(text)

    local lbl = {}

    local label = Instance.new("TextLabel")
    label.Parent = pageHolder
    label.Size = UDim2.new(1, -10, 0, 30)
    label.BackgroundTransparency = 1
    label.Text = text or "Label"
    label.Font = Enum.Font.Gotham
    label.TextColor3 = Color3.new(1,1,1)
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left

    -- Updates
    function lbl:SetText(text)
        label.Text = text
    end

    function lbl:Destroy()
        label:Destroy()
    end

    return lbl
end


--// TEXTBOX
function tab:AddTextbox(settings)

    local box = {}

    settings = settings or {}
    settings.Name = settings.Name or "Textbox"
    settings.Placeholder = settings.Placeholder or "Type here..."
    settings.Callback = settings.Callback or function() end

    local textbox = Instance.new("TextBox")
    textbox.Parent = pageHolder
    textbox.Size = UDim2.new(1, -10, 0, 35)
    textbox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    textbox.BorderSizePixel = 0
    textbox.PlaceholderText = settings.Placeholder
    textbox.Text = ""
    textbox.Font = Enum.Font.Gotham
    textbox.TextColor3 = Color3.new(1,1,1)
    textbox.TextSize = 14

    local corner = Instance.new("UICorner")
    corner.Parent = textbox
    corner.CornerRadius = UDim.new(0, 6)

    textbox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            settings.Callback(textbox.Text)
        end
    end)

    -- Updates
    function box:SetText(text)
        textbox.Text = text
    end

    function box:GetText()
        return textbox.Text
    end

    function box:SetPlaceholder(text)
        textbox.PlaceholderText = text
    end

    function box:Destroy()
        textbox:Destroy()
    end

    return box
end


--// SLIDER
function tab:AddSlider(settings)

    local slider = {}

    settings = settings or {}

    settings.Name = settings.Name or "Slider"
    settings.Min = settings.Min or 0
    settings.Max = settings.Max or 100
    settings.Default = settings.Default or settings.Min
    settings.Callback = settings.Callback or function() end

    local value = settings.Default

    local sliderFrame = Instance.new("Frame")
    sliderFrame.Parent = pageHolder
    sliderFrame.Size = UDim2.new(1, -10, 0, 50)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    sliderFrame.BorderSizePixel = 0

    local corner = Instance.new("UICorner")
    corner.Parent = sliderFrame
    corner.CornerRadius = UDim.new(0,6)

    local title = Instance.new("TextLabel")
    title.Parent = sliderFrame
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, 0, 0, 20)
    title.Text = settings.Name .. " : " .. tostring(value)
    title.Font = Enum.Font.Gotham
    title.TextColor3 = Color3.new(1,1,1)
    title.TextSize = 14

    local bar = Instance.new("Frame")
    bar.Parent = sliderFrame
    bar.Position = UDim2.new(0, 10, 0, 30)
    bar.Size = UDim2.new(1, -20, 0, 10)
    bar.BackgroundColor3 = Color3.fromRGB(45,45,45)
    bar.BorderSizePixel = 0

    local fill = Instance.new("Frame")
    fill.Parent = bar
    fill.Size = UDim2.new(
        (value - settings.Min) / (settings.Max - settings.Min),
        0,
        1,
        0
    )
    fill.BackgroundColor3 = Color3.fromRGB(255,255,255)
    fill.BorderSizePixel = 0

    local dragging = false

    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)

        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then

            local sizeX = math.clamp(
                (input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X,
                0,
                1
            )

            fill.Size = UDim2.new(sizeX,0,1,0)

            value = math.floor(
                ((settings.Max - settings.Min) * sizeX) + settings.Min
            )

            title.Text = settings.Name .. " : " .. tostring(value)

            settings.Callback(value)
        end
    end)

    -- Updates
    function slider:Set(value2)

        value2 = math.clamp(value2, settings.Min, settings.Max)

        value = value2

        fill.Size = UDim2.new(
            (value - settings.Min) / (settings.Max - settings.Min),
            0,
            1,
            0
        )

        title.Text = settings.Name .. " : " .. tostring(value)

        settings.Callback(value)
    end

    function slider:Get()
        return value
    end

    function slider:SetText(text)
        settings.Name = text
        title.Text = text .. " : " .. tostring(value)
    end

    function slider:Destroy()
        sliderFrame:Destroy()
    end

    return slider
end

  
    
        return tab
    end

    return window
end
