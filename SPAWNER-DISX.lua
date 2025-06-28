if game.CoreGui:FindFirstChild("ArcSpawner") then
    game.CoreGui:FindFirstChild("ArcSpawner"):Destroy()
end

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ArcSpawner"

local TweenService = game:GetService("TweenService")

-- Toggle Button
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
main.Size = UDim2.new(0, 350, 0, 270)
main.Position = UDim2.new(0.5, -175, 0.5, -135)
main.BackgroundColor3 = Color3.fromRGB(60, 0, 90)
main.BackgroundTransparency = 0.5
main.Visible = false
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 20)

-- RGB Outline
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

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "ARC SPAWNER"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(200, 150, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- Tab System
local tabNames = {"Seed", "Egg", "Pet"}
local tabs = {}
local activeTab

for i, tab in ipairs(tabNames) do
    local tabBtn = Instance.new("TextButton", main)
    tabBtn.Size = UDim2.new(0, 100, 0, 25)
    tabBtn.Position = UDim2.new(0, 10 + (i - 1) * 110, 0, 40)
    tabBtn.Text = "Spawn " .. tab
    tabBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 140)
    tabBtn.TextColor3 = Color3.new(1, 1, 1)
    tabBtn.Font = Enum.Font.GothamBold
    tabBtn.TextSize = 14
    Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0, 8)

    local content = Instance.new("Frame", main)
    content.Size = UDim2.new(1, -20, 0, 150)
    content.Position = UDim2.new(0, 10, 0, 75)
    content.BackgroundTransparency = 1
    content.Visible = false
    tabs[tab] = content

    tabBtn.MouseButton1Click:Connect(function()
        if activeTab then tabs[activeTab].Visible = false end
        activeTab = tab
        tabs[activeTab].Visible = true
    end)
end

-- Reload Button
local reloadBtn = Instance.new("TextButton", main)
reloadBtn.Size = UDim2.new(0, 100, 0, 25)
reloadBtn.Position = UDim2.new(1, -110, 0, 40)
reloadBtn.Text = "🔄 Reload"
reloadBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 110)
reloadBtn.TextColor3 = Color3.new(1,1,1)
reloadBtn.Font = Enum.Font.GothamBold
reloadBtn.TextSize = 14
Instance.new("UICorner", reloadBtn).CornerRadius = UDim.new(0, 8)

-- Seed Tab UI
local seedBox = Instance.new("TextBox", tabs.Seed)
seedBox.Size = UDim2.new(0.8, 0, 0, 30)
seedBox.Position = UDim2.new(0.1, 0, 0.1, 0)
seedBox.PlaceholderText = "Seed Name"
seedBox.BackgroundColor3 = Color3.fromRGB(80, 0, 110)
seedBox.TextColor3 = Color3.new(1, 1, 1)
seedBox.TextSize = 16
Instance.new("UICorner", seedBox).CornerRadius = UDim.new(0, 8)

local seedBtn = Instance.new("TextButton", tabs.Seed)
seedBtn.Size = UDim2.new(0.6, 0, 0, 30)
seedBtn.Position = UDim2.new(0.2, 0, 0.5, 0)
seedBtn.Text = "Spawn Seed"
seedBtn.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
seedBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", seedBtn).CornerRadius = UDim.new(0, 10)

-- Egg Tab UI
local eggBox = seedBox:Clone()
eggBox.Parent = tabs.Egg
eggBox.PlaceholderText = "Egg Name"

local eggBtn = seedBtn:Clone()
eggBtn.Parent = tabs.Egg
eggBtn.Text = "Spawn Egg"

-- Pet Tab UI
local petBox = seedBox:Clone()
petBox.Parent = tabs.Pet
petBox.PlaceholderText = "Pet Name"

local kgBox = Instance.new("TextBox", tabs.Pet)
kgBox.Size = UDim2.new(0.35, 0, 0, 30)
kgBox.Position = UDim2.new(0.1, 0, 0.4, 0)
kgBox.PlaceholderText = "KG"
kgBox.TextColor3 = Color3.new(1, 1, 1)
kgBox.BackgroundColor3 = Color3.fromRGB(80, 0, 110)
Instance.new("UICorner", kgBox).CornerRadius = UDim.new(0, 8)

local ageBox = kgBox:Clone()
ageBox.Position = UDim2.new(0.55, 0, 0.4, 0)
ageBox.PlaceholderText = "Age"
ageBox.Parent = tabs.Pet

local petBtn = seedBtn:Clone()
petBtn.Parent = tabs.Pet
petBtn.Text = "Spawn Pet"
petBtn.Position = UDim2.new(0.2, 0, 0.75, 0)

-- Tween helper
local function tween(obj, props, time)
    TweenService:Create(obj, TweenInfo.new(time, Enum.EasingStyle.Quad), props):Play()
end

-- Morphing animation on toggle
local startSize = main.Size
local startPos = main.Position

toggle.MouseButton1Click:Connect(function()
    main.Position = toggle.Position
    main.Size = toggle.Size
    main.Visible = true
    toggle.Visible = false
    tween(main, {Size = startSize, Position = startPos, BackgroundTransparency = 0.5}, 0.3)
end)

-- Spawner loader
local Spawner

local function TryLoadSpawner()
    local raw = game:HttpGet("https://raw.githubusercontent.com/GrowAFilippino/GrowAGarden/refs/heads/main/Spawner.lua")
    local success, result = pcall(function()
        return loadstring(raw)()
    end)

    if success and type(result) == "table" and result.SpawnPet then
        Spawner = result
        print("✅ Spawner loaded.")

        seedBtn.MouseButton1Click:Connect(function()
            Spawner.SpawnSeed(seedBox.Text)
        end)
        eggBtn.MouseButton1Click:Connect(function()
            Spawner.SpawnEgg(eggBox.Text)
        end)
        petBtn.MouseButton1Click:Connect(function()
            Spawner.SpawnPet(petBox.Text, tonumber(kgBox.Text) or 1, tonumber(ageBox.Text) or 1)
        end)
    else
        warn("❌ Spawner not ready. Enter the key in the external GUI first.")
    end
end

reloadBtn.MouseButton1Click:Connect(function()
    TryLoadSpawner()
end)

-- Auto-try load once
TryLoadSpawner()
