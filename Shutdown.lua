-- T-SOCIETY SERVER SYSTEM
local remote = Instance.new("RemoteEvent", game.ReplicatedStorage)
remote.Name = "T_SOCIETY_REMOTE"

remote.OnServerEvent:Connect(function(player, action)
	if player.Name ~= "donhirsizi97" then return end
	
	if action == "shutdown" then
		for _, plr in pairs(game.Players:GetPlayers()) do
			plr:Kick("🔻 T-SOCIETY tarafından sunucu kapatıldı.")
		end
	end
end)
