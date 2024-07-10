-- Forcefield remover --
------------------------
-- Place this script inside StarterCharacter

local character = script.Parent

while task.wait() do
	local forcefield = character:FindFirstChild("ForceField")
	-- If forcefield exists, destroy it
	if forcefield then
		forcefield:Destroy()
		break -- End loop
	end
end
