local player = game.Players.LocalPlayer
if player.Name ~= "donhirsizi97" then return end

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "TSocietyGUI"

-- Fonksiyon: Buton oluşturucu
local function createButton(text, posY, callback)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, 200, 0, 50)
	btn.Position = UDim2.new(0, 30, 0, posY)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 18
	btn.Parent = gui
	btn.MouseButton1Click:Connect(callback)
end

-- REPORT * Fonksiyonu
local function reportAll()
	for _, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			for i = 1, 5 do
				game.StarterGui:SetCore("ChatMakeSystemMessage", {
					Text = "🚨 T-SOCIETY: "..plr.Name.." oyuncusu Raporlanıyor...",
					Color = Color3.fromRGB(255, 100, 100)
				})
				wait(0.2)
			end
		end
	end
end

-- LAG Fonksiyonu
local function lagAll()
	for _, plr in pairs(game.Players:GetPlayers()) do
		if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local root = plr.Character.HumanoidRootPart

			-- Işık spam
			for i = 1, 10 do
				local light = Instance.new("PointLight", root)
				light.Brightness = 999
				light.Range = 30
				game.Debris:AddItem(light, 5)
			end

			-- Araç spam
			for i = 1, 3 do
				local part = Instance.new("Part", workspace)
				part.Anchored = false
				part.Size = Vector3.new(5,2,8)
				part.Position = root.Position + Vector3.new(math.random(-10,10), 5, math.random(-10,10))
				part.BrickColor = BrickColor.Random()
				game.Debris:AddItem(part, 10)
			end
		end
	end

	-- Uyarı mesajı
	game.StarterGui:SetCore("ChatMakeSystemMessage", {
		Text = "⚠️ T-SOCIETY: Lag başlatıldı. Sunucu bozulacak.",
		Color = Color3.fromRGB(255, 0, 0)
	})
end

-- Butonlar oluşturuluyor
createButton("🚨 REPORT *", 100, reportAll)
createButton("💡 LAG EL FENERİ", 170, lagAll)
