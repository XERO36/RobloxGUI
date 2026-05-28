-- Paste the API Wrapper directly above if not using a physical ModuleScript
local ScriptBloxAPI = (function()
    -- [Insert the Module code from Section 1 here if executing as a single script]
    local API = {}
    local Http = game:GetService("HttpService")
    local function f(u)
        local s, r = pcall(function() return game:HttpGet(u) end)
        if not s then return {success = false, scripts = {}} end
        local ds, d = pcall(function() return Http:JSONDecode(r) end)
        if not ds or not d.result or not d.result.scripts then return {success = false, scripts = {}} end
        local c = {}
        for _, v in ipairs(d.result.scripts) do
            table.insert(c, {title = v.title or "N/A", slug = v.slug or "N/A"})
        end
        return {success = true, scripts = c}
    end
    function API.search(q) return f("https://scriptblox.com/api/script/search?q=" .. Http:UrlEncode(q)) end
    function API.getRecent() return f("https://scriptblox.com/api/script/fetch") end
    return API
end)()

-- UI Setup
local CoreGui = game:GetService("CoreGui")
local ScreenGui = Instance.new("ScreenGui", CoreGui)

local MainFrame = Instance.new("ScrollingFrame", ScreenGui)
MainFrame.Size = UDim2.new(0, 350, 0, 450)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -225)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.CanvasSize = UDim2.new(0, 0, 0, 0) -- Automatic canvas sizing handles this
MainFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

local ListLayout = Instance.new("UIListLayout", MainFrame)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Padding = UDim.new(0, 5)

-- Populate UI Function
local function populateUI(apiResponse)
    if not apiResponse.success then
        local errLabel = Instance.new("TextLabel", MainFrame)
        errLabel.Text = "Failed to load scripts."
        errLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        errLabel.Size = UDim2.new(1, 0, 0, 50)
        return
    end

    for _, scriptInfo in ipairs(apiResponse.scripts) do
        local label = Instance.new("TextLabel", MainFrame)
        label.Text = string.format("Title: %s\nSlug: %s", scriptInfo.title, scriptInfo.slug)
        label.Size = UDim2.new(1, -10, 0, 60)
        label.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        label.TextColor3 = Color3.fromRGB(240, 240, 240)
        label.TextWrapped = true
        label.TextXAlignment = Enum.TextXAlignment.Left
    end
end

-- Toggle between your two custom API options:
-- Option A: Fetch Recent
local data = ScriptBloxAPI.getRecent()

-- Option B: Search Custom Query
-- local data = ScriptBloxAPI.search("fly")

populateUI(data)
