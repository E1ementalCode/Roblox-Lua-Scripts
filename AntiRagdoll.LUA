-- Anti-ragdoll script --
-------------------------
local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")

-------------------------



-- Disable humanoid states
humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)



--[[ Instructions:
	Place this inside of StarterCharacterScripts
	Make sure this is a local script
]]--
