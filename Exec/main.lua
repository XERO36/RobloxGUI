local clhud = {}
local p = {}


function clhud.add(n)
  if n == "main.hud" then

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

    local c8ot92 = Instance.new("ScreenGui",game.CoreGUI)
    local sgui = c8ot92

    local main = Instance.new("Frame",sgui)
    local maincorner =  Instance.new("UICorner",main)
    local device 

    
  end
end

return clhud
      
