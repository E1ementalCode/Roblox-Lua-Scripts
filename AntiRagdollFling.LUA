-- Anti ragdoll fling script --
-------------------------------

--[[
Functionality: 
 > Prevents flinging of character after ragdolled
 > Relies on platform stand ragdoll system (humanoid)

Instructions: 
 > Paste this into a local script
 > Place script inside of StarterCharacterScripts

--]]

-------------------------------

-- Global variables
local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")



-- Disable humanoid states
humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
