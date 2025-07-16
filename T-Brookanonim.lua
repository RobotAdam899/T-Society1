-- T-SOCIETY DELTA GUI SYSTEM -- Only runs for user 'donhirsizi97'

local Players = game:GetService("Players") local ReplicatedStorage = game:GetService("ReplicatedStorage") local ChatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") and ReplicatedStorage.DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest") local LocalPlayer = Players.LocalPlayer

if LocalPlayer.Name ~= "donhirsizi97" then return end

-- GUI setup local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui")) gui.Name = "TSocietyGUI"

local function chatAll(msg) if ChatEvent then ChatEvent:FireServer(msg, "All") end end

-- Bot uyarısı (oyuncu azsa) if #Players:GetPlayers() <= 3 then chatAll("⚠️ T-SOCIETY: Sunucu çökecek. Ağlama yok.") end

local function createButton(text, posY, callback) local btn = Instance.new("TextButton") btn.Size = UDim2.new(0, 200, 0, 50) btn.Position = UDim2.new(0, 30, 0, posY) btn.Text = text btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20) btn.TextColor3 = Color3.new(1, 1, 1) btn.Font = Enum.Font.GothamBold btn.TextSize = 18 btn.Parent = gui btn.MouseButton1Click:Connect(callback) end

-- LAG COMMAND (light spam + car spam) local function lagEffect() chatAll("⚠️ T-SOCIETY: Bu sunucu fazla kontrol ediliyor. Hazır olun.") for _, plr in pairs(Players:GetPlayers()) do local char = plr.Character if char and char:FindFirstChild("Head") then for i = 1, 10 do local light = Instance.new("PointLight") light.Color = Color3.new(1, 1, 1) light.Brightness = 10 light.Range = 16 light.Parent = char.Head wait(0.1) end end end -- Vehicle spam for i = 1, 15 do local car = Instance.new("Part") car.Name = "TSOCAR" car.Size = Vector3.new(6, 2, 10) car.Position = Vector3.new(math.random(-200, 200), 10, math.random(-200, 200)) car.Anchored = false car.BrickColor = BrickColor.Random() car.Parent = workspace wait(0.2) end end

-- SHUTDOWN COMMAND local function shutdownAll() chatAll("🔒 T-SOCIETY: Bu sunucu kapatılacak.") for _, plr in pairs(Players:GetPlayers()) do if plr.Name ~= "donhirsizi97" then plr:Kick("🔒 T-SOCIETY tarafından sunucu kapatıldı.") end end end

-- REPORT ALL local function reportAll() for _, plr in pairs(Players:GetPlayers()) do if plr.Name ~= LocalPlayer.Name then LocalPlayer:ReportAbuse(plr, "Exploiting") wait(1) end end end

-- GLITCH MODE local function glitchAll() chatAll("⚠️ T-SOCIETY: Sistem fiziksel kararsızlığa sokuldu. Glitch mod aktif.") for _, obj in pairs(workspace:GetDescendants()) do if obj:IsA("BasePart") and not obj.Anchored then spawn(function() for i = 1, 20 do obj.Velocity = Vector3.new(math.random(-100,100), math.random(-100,100), math.random(-100,100)) wait(0.05) end end) end end end

-- GUI Buttons createButton("🌀 LAG", 100, lagEffect) createButton("🚫 SHUTDOWN", 160, shutdownAll) createButton("🚨 REPORT *", 220, reportAll) createButton("🌪️ GLITCH", 280, glitchAll)

