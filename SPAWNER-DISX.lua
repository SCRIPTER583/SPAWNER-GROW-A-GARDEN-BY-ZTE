if game.CoreGui:FindFirstChild("ArcSpawner") then
    game.CoreGui:FindFirstChild("ArcSpawner"):Destroy()
end

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ArcSpawner"
gui.ResetOnSpawn = false

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

-- Toggle Button
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0, 140, 0, 40)
toggle.Position = UDim2.new(0, 20, 0.5, -20)
toggle.Text = "ARC SPAWNER"
toggle.TextSize = 16
toggle.Font = Enum.Font.GothamBold
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
toggle.BorderSizePixel = 0
toggle.Draggable = true
toggle.Active = true
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 12)

-- Main GUI
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 320, 0, 250)
main.Position = UDim2.new(0.5, -160, 0.5, -125)
main.BackgroundColor3 = Color3.fromRGB(60, 0, 90)
main.BackgroundTransparency = 0.5
main.Visible = false
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 20)

-- RGB Outline
local outline = Instance.new("UIStroke", main)
outline.Thickness = 2
outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

task.spawn(function()
    while true do
        for h = 0, 1, 0.01 do
            outline.Color = Color3.fromHSV(h, 1, 1)
            task.wait(0.03)
        end
    end
end)

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "ARC SPAWNER"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(200, 150, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- Minimize Button
local minimize = Instance.new("TextButton", main)
minimize.Size = UDim2.new(0, 24, 0, 24)
minimize.Position = UDim2.new(1, -30, 0, 6)
minimize.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
minimize.Text = "-"
minimize.TextColor3 = Color3.new(1, 1, 1)
minimize.Font = Enum.Font.GothamBold
minimize.TextSize = 18
Instance.new("UICorner", minimize).CornerRadius = UDim.new(1, 0)

-- Pin Button 🔓 / 🔒
local pinned = false
local pinBtn = Instance.new("TextButton", main)
pinBtn.Size = UDim2.new(0, 24, 0, 24)
pinBtn.Position = UDim2.new(1, -60, 0, 6)
pinBtn.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
pinBtn.Text = "🔓"
pinBtn.TextColor3 = Color3.new(1, 1, 1)
pinBtn.Font = Enum.Font.GothamBold
pinBtn.TextSize = 18
Instance.new("UICorner", pinBtn).CornerRadius = UDim.new(1, 0)

pinBtn.MouseButton1Click:Connect(function()
	pinned = not pinned
	pinBtn.Text = pinned and "🔒" or "🔓"
end)

-- Name Input
local nameBox = Instance.new("TextBox", main)
nameBox.Size = UDim2.new(0.8, 0, 0, 30)
nameBox.Position = UDim2.new(0.1, 0, 0.2, 0)
nameBox.PlaceholderText = "Pet/Seed Name"
nameBox.BackgroundColor3 = Color3.fromRGB(80, 0, 110)
nameBox.TextColor3 = Color3.new(1, 1, 1)
nameBox.TextSize = 16
nameBox.Font = Enum.Font.Gotham
Instance.new("UICorner", nameBox).CornerRadius = UDim.new(0, 10)

nameBox.Focused:Connect(function()
    nameBox.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
end)
nameBox.FocusLost:Connect(function()
    nameBox.BackgroundColor3 = Color3.fromRGB(80, 0, 110)
end)

-- Dropdown
local dropdown = Instance.new("ScrollingFrame", main)
dropdown.Size = UDim2.new(0.8, 0, 0, 60)
dropdown.Position = UDim2.new(0.1, 0, 0.35, 0)
dropdown.BackgroundColor3 = Color3.fromRGB(60, 0, 100)
dropdown.ScrollBarThickness = 4
dropdown.Visible = false
dropdown.CanvasSize = UDim2.new(0, 0, 0, 0)
Instance.new("UICorner", dropdown).CornerRadius = UDim.new(0, 10)

-- KG
local kgBox = Instance.new("TextBox", main)
kgBox.Size = UDim2.new(0.35, 0, 0, 30)
kgBox.Position = UDim2.new(0.1, 0, 0.6, 0)
kgBox.PlaceholderText = "KG"
kgBox.TextSize = 16
kgBox.Font = Enum.Font.Gotham
kgBox.TextColor3 = Color3.new(1, 1, 1)
kgBox.BackgroundColor3 = Color3.fromRGB(80, 0, 110)
Instance.new("UICorner", kgBox).CornerRadius = UDim.new(0, 10)

-- Age
local ageBox = Instance.new("TextBox", main)
ageBox.Size = UDim2.new(0.35, 0, 0, 30)
ageBox.Position = UDim2.new(0.55, 0, 0.6, 0)
ageBox.PlaceholderText = "Age"
ageBox.TextSize = 16
ageBox.Font = Enum.Font.Gotham
ageBox.TextColor3 = Color3.new(1, 1, 1)
ageBox.BackgroundColor3 = Color3.fromRGB(80, 0, 110)
Instance.new("UICorner", ageBox).CornerRadius = UDim.new(0, 10)

-- Spawn Button
local spawnBtn = Instance.new("TextButton", main)
spawnBtn.Size = UDim2.new(0.6, 0, 0, 30)
spawnBtn.Position = UDim2.new(0.2, 0, 0.83, 0)
spawnBtn.Text = "Spawn"
spawnBtn.TextSize = 16
spawnBtn.Font = Enum.Font.GothamBold
spawnBtn.TextColor3 = Color3.new(1, 1, 1)
spawnBtn.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
Instance.new("UICorner", spawnBtn).CornerRadius = UDim.new(0, 10)

-- Animation Helpers
local function tween(obj, props, time)
	return TweenService:Create(obj, TweenInfo.new(time, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props)
end

local startSize = main.Size
local startPos = main.Position

-- Toggle Button Open GUI
toggle.MouseButton1Click:Connect(function()
	main.Position = toggle.Position
	main.Size = toggle.Size
	main.BackgroundTransparency = 1
	main.Visible = true
	toggle.Visible = false
	for _, obj in pairs(main:GetDescendants()) do
		if obj:IsA("GuiObject") and obj ~= title then
			obj.Visible = false
		end
	end
	tween(main, {Size = startSize, Position = startPos, BackgroundTransparency = 0.5}, 0.3):Play()
	task.wait(0.3)
	for _, obj in pairs(main:GetDescendants()) do
		if obj:IsA("GuiObject") then
			obj.Visible = true
		end
	end
end)

-- Minimize to Toggle
minimize.MouseButton1Click:Connect(function()
	if pinned then return end
	local pos = toggle.Position
	local size = toggle.Size
	for _, obj in pairs(main:GetDescendants()) do
		if obj:IsA("GuiObject") and obj ~= title then
			obj.Visible = false
		end
	end
	tween(main, {Size = size, Position = pos, BackgroundTransparency = 1}, 0.3):Play()
	task.wait(0.3)
	main.Visible = false
	toggle.Visible = true
end)

-- Load Spawner
local success, Spawner = pcall(function()
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/DeltaGay/femboy/refs/heads/main/GardenSpawner.lua"))()
end)

local allItems = {}
if success and Spawner then
	for _, v in ipairs(Spawner.GetPets()) do table.insert(allItems, {type = "Pet", name = v}) end
	for _, v in ipairs(Spawner.GetSeeds()) do table.insert(allItems, {type = "Seed", name = v}) end

	local function updateDropdown(text)
		dropdown:ClearAllChildren()
		local y = 0
		for _, item in ipairs(allItems) do
			if text == "" or string.find(item.name:lower(), text:lower()) then
				local opt = Instance.new("TextButton", dropdown)
				opt.Size = UDim2.new(1, 0, 0, 25)
				opt.Position = UDim2.new(0, 0, 0, y)
				opt.Text = item.name
				opt.TextColor3 = Color3.new(1, 1, 1)
				opt.Font = Enum.Font.Gotham
				opt.TextSize = 14
				opt.BackgroundColor3 = Color3.fromRGB(100, 0, 140)
				opt.MouseButton1Click:Connect(function()
					nameBox.Text = item.name
					dropdown.Visible = false
				end)
				y += 25
			end
		end
		dropdown.CanvasSize = UDim2.new(0, 0, 0, y)
		dropdown.Visible = y > 0
	end

	nameBox:GetPropertyChangedSignal("Text"):Connect(function()
		updateDropdown(nameBox.Text)
	end)

	spawnBtn.MouseButton1Click:Connect(function()
		local name = nameBox.Text
		local kg = tonumber(kgBox.Text) or 1
		local age = tonumber(ageBox.Text) or 1
		for _, item in ipairs(allItems) do
			if item.name:lower() == name:lower() then
				if item.type == "Pet" then
					Spawner.SpawnPet(item.name, kg, age)
				elseif item.type == "Seed" then
					Spawner.SpawnSeed(item.name)
				end
			end
		end
	end)
else
	spawnBtn.Text = "Failed"
	spawnBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
end
