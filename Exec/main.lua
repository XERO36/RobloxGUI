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
    local c8ot92 = Instance.new("ScreenGui",game.CoreGUI)
    local sgui = c8ot92

    local main = Instance.new("Frame",sgui)
    local maincorner =  Instance.new("UICorner",main)
    

    
  end
end

return clhud
      
