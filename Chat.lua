local player = game.Players.LocalPlayer
if player.Name ~= "donhirsizi97" then return end

local function reportAll()
	for _, target in pairs(game.Players:GetPlayers()) do
		if target ~= player then
			coroutine.wrap(function()
				for i = 1, 5 do
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
						"/report " .. target.Name,
						"All"
					)
					wait(0.3)
				end
			end)()
		end
	end
end

-- Sohbette komut dinle
game.Players.LocalPlayer.Chatted:Connect(function(msg)
	if msg:lower() == "report *" then
		reportAll()
	end
end)
