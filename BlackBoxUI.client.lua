-- Place this LocalScript in StarterPlayer > StarterPlayerScripts.
-- It creates a black box in the center of each player's screen.

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local existingGui = playerGui:FindFirstChild("BlackBoxUI")
if existingGui then
	existingGui:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlackBoxUI"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

local box = Instance.new("Frame")
box.Name = "BlackBox"
box.AnchorPoint = Vector2.new(0.5, 0.5)
box.Position = UDim2.fromScale(0.5, 0.5)
box.Size = UDim2.fromOffset(300, 180)
box.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
box.BorderSizePixel = 0
box.Parent = screenGui
