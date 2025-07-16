local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- GUI Oluştur
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "TSOCIETY_KIYAMET"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 260, 0, 120)
main.Position = UDim2.new(0.5, -130, 0.8, 0)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel", main)
title.Text = "☠️ T-SOCIETY KIYAMETİ ☠️"
title.Size = UDim2.new(1, 0, 0.3, 0)
title.TextColor3 = Color3.new(1, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.Arcade
title.TextScaled = true

-- Butonlar
local bringBtn = Instance.new("TextButton", main)
bringBtn.Size = UDim2.new(0.9, 0, 0.25, 0)
bringBtn.Position = UDim2.new(0.05, 0, 0.4, 0)
bringBtn.Text = "💥 Bring All Parts"
bringBtn.TextScaled = true
bringBtn.Font = Enum.Font.GothamBold
bringBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
bringBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local tornadoBtn = bringBtn:Clone()
tornadoBtn.Text = "🌪 Hortum"
tornadoBtn.Position = UDim2.new(0.05, 0, 0.7, 0)
tornadoBtn.Parent = main

-- Kara delik merkezi
local center = Instance.new("Part", workspace)
center.Anchored = true
center.CanCollide = false
center.Shape = Enum.PartType.Ball
center.Size = Vector3.new(12,12,12)
center.Material = Enum.Material.Neon
center.Color = Color3.fromRGB(0,0,0)
center.Position = Vector3.new(0,20,0)
center.Name = "TSC_BH_CENTER"

local attach0 = Instance.new("Attachment", center)

-- Fizik yapıştırma fonksiyonu
local function forcePart(v, target)
	if v:IsA("BasePart") and not v.Anchored and not v:IsDescendantOf(Players) and v.Name ~= "Handle" then
		v.CanCollide = false

		local att = Instance.new("Attachment", v)
		local torque = Instance.new("Torque", v)
		torque.Torque = Vector3.new(1e6, 1e6, 1e6)
		torque.Attachment0 = att

		local align = Instance.new("AlignPosition", v)
		align.Attachment0 = att
		align.Attachment1 = target
		align.MaxForce = math.huge
		align.Responsiveness = 300
	end
end

-- Bring All Parts (sana yapışmaz!)
bringBtn.MouseButton1Click:Connect(function()
	for _, obj in pairs(workspace:GetDescendants()) do
		if math.random() < 0.5 then
			forcePart(obj, attach0) -- merkeze çek
		else
			for _, plr in pairs(Players:GetPlayers()) do
				if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
					local att1 = Instance.new("Attachment", plr.Character.HumanoidRootPart)
					forcePart(obj, att1) -- sadece diğer oyunculara yapışır
				end
			end
		end
	end
end)

-- Hortum efekti
tornadoBtn.MouseButton1Click:Connect(function()
	for _, obj in pairs(workspace:GetDescendants()) do
		if obj:IsA("BasePart") and not obj.Anchored and not obj:IsDescendantOf(Players) then
			local bodyGyro = Instance.new("BodyGyro", obj)
			bodyGyro.D = 1000
			bodyGyro.P = 3000
			bodyGyro.MaxTorque = Vector3.new(1e6, 1e6, 1e6)

			local bodyPos = Instance.new("BodyPosition", obj)
			bodyPos.Position = center.Position + Vector3.new(math.random(-10,10), math.random(5,25), math.random(-10,10))
			bodyPos.MaxForce = Vector3.new(5e5, 5e5, 5e5)
		end
	end
end)
