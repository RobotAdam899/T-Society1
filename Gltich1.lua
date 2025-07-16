if game.Players.LocalPlayer.Name ~= "donhirsizi97" then return end

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "TSocietyGUI"

local btn = Instance.new("TextButton", gui)
btn.Size = UDim2.new(0, 250, 0, 50)
btn.Position = UDim2.new(0.5, -125, 0.1, 0)
btn.Text = "🌪️ T-SOCIETY: GLITCH MAP & PLAYERS"
btn.BackgroundColor3 = Color3.fromRGB(150, 0, 200)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.GothamBlack
btn.TextScaled = true

btn.MouseButton1Click:Connect(function()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local root = plr.Character.HumanoidRootPart

            -- Karakteri döndür ve savur
            spawn(function()
                for i = 1, 30 do
                    root.CFrame *= CFrame.Angles(0.2, 0.3, 0.1)
                    root.Velocity = Vector3.new(math.random(-100,100), math.random(50,150), math.random(-100,100))
                    wait(0.05)
                end
            end)

            -- Etrafına eşya spawn (herkes görür)
            for i = 1, 10 do
                local part = Instance.new("Part", workspace)
                part.Size = Vector3.new(2, 2, 2)
                part.Anchored = false
                part.CanCollide = true
                part.Position = root.Position + Vector3.new(math.random(-5,5), math.random(3,10), math.random(-5,5))
                part.Velocity = Vector3.new(math.random(-50,50), math.random(100,150), math.random(-50,50))
                part.BrickColor = BrickColor.Random()
                game.Debris:AddItem(part, 10)
            end
        end
    end

    -- Sohbete büyük uyarı mesajı
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "⚠️ T-SOCIETY: BROOKHAVEN GLITCH MOD AKTİF. Sunucu fiziksel çöküyor.";
        Color = Color3.fromRGB(255, 0, 0);
        Font = Enum.Font.Arcade;
        FontSize = Enum.FontSize.Size96;
    })
end)
