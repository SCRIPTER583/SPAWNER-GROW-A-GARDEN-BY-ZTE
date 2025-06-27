-- Arc Spawner GUI w/ Key System | Parent: PlayerGui (for Delta support)

if game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("ArcSpawner") then
    game.Players.LocalPlayer.PlayerGui:FindFirstChild("ArcSpawner"):Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "ArcSpawner"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local TweenService = game:GetService("TweenService")

-- GUI: Key Prompt First
local keyGui = Instance.new("Frame", gui)
keyGui.Size = UDim2.new(0, 300, 0, 150)
keyGui.Position = UDim2.new(0.5, -150, 0.5, -75)
keyGui.BackgroundColor3 = Color3.fromRGB(40, 0, 70)
Instance.new("UICorner", keyGui).CornerRadius = UDim.new(0, 12)

local keyTitle = Instance.new("TextLabel", keyGui)
keyTitle.Size = UDim2.new(1, 0, 0, 30)
keyTitle.Text = "🔐 ARC KEY SYSTEM"
keyTitle.BackgroundTransparency = 1
keyTitle.TextColor3 = Color3.new(1, 1, 1)
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextSize = 18

local getKeyBtn = Instance.new("TextButton", keyGui)
getKeyBtn.Size = UDim2.new(0.8, 0, 0, 30)
getKeyBtn.Position = UDim2.new(0.1, 0, 0.35, 0)
getKeyBtn.Text = "📋 Get Key"
getKeyBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
getKeyBtn.TextColor3 = Color3.new(1,1,1)
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 14
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 8)

local keyBox = Instance.new("TextBox", keyGui)
keyBox.Size = UDim2.new(0.8, 0, 0, 30)
keyBox.Position = UDim2.new(0.1, 0, 0.6, 0)
keyBox.PlaceholderText = "Enter Key Here"
keyBox.TextColor3 = Color3.new(1, 1, 1)
keyBox.BackgroundColor3 = Color3.fromRGB(60, 0, 100)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 8)

local checkKeyBtn = Instance.new("TextButton", keyGui)
checkKeyBtn.Size = UDim2.new(0.6, 0, 0, 30)
checkKeyBtn.Position = UDim2.new(0.2, 0, 0.8, 0)
checkKeyBtn.Text = "✅ Check Key"
checkKeyBtn.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
checkKeyBtn.TextColor3 = Color3.new(1,1,1)
checkKeyBtn.Font = Enum.Font.GothamBold
checkKeyBtn.TextSize = 14
Instance.new("UICorner", checkKeyBtn).CornerRadius = UDim.new(0, 8)

getKeyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://ads.luarmor.net/get_key?for=Key-iXiGlKtHgVSd")
end)

-- Toggle Button (hidden initially)
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0, 140, 0, 40)
toggle.Position = UDim2.new(0, 20, 0.5, -20)
toggle.Text = "ARC SPAWNER"
toggle.BackgroundColor3 = Color3.fromRGB(140, 0, 255)
toggle.TextColor3 = Color3.new(1,1,1)
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 16
toggle.Draggable = true
toggle.Active = true
toggle.Visible = false
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 10)

-- Main GUI (starts hidden)
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 350, 0, 270)
main.Position = UDim2.new(0.5, -175, 0.5, -135)
main.BackgroundColor3 = Color3.fromRGB(60, 0, 90)
main.BackgroundTransparency = 0.5
main.Visible = false
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 20)

-- Lock + Minimize
local locked = false

local lockBtn = Instance.new("TextButton", main)
lockBtn.Size = UDim2.new(0, 30, 0, 30)
lockBtn.Position = UDim2.new(1, -70, 0, 0)
lockBtn.Text = "🔓"
lockBtn.BackgroundTransparency = 1
lockBtn.TextSize = 18
lockBtn.Font = Enum.Font.GothamBold
lockBtn.TextColor3 = Color3.new(1,1,1)

local minBtn = Instance.new("TextButton", main)
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -35, 0, 0)
minBtn.Text = "➖"
minBtn.BackgroundTransparency = 1
minBtn.TextSize = 18
minBtn.Font = Enum.Font.GothamBold
minBtn.TextColor3 = Color3.new(1,1,1)

lockBtn.MouseButton1Click:Connect(function()
    locked = not locked
    lockBtn.Text = locked and "🔒" or "🔓"
    main.Active = not locked
    main.Draggable = not locked
end)

minBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    toggle.Visible = true
end)

toggle.MouseButton1Click:Connect(function()
    toggle.Visible = false
    main.Visible = true
end)

-- Key Check Logic
checkKeyBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == "Key-iXiGlKtHgVSd" then
        keyGui.Visible = false
        toggle.Visible = true
    else
        keyBox.Text = "❌ Invalid Key"
    end
end)
