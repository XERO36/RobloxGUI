local NovaX = {}

-- Basic Executor stuff
local EXEC_NAME    = "Nova X"
local EXEC_VER     = "1.0.0"
local EXEC_AUTHOR  = "SDev"
local runnning = false
local DISCORD_INVITE = "notspecified" -- none 
local isfile         = isfile
local readfile       = readfile
local writefile      = writefile
local appendfile     = appendfile
local delfile        = delfile        or deletefile
local makefolder     = makefolder     or createfolder
local delfolder      = delfolder      or deletefolder
local listfiles      = listfiles      or getfiles
local loadfile       = loadfile
local getgenv        = getgenv        
local getrenv        = getrenv        
local getreg         = getreg         
local getgc          = getgc          
local identifyexecutor = identifyexecutor or getexecutorname or function() return "Unknown" end
local ldr            = loadstring    
local setclipboard   = setclipboard     or toclipboard  or set_clipboard
    
local getclipboard   = getclipboard  or fromclipboard
local getinstances   = getinstances   
local getnilinstances= getnilinstances
local getloadedmodules = getloadedmodules 
local getconnections = getconnections
local fireclickdetector  = fireclickdetector
local fireproximityprompt = fireproximityprompt
local firesignal         = firesignal        
local firetouchinterest  = firetouchinterest  
local keypress           = keypress           
local keyrelease         = keyrelease        
local mouse1click        = mouse1click       
local hookfunction   = hookfunction   or replaceclosure
local hookmetamethod = hookmetamethod 
local getrawmetatable= getrawmetatable-- Grabs read-only tables safely
local setrawmetatable= setrawmetatable
local setreadonly    = setreadonly    
local isreadonly     = isreadonly
local newcclosure    = newcclosure 
local iscclosure     = iscclosure     
local islclosure     = islclosure    
local clonefunction  = clonefunction 
local crypt          = crypt or syn and syn.crypt or {
    base64_encode    = base64_encode or (crypt and crypt.base64_encode),
    base64_decode    = base64_decode or (crypt and crypt.base64_decode),
    encrypt          = encrypt or (crypt and crypt.encrypt),
    decrypt          = decrypt or (crypt and crypt.decrypt)
}
_G.runned = false
local r = _G.runned
-- end of the basic executor
if r == false then 
ldr(game:HttpGet("https://raw.githubusercontent.com/XERO36/RobloxGUI/main/Exec/gui.lua"))()
    r = true
else
end

return NovaX
