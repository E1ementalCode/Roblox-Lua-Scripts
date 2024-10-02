-- Tool activation --
---------------------
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Global variables
local tool = script.Parent
local player = tool.Parent.Parent
local character = player.Character

-- Script variables
local debounceTable = {}
local attacking = false
local attackDelay = 0.5
local hitboxSize = 4
local damage = 10

---------------------



--[[ Create hitbox ]]--
local function CreateHitbox()
	local hitbox = Instance.new("Part", tool)
	-- Position hitbox
	hitbox.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
	hitbox.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2) -- Front of player
	-- Customize hitbox
	hitbox.Transparency = 1
	hitbox.Anchored = false
	hitbox.CanCollide = false
	hitbox.Massless = true
	game.Debris:AddItem(hitbox, 0.35)
	
	-- Weld constraint
	local newWeld = Instance.new("WeldConstraint", hitbox)
	newWeld.Part0 = hitbox
	newWeld.Part1 = character["Right Arm"]
	game.Debris:AddItem(newWeld, 1)
	
	return hitbox
end



--[[ Hitbox handling ]]--
local function HandleHit(hit, hitbox)
	if hit.Name == "HumanoidRootPart" and hit.Position.Y < 25 and hit.Parent ~= character then
		local newHumanoid = hit.Parent:FindFirstChild("Humanoid")
		local distance = (hit.Position - hitbox.Position).Magnitude
		
		-- Check distance
		if distance > hitbox.Size.X * 2 then return end
		
		if not debounceTable[newHumanoid] then
			debounceTable[newHumanoid] = true
			
			newHumanoid.Health -= damage
			
			-- Keep track of players
			task.wait(attackDelay)
			debounceTable[newHumanoid] = nil
		end
	end
end



--[[ Attack activation ]]--
tool.Activated:Connect(function()
	-- Initialize variables
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	local humanoid = character:FindFirstChild("Humanoid")
	
	if not attacking and humanoidRootPart and humanoidRootPart.Position.Y < 25 then
		attacking = true
		
		task.wait(0.1)
		
		-- Create hitbox
		local hitbox = CreateHitbox()
		hitbox.Touched:Connect(function(hit)
			HandleHit(hit, hitbox)
		end)
		
		task.wait(attackDelay)
		attacking = false -- Cancel attack
	end
end)
