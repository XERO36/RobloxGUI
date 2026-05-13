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


local vim = game:GetService("VirtualInputManager")

local shift = Enum.KeyCode.LeftShift

local keyMap = {
    ["a"] = Enum.KeyCode.A, ["b"] = Enum.KeyCode.B, ["c"] = Enum.KeyCode.C,
    ["d"] = Enum.KeyCode.D, ["e"] = Enum.KeyCode.E, ["f"] = Enum.KeyCode.F,
    ["g"] = Enum.KeyCode.G, ["h"] = Enum.KeyCode.H, ["i"] = Enum.KeyCode.I,
    ["j"] = Enum.KeyCode.J, ["k"] = Enum.KeyCode.K, ["l"] = Enum.KeyCode.L,
    ["m"] = Enum.KeyCode.M, ["n"] = Enum.KeyCode.N, ["o"] = Enum.KeyCode.O,
    ["p"] = Enum.KeyCode.P, ["q"] = Enum.KeyCode.Q, ["r"] = Enum.KeyCode.R,
    ["s"] = Enum.KeyCode.S, ["t"] = Enum.KeyCode.T, ["u"] = Enum.KeyCode.U,
    ["v"] = Enum.KeyCode.V, ["w"] = Enum.KeyCode.W, ["x"] = Enum.KeyCode.X,
    ["y"] = Enum.KeyCode.Y, ["z"] = Enum.KeyCode.Z,

    ["0"] = Enum.KeyCode.Zero,
    ["1"] = Enum.KeyCode.One,
    ["2"] = Enum.KeyCode.Two,
    ["3"] = Enum.KeyCode.Three,
    ["4"] = Enum.KeyCode.Four,
    ["5"] = Enum.KeyCode.Five,
    ["6"] = Enum.KeyCode.Six,
    ["7"] = Enum.KeyCode.Seven,
    ["8"] = Enum.KeyCode.Eight,
    ["9"] = Enum.KeyCode.Nine,

    [" "] = Enum.KeyCode.Space
}

-- symbols that require SHIFT
local shiftMap = {
    ["!"] = Enum.KeyCode.One,
    ["@"] = Enum.KeyCode.Two,
    ["#"] = Enum.KeyCode.Three,
    ["$"] = Enum.KeyCode.Four,
    ["%"] = Enum.KeyCode.Five,
    ["^"] = Enum.KeyCode.Six,
    ["&"] = Enum.KeyCode.Seven,
    ["*"] = Enum.KeyCode.Eight,
    ["("] = Enum.KeyCode.Nine,
    [")"] = Enum.KeyCode.Zero,
}

local function type(text)
    for i = 1, #text do
        local char = text:sub(i, i)
        local lower = char:lower()

        local key
        local needsShift = false

        -- symbol first
        if shiftMap[char] then
            key = shiftMap[char]
            needsShift = true

        -- letters / numbers / space
        else
            key = keyMap[lower]

            if char:match("%u") then
                needsShift = true
            end
        end

        if key then
            if needsShift then
                vim:SendKeyEvent(true, shift, false, game)
            end

            vim:SendKeyEvent(true, key, false, game)
            task.wait(0.03)
            vim:SendKeyEvent(false, key, false, game)

            if needsShift then
                vim:SendKeyEvent(false, shift, false, game)
            end

            task.wait(0.03)
        end
    end
end
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

