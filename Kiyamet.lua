local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- GUI oluştur
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

-- Fizik etkisi
local function chaosPart(part)
	if part:IsA("BasePart") and not part.Anchored and not part:IsDescendantOf(Players) then
		part.CanCollide = false
		local att = Instance.new("Attachment", part)

		local torque = Instance.new("Torque", part)
		torque.Torque = Vector3.new(1e6, 1e6, 1e6)
		torque.Attachment0 = att

		local align = Instance.new("AlignPosition", part)
		align.Attachment0 = att
		align.Position = part.Position + Vector3.new(
			math.random(-30, 30),
			math.random(20, 60),
			math.random(-30, 30)
		)
		align.MaxForce = Vector3.new(9e5, 9e5, 9e5)
		align.Responsiveness = 250
	end
end

-- Bring butonu
bringBtn.MouseButton1Click:Connect(function()
	for _, obj in pairs(Workspace:GetDescendants()) do
		if math.random() < 0.6 then
			chaosPart(obj)
		end
	end

	-- Diğer oyunculara yapışan objeler
	for _, plr in pairs(Players:GetPlayers()) do
		if plr.Name ~= "botkullanici099" and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local part = Instance.new("Part", Workspace)
			part.Size = Vector3.new(4,4,4)
			part.Anchored = false
			part.CanCollide = false
			part.Position = plr.Character.HumanoidRootPart.Position + Vector3.new(0, math.random(4,10), 0)
			part.BrickColor = BrickColor.Random()

			chaosPart(part)

			local weld = Instance.new("WeldConstraint", part)
			weld.Part0 = part
			weld.Part1 = plr.Character.HumanoidRootPart
		end
	end
end)

-- Hortum efekti
tornadoBtn.MouseButton1Click:Connect(function()
	for _, obj in pairs(Workspace:GetDescendants()) do
		if obj:IsA("Torque") or obj:IsA("AlignPosition") or obj:IsA("Attachment") then
			obj:Destroy()
		elseif obj:IsA("BasePart") and not obj.Anchored and not obj:IsDescendantOf(Players) then
			if math.random() < 0.3 then
				obj.Velocity = Vector3.new(
					math.random(-80,80),
					math.random(150,250),
					math.random(-80,80)
				)
			elseif math.random() < 0.1 then
				obj:Destroy()
			end
		end
	end
end)
