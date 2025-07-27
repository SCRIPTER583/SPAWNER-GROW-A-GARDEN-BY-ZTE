if game.CoreGui:FindFirstChild("ArcSpawner") then
    game.CoreGui:FindFirstChild("ArcSpawner"):Destroy()
end

local Spawner = loadstring(game:HttpGet("https://codeberg.org/GrowAFilipino/GrowAGarden/raw/branch/main/Spawner.lua"))()
Spawner.Load()

local TweenService = game:GetService("TweenService")

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ArcSpawner"

-- Toggle button
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0, 140, 0, 40)
toggle.Position = UDim2.new(0, 20, 0.5, -20)
toggle.Text = "ARC SPAWNER"
toggle.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 16
toggle.Draggable = true
toggle.Active = true
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 10)

-- Main GUI
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 500, 0, 300)
main.Position = UDim2.new(0.5, -250, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
main.BackgroundTransparency = 0.05
main.Visible = false
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 20)

-- RGB outline
local outline = Instance.new("UIStroke", main)
outline.Thickness = 2
task.spawn(function()
    while true do
        for h = 0, 1, 0.01 do
            outline.Color = Color3.fromHSV(h, 1, 1)
            task.wait(0.03)
        end
    end
end)

-- Tabs and Content
local Tabs = Instance.new("Frame", main)
Tabs.Size = UDim2.new(0, 100, 1, 0)
Tabs.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", Tabs).CornerRadius = UDim.new(0, 12)

local Content = Instance.new("Frame", main)
Content.Position = UDim2.new(0, 100, 0, 0)
Content.Size = UDim2.new(1, -100, 1, 0)
Content.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 12)

-- Tab creator
local function createTab(name, callback)
	local btn = Instance.new("TextButton", Tabs)
	btn.Size = UDim2.new(1, 0, 0, 50)
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BorderSizePixel = 0
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
	btn.MouseButton1Click:Connect(callback)
end

local function clearContent()
	for _, child in pairs(Content:GetChildren()) do
		if not child:IsA("UICorner") then
			child:Destroy()
		end
	end
end

-- Seed Tab
createTab("Seed", function()
	clearContent()
	local box = Instance.new("TextBox", Content)
	box.Size = UDim2.new(1, -20, 0, 40)
	box.Position = UDim2.new(0, 10, 0, 10)
	box.PlaceholderText = "Enter seed name"
	box.TextColor3 = Color3.new(1,1,1)
	box.BackgroundColor3 = Color3.fromRGB(60,60,60)
	Instance.new("UICorner", box)

	local btn = Instance.new("TextButton", Content)
	btn.Size = UDim2.new(0, 120, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, 60)
	btn.Text = "Spawn Seed"
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(140,0,255)
	Instance.new("UICorner", btn)
	btn.MouseButton1Click:Connect(function()
		Spawner.SpawnSeed(box.Text)
	end)
end)

-- Egg Tab
createTab("Egg", function()
	clearContent()
	local box = Instance.new("TextBox", Content)
	box.Size = UDim2.new(1, -20, 0, 40)
	box.Position = UDim2.new(0, 10, 0, 10)
	box.PlaceholderText = "Enter egg name"
	box.TextColor3 = Color3.new(1,1,1)
	box.BackgroundColor3 = Color3.fromRGB(60,60,60)
	Instance.new("UICorner", box)

	local btn = Instance.new("TextButton", Content)
	btn.Size = UDim2.new(0, 120, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, 60)
	btn.Text = "Spawn Egg"
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(140,0,255)
	Instance.new("UICorner", btn)
	btn.MouseButton1Click:Connect(function()
		Spawner.SpawnEgg(box.Text)
	end)
end)

-- Pet Tab
createTab("Pet", function()
	clearContent()

	local nameBox = Instance.new("TextBox", Content)
	nameBox.Size = UDim2.new(1, -20, 0, 30)
	nameBox.Position = UDim2.new(0, 10, 0, 10)
	nameBox.PlaceholderText = "Pet Name"
	nameBox.TextColor3 = Color3.new(1,1,1)
	nameBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
	Instance.new("UICorner", nameBox)

	local kgBox = Instance.new("TextBox", Content)
	kgBox.Size = UDim2.new(1, -20, 0, 30)
	kgBox.Position = UDim2.new(0, 10, 0, 50)
	kgBox.PlaceholderText = "KG"
	kgBox.TextColor3 = Color3.new(1,1,1)
	kgBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
	Instance.new("UICorner", kgBox)

	local ageBox = Instance.new("TextBox", Content)
	ageBox.Size = UDim2.new(1, -20, 0, 30)
	ageBox.Position = UDim2.new(0, 10, 0, 90)
	ageBox.PlaceholderText = "Age"
	ageBox.TextColor3 = Color3.new(1,1,1)
	ageBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
	Instance.new("UICorner", ageBox)

	local btn = Instance.new("TextButton", Content)
	btn.Size = UDim2.new(0, 120, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, 130)
	btn.Text = "Spawn Pet"
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(140,0,255)
	Instance.new("UICorner", btn)
	btn.MouseButton1Click:Connect(function()
		Spawner.SpawnPet(nameBox.Text, tonumber(kgBox.Text) or 1, tonumber(ageBox.Text) or 1)
	end)
end)

-- Spin Tab
createTab("Spin", function()
	clearContent()
	local box = Instance.new("TextBox", Content)
	box.Size = UDim2.new(1, -20, 0, 40)
	box.Position = UDim2.new(0, 10, 0, 10)
	box.PlaceholderText = "Enter plant name"
	box.TextColor3 = Color3.new(1,1,1)
	box.BackgroundColor3 = Color3.fromRGB(60,60,60)
	Instance.new("UICorner", box)

	local btn = Instance.new("TextButton", Content)
	btn.Size = UDim2.new(0, 120, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, 60)
	btn.Text = "Spin"
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(140,0,255)
	Instance.new("UICorner", btn)
	btn.MouseButton1Click:Connect(function()
		Spawner.Spin(box.Text)
	end)
end)

-- Morph Animation
local originalSize = main.Size
local originalPos = main.Position

toggle.MouseButton1Click:Connect(function()
	main.Position = toggle.Position
	main.Size = toggle.Size
	main.Visible = true
	toggle.Visible = false
	TweenService:Create(main, TweenInfo.new(0.3), {
		Size = originalSize,
		Position = originalPos,
		BackgroundTransparency = 0.05
	}):Play()
end)
