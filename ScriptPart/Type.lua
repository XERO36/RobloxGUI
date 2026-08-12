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
    ["0"] = Enum.KeyCode.Zero, ["1"] = Enum.KeyCode.One, ["2"] = Enum.KeyCode.Two,
    ["3"] = Enum.KeyCode.Three, ["4"] = Enum.KeyCode.Four, ["5"] = Enum.KeyCode.Five,
    ["6"] = Enum.KeyCode.Six, ["7"] = Enum.KeyCode.Seven, ["8"] = Enum.KeyCode.Eight,
    ["9"] = Enum.KeyCode.Nine, [" "] = Enum.KeyCode.Space
}

local shiftMap = {
    ["!"] = Enum.KeyCode.One, ["@"] = Enum.KeyCode.Two, ["#"] = Enum.KeyCode.Three,
    ["$"] = Enum.KeyCode.Four, ["%"] = Enum.KeyCode.Five, ["^"] = Enum.KeyCode.Six,
    ["&"] = Enum.KeyCode.Seven, ["*"] = Enum.KeyCode.Eight, ["("] = Enum.KeyCode.Nine,
    [")"] = Enum.KeyCode.Zero
}

local function click(char, holdDuration)
    local key = shiftMap[char] or keyMap[char:lower()]
    if not key then return end

    local needsShift = shiftMap[char] ~= nil or char:match("%u") ~= nil
    local holdTime = holdDuration or 1 --Default wait timer in seconds

    -- Press keys down
    if needsShift then
        vim:SendKeyEvent(true, shift, false, game)
    end
    vim:SendKeyEvent(true, key, false, game)

    -- Wait timer (Hold state)
    task.wait(holdTime)

    -- Release keys
    vim:SendKeyEvent(false, key, false, game)
    if needsShift then
        vim:SendKeyEvent(false, shift, false, game)
    end
end
