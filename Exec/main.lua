local clhud = {}
local p = {}


function clhud.add(n)
  if n == "main.hud" then
		local device 
    local function getX()
	local camera = workspace.CurrentCamera
	local viewportSize = camera.ViewportSize

      return viewportSize.X
end
    local function getY()
	local camera = workspace.CurrentCamera
	local viewportSize = camera.ViewportSize

      return viewportSize.Y
end
		if getX() <=768 and getY() <= 1024 then
	device = "Phone"
elseif getX() <= 1024 and getY() <= 1366 then
	device = "Tablet"
else
	device = "PC"
end
    
		
		if device == "Phone" then 
			loadstring(game:HttpGet("https://raw.githubusercontent.com/XERO36/RobloxGUiI/main/Exec/devicemobile.lua"))()
  
    

    
  end
end

return clhud
      
