-- Force field remover --
-------------------------

--[[

Functionality: 
 > Destroys a player's forcefield on spawn

Instructions: 
 > Paste this into a server script
 > Place script inside of StarterCharacterScripts

--]]

-------------------------

local character = script.Parent

while task.wait() do
	local forcefield = character:FindFirstChild("ForceField")
	if forcefield then
		forcefield:Destroy()
		break
	end
end
