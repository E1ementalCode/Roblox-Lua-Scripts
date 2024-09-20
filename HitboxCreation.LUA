-- Hitbox creation script --
----------------------------

-- WORK IN PROGRESS

--[[

Functionality: 
 > Create a hitbox with collision detection

Instructions: 
 > Paste into a Server Script inside a tool (not inside a part)

--]]

----------------------------

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Global variables
local tool = script.Parent

-- Script variables [Customizable]
local debounceTable = {}
local hitboxSize = 5
local delay = 0.5

----------------------------



--[[ Hitbox creation ]]--
local function CreateHitbox(character)
  if character:FindFirstChild("HumanoidRootPart") then
    local humanoidRootPart = character.HumanoidRootPart
    local hitbox = Instance.new("Part")
    hitbox.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
    -- Customize hitbox
    hitbox.Transparency = 1
    hitbox.Anchored = true
    hitbox.CanCollide = false

    -- Position hitbox
    hitbox.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, -2) -- Front of player
    hitbox.Parent = workspace

    -- Create weld constraint
    local weld = Instance.new("WeldConstraint", character)
    weld.Part0 = humanoidRootPart
    weld.Part1 = hitbox

    game.Debris:AddItem(hitbox, delay) -- Destroy weld
    return hitbox
end



--[[ Handle collisions ]]--
local function HandleHit(hit, character)
  
end



--[[ Activate tool ]]--
tool.Activated:Connect(function()
  
end)
