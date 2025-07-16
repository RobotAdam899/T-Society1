-- ✅ T-SOCIETY DELTA: DECAL SPAM TETİKLEYİCİ
-- 🔒 Sadece botkullanici099 için çalışır

local player = game.Players.LocalPlayer
if player and player.Name == "botkullanici099" then
	local remote = game.ReplicatedStorage:WaitForChild("T_SOCIETY_REMOTE")
	remote:FireServer("decalspam")
else
	warn("❌ T-SOCIETY DELTA: Yetkin yok.")
end
