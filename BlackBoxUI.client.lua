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

local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 56)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleBar.BorderSizePixel = 0
titleBar.Parent = box

local title = Instance.new("TextLabel")
title.Name = "Title"
title.BackgroundTransparency = 1
title.Position = UDim2.fromOffset(20, 0)
title.Size = UDim2.new(1, -136, 1, 0)
title.Font = Enum.Font.GothamBold
title.Text = "Permeable Brainrot Sniper"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.AnchorPoint = Vector2.new(1, 0.5)
minimizeButton.Position = UDim2.new(1, -62, 0.5, 0)
minimizeButton.Size = UDim2.fromOffset(38, 34)
minimizeButton.BackgroundColor3 = Color3.fromRGB(110, 110, 110)
minimizeButton.BorderSizePixel = 0
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.Text = "−"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.TextSize = 24
minimizeButton.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.AnchorPoint = Vector2.new(1, 0.5)
closeButton.Position = UDim2.new(1, -16, 0.5, 0)
closeButton.Size = UDim2.fromOffset(38, 34)
closeButton.BackgroundColor3 = Color3.fromRGB(190, 55, 55)
closeButton.BorderSizePixel = 0
closeButton.Font = Enum.Font.GothamBold
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 26
closeButton.Parent = titleBar

local list = Instance.new("ScrollingFrame")
list.Name = "ServerList"
list.BackgroundTransparency = 1
list.BorderSizePixel = 0
list.Position = UDim2.fromOffset(20, 112)
list.Size = UDim2.new(1, -40, 1, -132)
list.AutomaticCanvasSize = Enum.AutomaticSize.Y
list.CanvasSize = UDim2.new()
list.ScrollBarThickness = 6
list.Parent = box

local expandedSize = box.Size
local minimized = false

minimizeButton.Activated:Connect(function()
	minimized = not minimized
	list.Visible = not minimized
	box.Size = minimized and UDim2.fromOffset(expandedSize.X.Offset, 56) or expandedSize
	minimizeButton.Text = minimized and "+" or "−"
end)

closeButton.Activated:Connect(function()
	screenGui:Destroy()
end)

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 10)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = list

local filterBar = Instance.new("Frame")
filterBar.Name = "FilterBar"
filterBar.BackgroundTransparency = 1
filterBar.Position = UDim2.fromOffset(20, 66)
filterBar.Size = UDim2.new(1, -40, 0, 36)
filterBar.Parent = box

local filterLayout = Instance.new("UIListLayout")
filterLayout.FillDirection = Enum.FillDirection.Horizontal
filterLayout.Padding = UDim.new(0, 10)
filterLayout.SortOrder = Enum.SortOrder.LayoutOrder
filterLayout.Parent = filterBar

local brainrots = {
	{ name = "Dragon Cannelloni", rate = "1.7B/s", value = 1700 },
	{ name = "Elephant", rate = "1.5B/s", value = 1500 },
	{ name = "Dragon Cannelloni II", rate = "1.2B/s", value = 1200 },
	{ name = "Dragon Cannelloni III", rate = "800M/s", value = 800 },
	{ name = "Strawberry Elephant", rate = "750M/s", value = 750 },
	{ name = "Headless Horseman", rate = "600M/s", value = 600, og = true },
	{ name = "Dragon Cannelloni IV", rate = "500M/s", value = 500 },
	{ name = "Skibidi Toilet", rate = "450M/s", value = 450, og = true },
	{ name = "Dragon Cannelloni V", rate = "250M/s", value = 250 },
}

local entries = {}

for index, brainrot in ipairs(brainrots) do
	local entry = Instance.new("Frame")
	entry.Name = "Entry" .. index
	entry.Size = UDim2.new(1, -8, 0, 64)
	entry.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
	entry.BorderSizePixel = 0
	entry.LayoutOrder = index
	entry.Parent = list

	local entryName = Instance.new("TextLabel")
	entryName.Name = "Name"
	entryName.BackgroundTransparency = 1
	entryName.Position = UDim2.fromOffset(14, 5)
	entryName.Size = UDim2.new(1, -130, 0, 28)
	entryName.Font = Enum.Font.GothamMedium
	entryName.Text = brainrot.name
	entryName.TextColor3 = Color3.fromRGB(255, 255, 255)
	entryName.TextSize = 18
	entryName.TextXAlignment = Enum.TextXAlignment.Left
	entryName.Parent = entry

	local rate = Instance.new("TextLabel")
	rate.Name = "MoneyRate"
	rate.BackgroundTransparency = 1
	rate.Position = UDim2.fromOffset(14, 31)
	rate.Size = UDim2.new(1, -130, 0, 24)
	rate.Font = Enum.Font.Gotham
	rate.Text = brainrot.rate
	rate.TextColor3 = Color3.fromRGB(195, 195, 195)
	rate.TextSize = 14
	rate.TextXAlignment = Enum.TextXAlignment.Left
	rate.Parent = entry

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
		print("Join selected for " .. brainrot.name)
	end)

	table.insert(entries, { frame = entry, value = brainrot.value, og = brainrot.og })
end

local emptyMessage = Instance.new("TextLabel")
emptyMessage.Name = "EmptyMessage"
emptyMessage.BackgroundTransparency = 1
emptyMessage.Size = UDim2.new(1, -8, 0, 54)
emptyMessage.Font = Enum.Font.GothamMedium
emptyMessage.Text = "No entries available."
emptyMessage.TextColor3 = Color3.fromRGB(195, 195, 195)
emptyMessage.TextSize = 16
emptyMessage.Visible = false
emptyMessage.Parent = list

local filterButtons = {}

local function setFilter(minimumValue, ogOnly)
	local visibleCount = 0

	for _, entryData in ipairs(entries) do
		local shouldShow = if ogOnly then entryData.og else minimumValue == nil or entryData.value >= minimumValue
		entryData.frame.Visible = shouldShow
		if shouldShow then
			visibleCount += 1
		end
	end

	emptyMessage.Visible = visibleCount == 0
	list.CanvasPosition = Vector2.new(0, 0)
end

local function createFilterButton(text, minimumValue, ogOnly)
	local filterButton = Instance.new("TextButton")
	filterButton.Name = text .. "Button"
	filterButton.Size = UDim2.fromOffset(186, 36)
	filterButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
	filterButton.BorderSizePixel = 0
	filterButton.Font = Enum.Font.GothamBold
	filterButton.Text = text
	filterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	filterButton.TextSize = 15
	filterButton.Parent = filterBar

	filterButton.Activated:Connect(function()
		setFilter(minimumValue, ogOnly)
		for _, button in ipairs(filterButtons) do
			button.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
		end
		filterButton.BackgroundColor3 = Color3.fromRGB(42, 180, 72)
	end)

	table.insert(filterButtons, filterButton)
	return filterButton
end

local hundredMillionButton = createFilterButton("100M+", 100, false)
createFilterButton("1B+", 1000, false)
createFilterButton("OG", nil, true)
hundredMillionButton.BackgroundColor3 = Color3.fromRGB(42, 180, 72)
setFilter(100, false)

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
