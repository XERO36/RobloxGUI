local NovaX = {}
local services = {}

for _, service in ipairs(game:GetChildren()) do
    table.insert(services, service)
end

local EXEC_NAME    = "Nova X"
local EXEC_VER     = "1.0.0"
local EXEC_AUTHOR  = "SDev"
local runnning = false
