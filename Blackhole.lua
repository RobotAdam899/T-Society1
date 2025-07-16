-- T-SOCIETY KIYAMETİ v1.0 - by botkullanici099
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- UI
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "TSOCIETY_KIYAMET"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 260, 0, 100)
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

local button = Instance.new("TextButton", main)
button.Size = UDim2.new(0.9, 0, 0.5, 0)
button.Position = UDim2.new(0.05, 0, 0.4, 0)
button.Text = "☠️ BRING ALL PARTS"
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Kara delik merkezi
local blackhole = Instance.new("Part", Workspace)
blackhole.Anchored = true
blackhole.CanCollide = false
blackhole.Shape = Enum.PartType.Ball
blackhole.Size = Vector3.new(10, 10, 10)
blackhole.Material = Enum.Material.Neon
blackhole.Color = Color3.fromRGB(0, 0, 0)
blackhole.Position = Vector3.new(0, 20, 0)
blackhole.Name = "TSOCIETY_BLACKHOLE"

local attach0 = Instance.new("Attachment", blackhole)

-- Network ayarı
getgenv().T_SO_Network = {
	BaseParts = {},
	Velocity = Vector3.new(14, 14, 14)
}

local function RetainPart(part)
	if part:IsA("BasePart") and part:IsDescendantOf(Workspace) and not part.Anchored then
		table.insert(getgenv().T_SO_Network.BaseParts, part)
		part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
		part.CanCollide = false
	end
end

-- Fizik kontrol
RunService.Heartbeat:Connect(function()
	sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
	for _, part in pairs(getgenv().T_SO_Network.BaseParts) do
		if part:IsDescendantOf(Workspace) then
			part.Velocity = getgenv().T_SO_Network.Velocity
		end
	end
end)

-- Uçuş yapıştırma efekti
local function ForcePart(v)
	if v:IsA("BasePart") and not v.Anchored and not v.Parent:FindFirstChildOfClass("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
		for _, obj in pairs(v:GetChildren()) do
			if obj:IsA("BodyMover") or obj:IsA("RocketPropulsion") then obj:Destroy() end
		end
		if v:FindFirstChildOfClass("Attachment") then v:FindFirstChildOfClass("Attachment"):Destroy() end
		v.CanCollide = false

		local torque = Instance.new("Torque", v)
		torque.Torque = Vector3.new(1e6, 1e6, 1e6)

		local align = Instance.new("AlignPosition", v)
		local att = Instance.new("Attachment", v)
		torque.Attachment0 = att
		align.Attachment0 = att
		align.Attachment1 = attach0
		align.MaxForce = math.huge
		align.MaxVelocity = math.huge
		align.Responsiveness = 200
	end
end

-- Efekti tetikle
button.MouseButton1Click:Connect(function()
	for _, obj in pairs(Workspace:GetDescendants()) do
		ForcePart(obj)
	end
end)
