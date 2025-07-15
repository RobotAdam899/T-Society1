local player = game.Players.LocalPlayer
if player.Name ~= "donhirsizi97" then return end

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "TSocietyDeltaLite"

local remote = Instance.new("RemoteEvent", game.ReplicatedStorage)
remote.Name = "T_SOCIETY_DELTA"

-- Buton oluşturucu
local function createButton(text, posY, action)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 200, 0, 40)
	btn.Position = UDim2.new(0, 20, 0, posY)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	btn.Parent = gui
	btn.MouseButton1Click:Connect(function()
		remote:FireServer(action)
	end)
end

-- FUN
createButton("🔪 Kill All", 100, "kill")
createButton("🌌 Void All", 150, "void")
createButton("🚀 Super Jump All", 200, "jump")

-- TROLL
createButton("😱 Jumpscare", 270, "jumpscare")
createButton("💣 Give C4 Only", 320, "c4")
createButton("🚫 Shutdown", 370, "shutdown")

-- Remote işleyici (server-side gibi simüle)
remote.OnServerEvent:Connect(function(plr, action)
	if plr.Name ~= "donhirsizi97" then return end
	for _, target in pairs(game.Players:GetPlayers()) do
		if action == "kill" then
			if target.Character then
				target.Character:BreakJoints()
			end
		elseif action == "void" then
			if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
				target.Character:MoveTo(Vector3.new(0, -250, 0))
			end
		elseif action == "jump" then
			if target.Character and target.Character:FindFirstChild("Humanoid") then
				target.Character.Humanoid.JumpPower = 300
				target.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		elseif action == "jumpscare" then
			local gui = Instance.new("ScreenGui", target:WaitForChild("PlayerGui"))
			local img = Instance.new("ImageLabel", gui)
			img.Size = UDim2.new(1, 0, 1, 0)
			img.Image = "rbxassetid://10493265218"
			img.BackgroundTransparency = 1
			wait(2)
			gui:Destroy()
		elseif action == "c4" then
			local tool = Instance.new("Tool")
			tool.Name = "C4"
			local handle = Instance.new("Part")
			handle.Name = "Handle"
			handle.Size = Vector3.new(1,1,1)
			handle.Parent = tool
			tool.RequiresHandle = true
			tool.Handle = handle
			tool.Parent = target.Backpack

			wait(1)
			local boom = Instance.new("Explosion")
			if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
				boom.Position = target.Character.HumanoidRootPart.Position
				boom.BlastRadius = 15
				boom.Parent = workspace
				target.Character.HumanoidRootPart.Velocity = Vector3.new(0, 100, 0)
			end
		elseif action == "shutdown" then
			target:Kick("💀 T-SOCIETY tarafından atıldın.")
		end
	end
end)
