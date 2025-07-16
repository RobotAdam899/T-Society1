if game.Players.LocalPlayer.Name ~= "donhirsizi97" then return end

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "GlitchGui"

local Button = Instance.new("TextButton", ScreenGui)
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.1, 0)
Button.Text = "🌪️ GLITCH SUNUCU"
Button.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBlack
Button.TextScaled = true

Button.MouseButton1Click:Connect(function()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local root = plr.Character.HumanoidRootPart
            spawn(function()
                for i = 1, 30 do
                    root.CFrame *= CFrame.Angles(0.2, 0.3, 0.1)
                    root.Velocity = Vector3.new(math.random(-50, 50), math.random(50, 100), math.random(-50, 50))
                    wait(0.05)
                end
            end)
        end
    end

    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and not obj:IsDescendantOf(game.Players.LocalPlayer.Character) then
            spawn(function()
                for i = 1, 20 do
                    obj.CFrame *= CFrame.new(math.random(-3,3), math.random(-3,3), math.random(-3,3))
                    wait(0.05)
                end
            end)
        end
    end

    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "⚠️ T-SOCIETY: Sunucu fiziksel bozulmaya uğradı. Glitch Mod Aktif.";
        Color = Color3.fromRGB(255, 0, 0);
        Font = Enum.Font.Arcade;
        FontSize = Enum.FontSize.Size96;
    })
end)
