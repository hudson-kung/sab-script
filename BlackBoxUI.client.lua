-- Place this LocalScript in StarterPlayer > StarterPlayerScripts.
-- It creates a black box in the center of each player's screen.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

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
box.Size = UDim2.fromOffset(620, 460)
box.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
box.BorderSizePixel = 0
box.Active = true
box.Parent = screenGui

local title = Instance.new("TextLabel")
title.Name = "Title"
title.BackgroundTransparency = 1
title.Position = UDim2.fromOffset(20, 14)
title.Size = UDim2.new(1, -40, 0, 34)
title.Font = Enum.Font.GothamBold
title.Text = "Italian Brainrot Servers"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = box

local list = Instance.new("ScrollingFrame")
list.Name = "ServerList"
list.BackgroundTransparency = 1
list.BorderSizePixel = 0
list.Position = UDim2.fromOffset(20, 60)
list.Size = UDim2.new(1, -40, 1, -80)
list.AutomaticCanvasSize = Enum.AutomaticSize.Y
list.CanvasSize = UDim2.new()
list.ScrollBarThickness = 6
list.Parent = box

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 10)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = list

local names = {
	"Tralalero Tralala",
	"Bombardiro Crocodilo",
	"Ballerina Cappuccina",
	"Chimpanzini Bananini",
	"Lirili Larila",
	"Tung Tung Tung Sahur",
}

for index, name in ipairs(names) do
	local entry = Instance.new("Frame")
	entry.Name = "Entry" .. index
	entry.Size = UDim2.new(1, -8, 0, 54)
	entry.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
	entry.BorderSizePixel = 0
	entry.LayoutOrder = index
	entry.Parent = list

	local entryName = Instance.new("TextLabel")
	entryName.Name = "Name"
	entryName.BackgroundTransparency = 1
	entryName.Position = UDim2.fromOffset(14, 0)
	entryName.Size = UDim2.new(1, -130, 1, 0)
	entryName.Font = Enum.Font.GothamMedium
	entryName.Text = name
	entryName.TextColor3 = Color3.fromRGB(255, 255, 255)
	entryName.TextSize = 18
	entryName.TextXAlignment = Enum.TextXAlignment.Left
	entryName.Parent = entry

	local joinButton = Instance.new("TextButton")
	joinButton.Name = "JoinButton"
	joinButton.AnchorPoint = Vector2.new(1, 0.5)
	joinButton.Position = UDim2.new(1, -10, 0.5, 0)
	joinButton.Size = UDim2.fromOffset(96, 34)
	joinButton.BackgroundColor3 = Color3.fromRGB(42, 180, 72)
	joinButton.BorderSizePixel = 0
	joinButton.Font = Enum.Font.GothamBold
	joinButton.Text = "Join"
	joinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	joinButton.TextSize = 16
	joinButton.Parent = entry

	joinButton.Activated:Connect(function()
		print("Join selected for " .. name)
	end)
end

local dragging = false
local dragStart
local startPosition

local function updatePosition(input)
	local delta = input.Position - dragStart
	box.Position = UDim2.new(
		startPosition.X.Scale,
		startPosition.X.Offset + delta.X,
		startPosition.Y.Scale,
		startPosition.Y.Offset + delta.Y
	)
end

box.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPosition = box.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
		updatePosition(input)
	end
end)
