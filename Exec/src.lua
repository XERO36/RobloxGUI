local NovaX = {}

-- Basic Executor stuff
local EXEC_NAME        = "Nova X"
local EXEC_VER         = "1.0.0"
local EXEC_AUTHOR      = "SDev"
local running          = false
local DISCORD_INVITE   = "notspecified" -- none 

-- File System
local isfile           = isfile
local readfile         = readfile
local writefile        = writefile
local appendfile       = appendfile
local delfile          = delfile        or deletefile
local makefolder       = makefolder     or createfolder
local delfolder        = delfolder      or deletefolder
local listfiles        = listfiles      or getfiles
local loadfile         = loadfile

-- Environments & Garbage Collection
local getgenv          = getgenv        
local getrenv          = getrenv        
local getreg           = getreg         
local getgc            = getgc          
local identifyexecutor = identifyexecutor or getexecutorname or function() return "Unknown" end
local ldr              = loadstring    

-- Clipboard & Instances
local setclipboard     = setclipboard     or toclipboard  or set_clipboard
local getclipboard     = getclipboard     or fromclipboard
local getinstances     = getinstances    
local getnilinstances  = getnilinstances
local getloadedmodules = getloadedmodules 
local getconnections   = getconnections

-- Simulation & Interaction
local fireclickdetector  = fireclickdetector
local fireproximityprompt = fireproximityprompt
local firesignal         = firesignal        
local firetouchinterest  = firetouchinterest  
local keypress           = keypress           
local keyrelease         = keyrelease        
local mouse1click        = mouse1click       

-- Hooking & Metatables
local hookfunction     = hookfunction     or replaceclosure
local hookmetamethod   = hookmetamethod 
local getrawmetatable  = getrawmetatable
local setrawmetatable  = setrawmetatable
local setreadonly      = setreadonly    
local isreadonly       = isreadonly

-- Closures
local newcclosure      = newcclosure 
local iscclosure       = iscclosure     
local islclosure       = islclosure     
local clonefunction    = clonefunction 

-- Cryptography
local crypt            = crypt or syn and syn.crypt or {
    base64_encode    = base64_encode or (crypt and crypt.base64_encode),
    base64_decode    = base64_decode or (crypt and crypt.base64_decode),
    encrypt          = encrypt or (crypt and crypt.encrypt),
    decrypt          = decrypt or (crypt and crypt.decrypt)
}

--- Packing everything into the NovaX return table ---
NovaX.EXEC_NAME = EXEC_NAME
NovaX.EXEC_VER = EXEC_VER
NovaX.EXEC_AUTHOR = EXEC_AUTHOR
NovaX.running = running
NovaX.DISCORD_INVITE = DISCORD_INVITE

NovaX.isfile = isfile
NovaX.readfile = readfile
NovaX.writefile = writefile
NovaX.appendfile = appendfile
NovaX.delfile = delfile
NovaX.makefolder = makefolder
NovaX.delfolder = delfolder
NovaX.listfiles = listfiles
NovaX.loadfile = loadfile

NovaX.getgenv = getgenv
NovaX.getrenv = getrenv
NovaX.getreg = getreg
NovaX.getgc = getgc
NovaX.identifyexecutor = identifyexecutor
NovaX.loadstring = ldr

NovaX.setclipboard = setclipboard
NovaX.getclipboard = getclipboard
NovaX.getinstances = getinstances
NovaX.getnilinstances = getnilinstances
NovaX.getloadedmodules = getloadedmodules
NovaX.getconnections = getconnections

NovaX.fireclickdetector = fireclickdetector
NovaX.fireproximityprompt = fireproximityprompt
NovaX.firesignal = firesignal
NovaX.firetouchinterest = firetouchinterest
NovaX.keypress = keypress
NovaX.keyrelease = keyrelease
NovaX.mouse1click = mouse1click

NovaX.hookfunction = hookfunction
NovaX.hookmetamethod = hookmetamethod
NovaX.getrawmetatable = getrawmetatable
NovaX.setrawmetatable = setrawmetatable
NovaX.setreadonly = setreadonly
NovaX.isreadonly = isreadonly

NovaX.newcclosure = newcclosure
NovaX.iscclosure = iscclosure
NovaX.islclosure = islclosure
NovaX.clonefunction = clonefunction
NovaX.crypt = crypt

getgenv().NovaX = NovaX
-- Execution Guard Logic
if _G.runned == nil or _G.runned == false then 
    _G.runned = true -- Set it to true so it doesn't double-load
    local success, err = pcall(function()
        ldr(game:HttpGet("https://raw.githubusercontent.com/XERO36/RobloxGUI/main/Exec/gui.lua"))()
    end)
    if not success then
        _G.runned = false -- Reset if the GUI fails to load
        warn("Failed to load GUI: " .. tostring(err))
    end
end

return NovaX
