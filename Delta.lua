local player = game.Players.LocalPlayer
if player.Name ~= "donhirsizi97" then return end

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "TSOCIETY_GUI"

local function createButton(text, posY, action)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 200, 0, 50)
	btn.Position = UDim2.new(0, 30, 0, posY)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 18
	btn.Parent = gui
	btn.MouseButton1Click:Connect(function()
		game.ReplicatedStorage:WaitForChild("T_SOCIETY_REMOTE"):FireServer(action)
	end)
end

-- Butonlar
createButton("💻 Laptop Lag All", 100, "laptoplag")
createButton("💣 C4 Patlat", 160, "c4")
createButton("🚨 Report All", 220, "report")
createButton("📦 Eşya Glitch (Yapışan)", 280, "glitchstick")
createButton("🌀 Eşya Uçuşu (Normal)", 340, "glitchnormal")
