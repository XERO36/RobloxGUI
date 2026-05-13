local Players = game:GetService("Players")
local lp = game.Players.LocalPlayer
local pgui = lp.PlayerGui
local it = lp.Backpack
local w = workspace
local rs = game:GetService("ReplicatedStorage")

local positions = {
    CFrame.new(-51.5656433, 65.0000458, 1369.09009),
    CFrame.new(-51.5656433, 65.0000458, 2139.09009),
    CFrame.new(-51.5656433, 65.0000458, 2909.09009),
    CFrame.new(-51.5656433, 65.0000458, 3679.09009),
    CFrame.new(-51.5656433, 65.0000458, 4449.08984),
    CFrame.new(-53.5669785, 72.6005325, 5218.14209),
    CFrame.new(-51.5656433, 65.0000458, 5989.08984),
    CFrame.new(-51.5656433, 65.0000458, 6759.08984),
    CFrame.new(-51.5656433, 65.0000458, 7529.08984),
    CFrame.new(-51.5656433, 65.0000458, 8299.08984),
    CFrame.new(-55.7065125, -358.739624, 9492.35645, 0, 0, -1, 0, 1, 0, 1, 0, 0)
}
local BABFT_Codes = {
    "hi",
    "=D",
    "=P",
    "Squid Army",
    "chillthrill709 was here"
}
local vim = game:GetService("VirtualInputManager")
-- Always get a valid character + HRP
local function getHRP()
    local character = lp.Character or lp.CharacterAdded:Wait()
    return character:WaitForChild("HumanoidRootPart")
end
local function startLoop()
    if running then return end
    running = true

    task.spawn(function()
        while running do
            local hrp = getHRP()

            for _, pos in ipairs(positions) do
                if not running then break end
                if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then break end

                hrp = getHRP()
                hrp.CFrame = pos
                task.wait(1.2)
            end

            task.wait(25)
        end
    end)
end

-- END LOOP
local function stopLoop()
    running = false
end

