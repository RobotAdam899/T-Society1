local Players = game:GetService("Players")
local decalId = "rbxassetid://631940830" -- anonymous decal

for _, plr in pairs(Players:GetPlayers()) do
    local gui = Instance.new("ScreenGui")
    gui.Name = "DEKAL_GUI"
    gui.ResetOnSpawn = false
    gui.Parent = plr:WaitForChild("PlayerGui")

    for i = 1, 20 do
        local img = Instance.new("ImageLabel")
        img.Size = UDim2.new(0, math.random(150, 300), 0, math.random(150, 300))
        img.Position = UDim2.new(math.random(), 0, math.random(), 0)
        img.Image = decalId
        img.BackgroundTransparency = 1
        img.Rotation = math.random(0, 360)
        img.ZIndex = 10
        img.Parent = gui
    end
end
