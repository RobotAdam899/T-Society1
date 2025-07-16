local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "T_SOCIETY_GUI"

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, -25)
button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
button.TextColor3 = Color3.new(1,1,1)
button.Text = "🚨 Report All"
button.Font = Enum.Font.GothamBold
button.TextSize = 18
button.Parent = gui

button.MouseButton1Click:Connect(function()
	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer then
			game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("/report "..plr.Name, "All")
			wait(0.5)
		end
	end
end)
