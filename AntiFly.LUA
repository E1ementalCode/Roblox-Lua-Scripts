-- AntiFly anticheat script --
------------------------------

--[[

Functionality: 
 > Prevents most fly exploits
 > Kicks players once flying is detected

Instructions: 
 > Paste this into a local script
 > Place script inside of StarterPlayer.StarterPlayerScripts or a StarterGui element

--]]

------------------------------

local Players = game:GetService("Players")

-- Global variables
local player = Players.LocalPlayers
local character = player.Character or player.CharacterAdded:Wait()

-- Script variables
local cooldown = 0.10

---------------------



-- Prevent script modification
script.Changed:Connect(function(property)
    player:Kick("Attempted to modify script")
end)
script:Destroy()



--[[ Anti-fly check ]]--
local function AntiFly(newCharacter)
    for _, v in pairs(newCharacter:GetDescendants()) do
        if v:IsA("BodyForce") or v:IsA("BodyVelocity") or v:IsA("BodyPosition") or v:IsA("BodyAngularVelocity") or v:IsA("BodyGyro") or v:IsA("BodyThrust") then
            player:Kick("Fly exploits")
            return
        end
    end
end

-- Main loop
task.spawn(function()
    while task.wait(cooldown) do
        character = player.Character or player.CharacterAdded:Wait()
        AntiFly(character)
    end
end)
