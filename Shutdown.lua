local player = game.Players.LocalPlayer
if player.Name ~= "naberbot98w" then return end

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "TSOCIETY_GUI"

local tabs = {
    {Name="TROLL", Color=Color3.fromRGB(200, 0, 0)},
    {Name="FUN", Color=Color3.fromRGB(0, 170, 255)},
    {Name="LAG", Color=Color3.fromRGB(255, 170, 0)},
    {Name="GLITCH", Color=Color3.fromRGB(130, 0, 255)}
}

local remote = game.ReplicatedStorage:WaitForChild("T_SOCIETY_REMOTE")

-- Sekme Butonları
local tabFrames = {}
for i, tab in ipairs(tabs) do
    local btn = Instance.new("TextButton", gui)
    btn.Size = UDim2.new(0, 100, 0, 30)
    btn.Position = UDim2.new(0, (i-1)*110 + 10, 0, 10)
    btn.Text = tab.Name
    btn.BackgroundColor3 = tab.Color
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14

    local frame = Instance.new("Frame", gui)
    frame.Position = UDim2.new(0, 10, 0, 50)
    frame.Size = UDim2.new(0, 450, 0, 300)
    frame.Visible = (i == 1)
    frame.BackgroundTransparency = 1
    tabFrames[tab.Name] = frame

    btn.MouseButton1Click:Connect(function()
        for _, f in pairs(tabFrames) do f.Visible = false end
        frame.Visible = true
    end)
end

-- Buton Oluşturucu
local function createButton(tabName, text, y, action)
    local btn = Instance.new("TextButton", tabFrames[tabName])
    btn.Size = UDim2.new(0, 200, 0, 40)
    btn.Position = UDim2.new(0, 20, 0, y)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(function()
        remote:FireServer(action)
    end)
end

-- TROLL
createButton("TROLL", "😱 Jumpscare All", 10, "jumpscare")
createButton("TROLL", "💣 C4 Patlat", 60, "c4")
createButton("TROLL", "🚗 Fling Cars", 110, "flingcars")
createButton("TROLL", "🏠 Delete Houses", 160, "deletehouses")
createButton("TROLL", "❌ Shutdown Server", 210, "shutdown")

-- FUN
createButton("FUN", "🔪 Kill All", 10, "killall")
createButton("FUN", "🪂 Void All", 60, "voidall")
createButton("FUN", "🚀 Super Jump All", 110, "superjump")

-- LAG
createButton("LAG", "💻 Laptop Lag All", 10, "laptoplag")
createButton("LAG", "🔦 Lag El Feneri", 60, "lagflash")
createButton("LAG", "🚙 Lag Cars", 110, "lagcars")

-- GLITCH
createButton("GLITCH", "📦 Eşya Glitch (Yapışan)", 10, "glitchstick")
createButton("GLITCH", "🌀 Eşya Glitch (Normal)", 60, "glitchnormal")
createButton("GLITCH", "🎭 Oyuncuya Yapışan", 110, "glitchplayer")
