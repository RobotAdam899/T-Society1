local remote = game:GetService("ReplicatedStorage"):WaitForChild("T_SOCIETY_REMOTE")

remote.OnServerEvent:Connect(function(player, action)
	if action == "c4" then
		for _, plr in pairs(game.Players:GetPlayers()) do
			local char = plr.Character
			if char and char:FindFirstChild("HumanoidRootPart") then
				local explosion = Instance.new("Explosion")
				explosion.Position = char.HumanoidRootPart.Position
				explosion.BlastRadius = 6
				explosion.BlastPressure = 0
				explosion.DestroyJointRadiusPercent = 0
				explosion.Parent = workspace
			end
		end
	elseif action == "nuke" then
		for _, plr in pairs(game.Players:GetPlayers()) do
			local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
			gui.Name = "NUKE_EFFECT"
			local blackout = Instance.new("Frame", gui)
			blackout.BackgroundColor3 = Color3.new(0,0,0)
			blackout.Size = UDim2.new(1,0,1,0)
			blackout.BackgroundTransparency = 1
			local label = Instance.new("TextLabel", blackout)
			label.Size = UDim2.new(1,0,0.3,0)
			label.Position = UDim2.new(0,0,0.35,0)
			label.Text = "☢️ NÜKLEER DETONASYON ☢️"
			label.TextScaled = true
			label.Font = Enum.Font.Arcade
			label.TextColor3 = Color3.new(1,0,0)
			label.BackgroundTransparency = 1
			for i = 1, 10 do
				blackout.BackgroundTransparency = blackout.BackgroundTransparency - 0.1
				wait(0.1)
			end
			wait(4)
			gui:Destroy()
		end
	elseif action == "spam" then
		for _, plr in pairs(game.Players:GetPlayers()) do
			for i = 1, 10 do
				local pos = plr.Character and plr.Character:FindFirstChild("Head") and plr.Character.Head.Position or Vector3.new(0,10,0)
				local part = Instance.new("Part")
				part.Size = Vector3.new(1,1,1)
				part.Position = pos + Vector3.new(math.random(-5,5),10,math.random(-5,5))
				part.Anchored = false
				part.CanCollide = true
				part.Material = Enum.Material.Neon
				part.BrickColor = BrickColor.Random()
				part.Shape = Enum.PartType.Ball
				part.Parent = workspace
				game:GetService("Debris"):AddItem(part, 5)
			end
		end
	elseif action == "shutdown" then
		for _, plr in pairs(game.Players:GetPlayers()) do
			plr:Kick("🔒 T‑SOCIETY tarafından sunucu kapatıldı.")
		end
	end
end)
