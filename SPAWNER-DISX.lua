-- Load the Spawner module
local Spawner = loadstring(game:HttpGet("https://codeberg.org/GrowAFilipino/GrowAGarden/raw/branch/main/Spawner.lua"))()

-- Load default UI
Spawner.Load()

-- GUI Creation
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "ArcSpawner"
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 500, 0, 300)
Main.Position = UDim2.new(0.5, -250, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Main.BorderSizePixel = 0
Main.Name = "Main"

local Tabs = Instance.new("Frame", Main)
Tabs.Size = UDim2.new(0, 100, 1, 0)
Tabs.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Tabs.BorderSizePixel = 0

local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0, 100, 0, 0)
Content.Size = UDim2.new(1, -100, 1, 0)
Content.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Content.BorderSizePixel = 0

local function createTab(name, callback)
	local btn = Instance.new("TextButton", Tabs)
	btn.Size = UDim2.new(1, 0, 0, 50)
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BorderSizePixel = 0
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
	local TextBox = Instance.new("TextBox", Content)
	TextBox.Size = UDim2.new(1, -20, 0, 40)
	TextBox.Position = UDim2.new(0, 10, 0, 10)
	TextBox.PlaceholderText = "Enter seed name"
	TextBox.Text = ""
	TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	TextBox.TextColor3 = Color3.new(1,1,1)

	local Spawn = Instance.new("TextButton", Content)
	Spawn.Size = UDim2.new(0, 100, 0, 40)
	Spawn.Position = UDim2.new(0, 10, 0, 60)
	Spawn.Text = "Spawn Seed"
	Spawn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	Spawn.TextColor3 = Color3.new(1,1,1)
	Spawn.MouseButton1Click:Connect(function()
		Spawner.SpawnSeed(TextBox.Text)
	end)
end)

-- Egg Tab
createTab("Egg", function()
	clearContent()
	local TextBox = Instance.new("TextBox", Content)
	TextBox.Size = UDim2.new(1, -20, 0, 40)
	TextBox.Position = UDim2.new(0, 10, 0, 10)
	TextBox.PlaceholderText = "Enter egg name"
	TextBox.Text = ""
	TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	TextBox.TextColor3 = Color3.new(1,1,1)

	local Spawn = Instance.new("TextButton", Content)
	Spawn.Size = UDim2.new(0, 100, 0, 40)
	Spawn.Position = UDim2.new(0, 10, 0, 60)
	Spawn.Text = "Spawn Egg"
	Spawn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	Spawn.TextColor3 = Color3.new(1,1,1)
	Spawn.MouseButton1Click:Connect(function()
		Spawner.SpawnEgg(TextBox.Text)
	end)
end)

-- Pet Tab
createTab("Pet", function()
	clearContent()
	local PetName = Instance.new("TextBox", Content)
	PetName.Size = UDim2.new(1, -20, 0, 30)
	PetName.Position = UDim2.new(0, 10, 0, 10)
	PetName.PlaceholderText = "Enter pet name"
	PetName.Text = ""
	PetName.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	PetName.TextColor3 = Color3.new(1,1,1)

	local KG = Instance.new("TextBox", Content)
	KG.Size = UDim2.new(1, -20, 0, 30)
	KG.Position = UDim2.new(0, 10, 0, 50)
	KG.PlaceholderText = "KG"
	KG.Text = ""
	KG.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	KG.TextColor3 = Color3.new(1,1,1)

	local Age = Instance.new("TextBox", Content)
	Age.Size = UDim2.new(1, -20, 0, 30)
	Age.Position = UDim2.new(0, 10, 0, 90)
	Age.PlaceholderText = "Age"
	Age.Text = ""
	Age.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	Age.TextColor3 = Color3.new(1,1,1)

	local Spawn = Instance.new("TextButton", Content)
	Spawn.Size = UDim2.new(0, 120, 0, 40)
	Spawn.Position = UDim2.new(0, 10, 0, 130)
	Spawn.Text = "Spawn Pet"
	Spawn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	Spawn.TextColor3 = Color3.new(1,1,1)
	Spawn.MouseButton1Click:Connect(function()
		local name = PetName.Text
		local kg = tonumber(KG.Text) or 1
		local age = tonumber(Age.Text) or 1
		Spawner.SpawnPet(name, kg, age)
	end)
end)

-- Spin Tab
createTab("Spin", function()
	clearContent()
	local TextBox = Instance.new("TextBox", Content)
	TextBox.Size = UDim2.new(1, -20, 0, 40)
	TextBox.Position = UDim2.new(0, 10, 0, 10)
	TextBox.PlaceholderText = "Enter plant name"
	TextBox.Text = ""
	TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	TextBox.TextColor3 = Color3.new(1,1,1)

	local Spin = Instance.new("TextButton", Content)
	Spin.Size = UDim2.new(0, 100, 0, 40)
	Spin.Position = UDim2.new(0, 10, 0, 60)
	Spin.Text = "Spin"
	Spin.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	Spin.TextColor3 = Color3.new(1,1,1)
	Spin.MouseButton1Click:Connect(function()
		Spawner.Spin(TextBox.Text)
	end)
end)
