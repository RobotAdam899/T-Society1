local player = game.Players.LocalPlayer
if player.Name ~= "donhirsizi97" then return end

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "TSocietyGUI"

local remote = game.ReplicatedStorage:WaitForChild("T_SOCIETY_REMOTE")

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
		remote:FireServer(action)
	end)
end

createButton("💣 C4 PATLAT", 100, "c4")
createButton("🧲 EŞYA YAĞMURU", 160, "spam")
createButton("🚫 SHUTDOWN", 220, "shutdown")
