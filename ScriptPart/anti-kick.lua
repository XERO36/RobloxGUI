local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer

local isAdonis = false

--// Detect Adonis
local function checkAdonis(obj)
	if not obj:IsA("RemoteEvent") then
		return false
	end

	local func = obj:FindFirstChildWhichIsA("RemoteFunction")

	if not func then
		return false
	end

	if func.Name ~= "__FUNCTION" then
		return false
	end

	isAdonis = true

	print("[AntiKick] Adonis detected")

	return true
end

--// Wait for game load
repeat
	task.wait()
until game:IsLoaded()

--// Initial scan
for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
	checkAdonis(obj)
end

--// Watch for Adonis loading later
if not isAdonis then
	local connection

	connection = ReplicatedStorage.ChildAdded:Connect(function(obj)
		task.wait()

		if checkAdonis(obj) then
			connection:Disconnect()
		end
	end)
end

--// Utility logger
local function logBlock(action)
	local callingScript = getcallingscript()

	local source = callingScript
		and callingScript:GetFullName()
		or "Unknown"

	print(string.format(
		"[AntiKick] Blocked %s from: %s",
		action,
		source
	))
end

--// Hook :Kick()
local oldKick
oldKick = hookfunction(LocalPlayer.Kick, newcclosure(function(self, ...)
	if checkcaller() then
		return oldKick(self, ...)
	end

	logBlock("Kick")

	return task.wait(9e9)
end))

--// Hook :Destroy()
local oldDestroy
oldDestroy = hookfunction(LocalPlayer.Destroy, newcclosure(function(self, ...)
	if checkcaller() then
		return oldDestroy(self, ...)
	end

	logBlock("Destroy")

	return task.wait(9e9)
end))

--// Hook __namecall
local oldNamecall

oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
	if checkcaller() then
		return oldNamecall(self, ...)
	end

	local method = getnamecallmethod()

	if typeof(method) == "string" then
		method = method:lower()
	end

	if self == LocalPlayer then
		if method == "kick" then
			logBlock("Kick (__namecall)")
			return task.wait(9e9)
		end

		if method == "destroy" then
			logBlock("Destroy (__namecall)")
			return task.wait(9e9)
		end
	end

	return oldNamecall(self, ...)
end))

print("[AntiKick] Loaded successfully")
