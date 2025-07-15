local player = game.Players.LocalPlayer
if player.Name ~= "donhirsizi97" then return end

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "TSocietyGUI"

local remote = Instance.new("RemoteEvent", game.ReplicatedStorage)
remote.Name = "T_SOCIETY_REMOTE"

-- GUI Tasarım
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

-- FUN MENÜ
createButton("🔪 Kill All", 100, "kill")
createButton("🌌 Void All", 160, "void")
createButton("🚀 Super Jump All", 220, "jump")

-- TROLL MENÜ
createButton("😱 Jumpscare All", 300, "jumpscare")
createButton("💣 Give C4 Only", 360, "c4")
createButton("🚗 Fling Cars", 420, "flingcars")
createButton("🏠 Delete Houses", 480, "deletehouses")
createButton("🚫 Shutdown Server", 540, "shutdown")

-- SERVER KISMI (Remote dinleyici)
remote.OnServerEvent:Connect(function(plr, action)
	if plr.Name ~= "donhirsizi97" then return end
	for _, target in pairs(game.Players:GetPlayers()) do
		if action == "kill" then
			target.Character:BreakJoints()
		elseif action == "void" then
			target.Character:MoveTo(Vector3.new(0, -500, 0))
		elseif action == "jump" then
			target.Character.Humanoid.JumpPower = 500
			target.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		elseif action == "jumpscare" then
			local gui = Instance.new("ScreenGui", target:WaitForChild("PlayerGui"))
			local img = Instance.new("ImageLabel", gui)
			img.Size = UDim2.new(1,0,1,0)
			img.Image = "rbxassetid://10493265218" -- Jumpscare image ID
			img.BackgroundTransparency = 1
			wait(2)
			gui:Destroy()
		elseif action == "c4" then
			local tool = Instance.new("Tool")
			tool.Name = "C4"
			local handle = Instance.new("Part")
			handle.Name = "Handle"
			handle.Size = Vector3.new(1,1,1)
			handle.Anchored = false
			handle.Parent = tool
			tool.RequiresHandle = true
			tool.Handle = handle
			tool.Parent = target.Backpack

			wait(1)
			local explosion = Instance.new("Explosion")
			explosion.Position = target.Character.HumanoidRootPart.Position
			explosion.BlastRadius = 20
			explosion.Parent = workspace

			-- fling
			target.Character.HumanoidRootPart.Velocity = Vector3.new(0,100,0)
		elseif action == "flingcars" then
			for _, v in pairs(workspace:GetDescendants()) do
				if v:IsA("VehicleSeat") and v:IsDescendantOf(workspace) then
					v.Parent:PivotTo(v.Parent:GetPivot() + Vector3.new(0,50,0))
				end
			end
		elseif action == "deletehouses" then
			for _, v in pairs(workspace:GetDescendants()) do
				if v.Name:lower():find("house") then
					v:Destroy()
				end
			end
		elseif action == "shutdown" then
			target:Kick("🛑 T-SOCIETY - Server Shutdown")
		end
	end
end)
