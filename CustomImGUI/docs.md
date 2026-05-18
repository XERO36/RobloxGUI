
# ImGUI Library Documentation

A clean, minimalist UI library designed for custom tools and interfaces in Roblox. 
<img src="https://raw.githubusercontent.com/XERO36/RobloxGUI/main/CustomImGUI/PhotoshopPNG-Example.png" width="420" height="320" alt="Photoshop PNG Example">

---

## 🛠️ Initialization & Setup

To use the library, make sure the script handles loading the main module table. 

```lua
-- Example layout setup if loading inline
local imgui = loadstring(game:HttpGet("https://raw.githubusercontent.com/XERO36/RobloxGUI/refs/heads/main/CustomImGUI/source.lua"))()

```

### `imgui:notify`

Creates a sleek, animated toast notification on the bottom-right corner of the screen.

```lua
imgui:notify(title, text, icon)

```

* **Parameters:**
* `title` (string, Optional): The bold text header. Defaults to `"Notification"`.
* `text` (string, Optional): The main message body. Defaults to `"Hello world!"`.
* `icon` (string, Optional): The Roblox Asset ID for the thumbnail. Defaults to `"rbxassetid://6031091004"`.


* **Example:**

```lua
imgui:notify("System", "Exploit loaded successfully!", "rbxassetid://6031091004")

```

---

## 🪟 Window Creation

### `imgui:createWindow`

Initializes the main graphical user interface window.

```lua
local window = imgui:createWindow(settings)

```

* **Parameters:**
* `settings` (table, Optional): Configures properties of the window frame.
* `Main.Name` (string): The title displayed at the top bar. Defaults to `"ImGUI"`.
* `Main.Creator` (string): Credits name next to the title. Defaults to `"ShadowDev"`.




* **Returns:** A `Window` object.
* **Example:**

```lua
local window = imgui:createWindow({
    Main = {
        Name = "CheatHub",
        Creator = "ShadowDev"
    }
})

```

---

## 📁 Tabs

### `window:createTab`

Adds a side-tab navigation page to your main window interface.

```lua
local tab = window:createTab(tabName)

```

* **Parameters:**
* `tabName` (string): The label rendered on the navigation button. Defaults to `"Tab"`.


* **Returns:** A `Tab` object.
* **Example:**

```lua
local mainTab = window:createTab("Main")
local combatTab = window:createTab("Combat")

```

---

## ⚙️ Tab Elements (Components)

### `tab:AddButton`

Adds a clickable interactive button to the current tab.

```lua
local button = tab:AddButton(settings)

```

* **Settings Options:** `Name` (string), `Callback` (function).
* **Methods:**
* `button:SetText("New Text")`
* `button:SetCallback(function() ... end)`
* `button:Destroy()`


* **Example:**

```lua
local killBtn = mainTab:AddButton({
    Name = "Kill All",
    Callback = function()
        print("Eliminating targets...")
    end
})

```

---

### `tab:AddToggle`

Adds a boolean checkbox style element that tracks an on/off state.

```lua
local toggle = tab:AddToggle(settings)

```

* **Settings Options:** `Name` (string), `Default` (boolean), `Callback` (function).
* **Methods:**
* `toggle:Set(true/false)`
* `toggle:SetText("New Label")`
* `toggle:Get()` -> Returns current state (boolean).
* `toggle:Destroy()`


* **Example:**

```lua
local autoFarm = mainTab:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(state)
        print("Auto Farm status:", state)
    end
})

```

---

### `tab:AddLabel`

Displays read-only text items inside the menu container.

```lua
local label = tab:AddLabel(text)

```

* **Methods:**
* `label:SetText("Updated Display Text")`
* `label:Destroy()`


* **Example:**

```lua
local statusLbl = mainTab:AddLabel("Status: Active")

```

---

### `tab:AddTextbox`

Creates an input field allowing users to enter custom string values.

```lua
local textbox = tab:AddTextbox(settings)

```

* **Settings Options:** `Name` (string), `Placeholder` (string), `Callback` (function). Triggers when the user presses **Enter**.
* **Methods:**
* `textbox:SetText("Input Value")`
* `textbox:GetText()` -> Returns active input value (string).
* `textbox:SetPlaceholder("Hold text...")`
* `textbox:Destroy()`


* **Example:**

```lua
local speedBox = mainTab:AddTextbox({
    Name = "WalkSpeed Changer",
    Placeholder = "Enter speed value...",
    Callback = function(text)
        print("Requested WalkSpeed adjustment: " .. text)
    end
})

```

---

### `tab:AddSlider`

Generates a draggable slider track to adjust values across a defined limit range.

```lua
local slider = tab:AddSlider(settings)

```

* **Settings Options:** `Name` (string), `Min` (number), `Max` (number), `Default` (number), `Callback` (function).
* **Methods:**
* `slider:Set(50)`
* `slider:SetText("New Slider Label")`
* `slider:Get()` -> Returns active number level selected.
* `slider:Destroy()`


* **Example:**

```lua
local fovSlider = mainTab:AddSlider({
    Name = "FOV Range",
    Min = 70,
    Max = 120,
    Default = 90,
    Callback = function(value)
        workspace.CurrentCamera.FieldOfView = value
    end
})

```

---

## 🚀 Complete Implementation Script Example

```lua
local window = imgui:createWindow({
    Main = {
        Name = "Valkyrie Engine",
        Creator = "Hex"
    }
})

imgui:notify("Valkyrie Engine", "Successfully executed!", "rbxassetid://6031091004")

local combat = window:createTab("Combat")

combat:AddLabel("Aimbot Modifications")

combat:AddToggle({
    Name = "Silent Aim",
    Default = false,
    Callback = function(enabled)
        _G.SilentAim = enabled
    end
})

combat:AddSlider({
    Name = "Hit Percentage Chance",
    Min = 0,
    Max = 100,
    Default = 75,
    Callback = function(v)
        _G.HitChance = v
    end
})

```

```

```
