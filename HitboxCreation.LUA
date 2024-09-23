-- Hitbox creation/detection --
-------------------------------
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Global variables
local tool = script.Parent
local player = tool.Parent.Parent
local character = player.Character or player.CharacterAdded:Wait()

-- Script variables
local debounceTable = {}
local attacking = false
local hitboxSize = 5
local damage = 10
local attackDelay = 0.5

-------------------------------



--[[ Create hitbox ]]--
local function CreateHitbox()
	local hitbox = Instance.new("Part", workspace)
	hitbox.Name = "Hitbox"
	hitbox.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
	-- Customize hitbox
	hitbox.Transparency = 1
	hitbox.CanCollide = false
	hitbox.Massless = true
	hitbox.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2) -- Front of player

	-- Create weld
	local newWeld = Instance.new("WeldConstraint", character")
	newWeld.Part0 = hitbox
	newWeld.Part1 = character.RightArm
	game.Debris:AddItem(newWeld, attackDelay)

	return hitbox
end

--[[ Detect collisions ]]--
local function HandleHit(hit, hitbox)
	if hit.Name == "HumanoidRootPart" and hit.Parent ~= character then
		local humanoid = hit.Parent:FindFirstChild("Humanoid")
		local distance = (hitbox.Position - hit.Position).Magnitude

		-- Check distance
		if distance > hitbox.Size.X + 4 then return end

		-- Damage player
		if humanoid and not debounceTable[humanoid] then
			debounceTable[humanoid] = true

			humanoid.Health -= damage

			task.wait(attackDelay)
			debounceTable[humanoid] = nil
		end
	end
end

--[[ Activate tool ]]--
tool.Activated:Connect(function()
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

	if not attacking and humanoidRootPart then
		attacking = true

		-- Create hitbox
		local hitbox = CreateHitbox()
		hitbox.Touched:Connect(function(hit)
			HandleHit(hit, hitbox)
		end)

		-- Destroy hitbox
		task.wait(0.35) hitbox:Destroy()

		task.wait(attackDelay)
		attacking = false
	end
end)
