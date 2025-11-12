local WindUI = loadstring(game:HttpGet("  https://raw.githubusercontent.com/HB-ksdb/-HB-FXM/main/%E4%BF%84%E4%BA%A5%E4%BF%84%E5%B7%9EUI.txt"))()
-- ================ 2.Ul背景…… ================
local Window = WindUI:CreateWindow({
        Title = "HB FXM/俄亥俄州",
        Icon = "rbxassetid://4483362748",-- =  =背景右上角的图片
        IconTransparency = 0.5,
        IconThemed = true,
        Author = "作者:HB",-- = 名字 =
        Folder = "Midnight",
        Size = UDim2.fromOffset(300, 300),-- = 背景大小 =
        Transparent = true,
        User = {
            Enabled = true,
            Callback = function() print("clicked") end,
            Anonymous = false
        },
        SideBarWidth = 200,
        ScrollBarEnabled = true,
    })
    
-- ================ 3.窗口显示 ================
        Window:EditOpenButton({
            Title = "<font color='#FF0000'> HB FXM脚本</font>",
            Icon = "sword",
            CornerRadius = UDim.new(0, 16),
            StrokeThickness = 2,
            Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
            Draggable = true
        })

local LockSection = Window:Section({
    Title = "ohio功能",
    Opened = true,
})

local function AddTab(section, title, icon)
    return section:Tab({Title = title, Icon = icon})
end

local function Btn(tab, title, callback)
    return tab:Button({Title = title, Callback = callback})
end

local function Tg(tab, title, value, callback)
    return tab:Toggle({Title = title, Image = "bird", Value = value, Callback = callback})
end

local function Sld(tab, title, min, max, default, callback)
    return tab:Slider({Title = title, Step = 1, Value = {Min = min, Max = max, Default = default}, Callback = callback})
end

local A = AddTab(LockSection, "传送/功能", "rbxassetid://")
local B = AddTab(LockSection, "自动/保险", "rbxassetid://")
local C = AddTab(LockSection, "子追/范围", "rbxassetid://")
local D = AddTab(LockSection, "透视/绘制", "rbxassetid://")

Window:SelectTab(1)

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

local PlayerList = {}
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LP then
        PlayerList[#PlayerList + 1] = player.Name
    end
end

A:Dropdown({
    Title = '传送',
    Default = '',
    Values = {'银行','珠宝店','沙滩','武器店（撬锁）','武士刀','射线枪','加特林','锯掉','沙漠之鹰','警察局（M4A1）','AUG','军事基地（军甲）'},
    Callback = function(Value)
    local epoh2 = game:GetService('Players')
    local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
    if Value == '银行' then
        local epoh1 = CFrame.new(1055.94153, 15.11950874, -344.58374)
        epoh3.CFrame = epoh1
    elseif Value == '珠宝店' then
        local epoh1 = CFrame.new(1719.02637, 14.2831011, -714.293091)
        epoh3.CFrame = epoh1
    elseif Value == '沙滩' then
        local epoh1 = CFrame.new(998.4656372070312, 15, 395.9789733886719)
        epoh3.CFrame = epoh1
    elseif Value == '武器店（撬锁）' then
        local epoh1 = CFrame.new(660.5284423828125, 6.4081127643585205, -716.489990234375)
        epoh3.CFrame = epoh1
    elseif Value == '武士刀' then
        local epoh1 = CFrame.new(175.191, 13.937, -132.69)
        epoh3.CFrame = epoh1
    elseif Value == '射线枪' then
        local epoh1 = CFrame.new(148.685471, -90, -529.280945)
        epoh3.CFrame = epoh1
    elseif Value == '加特林' then
        local epoh1 = CFrame.new(364.97076416015625, 0.764974117279053, -1447.3302001953125)
        epoh3.CFrame = epoh1
    elseif Value == '锯掉' then
        local epoh1 = CFrame.new(1179.98523,40,-436.812683)
        epoh3.CFrame = epoh1
    elseif Value == '沙漠之鹰' then
        local epoh1 = CFrame.new(363.341461, 26.0798492, -259.681396)
        epoh3.CFrame = epoh1
    elseif Value == '警察局（M4A1）' then
        local epoh1 = CFrame.new(603.4676513671875,25.662811279296875,-922.0442504882812)
        epoh3.CFrame = epoh1
    elseif Value == 'AUG' then
        local epoh1 = CFrame.new(1170.500244140625,48.37138366699219,-772.55859375)
        epoh3.CFrame = epoh1
    elseif Value == '军事基地（军甲）' then
        local epoh1 = CFrame.new(563.4422607421875,28.502071380615234,-1472.780517578125)
        epoh3.CFrame = epoh1
    end
    end
})

A:Toggle({
    Title = '远程黑市',
    Default = false,
    Callback = function(Value)
    Dealer1 = Value
        if Dealer1 then
            Dealer2()
        end
    end    
})

A:Toggle({
    Title = '银行刷新提醒',
    Callback = function(Value)
    Bank1 = Value
        if Bank1 then
            Bank2()
        end
    end    
})
Bank2 = function()
    while Bank1 do
    wait(0.1)
    local Bank = game:GetService('Workspace').BankRobbery.BankCash.Cash:FindFirstChild('Bundle')
        if Bank then
            -- = 通知显示 =            
               WindUI:Notify({
                Name = '提示：',
                Content = '银行已刷新！',
                Image = 'rbxassetid://4483345998',
                Time = 5
            })
            wait(30)
        end
    end
end

A:Toggle({
    Title = '珠宝店刷新提醒',
    Callback = function(Value)
    Gem1 = Value
        if Gem1 then
            Gem2()
        end
    end    
})
Gem2 = function()
    while Gem1 do
    wait(0.1)
    local Ge = game:GetService('Workspace').GemRobbery:FindFirstChild('Rubble')
        if Ge then
            -- = 通知显示 =            
                WindUI:Notify({
                Name = '提示：',
                Content = '珠宝店已刷新！',
                Image = 'rbxassetid://4483345998',
                Time = 5
            })
            wait(30)
        end
    end
end

A:Toggle({
    Title = '传送大宝箱',
    Default = false,
    Callback = function(Value)
    LargeChest1 = Value
        if LargeChest1 then
            LargeChest2()
        end
    end    
})
LargeChest2 = function()
    while LargeChest1 do
    wait()
    local LargeChes = game:GetService('Workspace').Game.Entities.LargeChest
        local foundModel = false
        for _, model in pairs(LargeChes:GetChildren()) do
            if model.ClassName == 'Model' then
                foundModel = true
                local epoh1 = model.WorldPivot
                local epoh2 = game:GetService('Players')
                local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
                epoh3.CFrame = epoh1
                wait(0.3)
                model.Door["Meshes/LargeSafe1_Cube.002_Cube.003_None (3)"].Attachment.ProximityPrompt:InputHoldBegin()
                model.Door["Meshes/LargeSafe1_Cube.002_Cube.003_None (3)"].Attachment.ProximityPrompt:InputHoldEnd()
                wait(0.3)
                local epoh1 = CFrame.new(240.52850341796875, -120, -620)
                epoh3.CFrame = epoh1
                break
            end
        end
        if not foundModel then
            -- = 通知显示 =            
                WindUI:Notify({
                Name = '提示：',
                Content = '大宝箱未刷新！',
                Image = 'rbxassetid://4483345998',
                Time = 5
            })
            wait(30)
        end
    end
end

A:Toggle({
    Title = '秒拿珠宝店',
    Callback = function()
    local rocks = game:GetService('Workspace').GemRobbery.JewelryCases.HighYieldSpawns
    for _, obj in pairs(rocks:GetChildren()) do
        if obj.ClassName == 'Model' then
            for _, innerObj in pairs(obj:GetChildren()) do
                if innerObj.ClassName == 'Model' then
                    if innerObj.Name == 'Case' then
                    elseif innerObj.Name == 'Emerald' then
                        if innerObj:FindFirstChild('Handle') and innerObj.Handle:FindFirstChild('ProximityPrompt') then
                            innerObj.Handle.ProximityPrompt.HoldDuration = 0
                        end
                    elseif innerObj.Name == 'Sapphire' then
                        if innerObj:FindFirstChild('Handle') and innerObj.Handle:FindFirstChild('ProximityPrompt') then
                            innerObj.Handle.ProximityPrompt.HoldDuration = 0
                        end
                    elseif innerObj.Name == 'Amethyst' then
                        if innerObj:FindFirstChild('Handle') and innerObj.Handle:FindFirstChild('ProximityPrompt') then
                            innerObj.Handle.ProximityPrompt.HoldDuration = 0
                        end
                    elseif innerObj.Name == 'Topaz' then
                        if innerObj:FindFirstChild('Handle') and innerObj.Handle:FindFirstChild('ProximityPrompt') then
                            innerObj.Handle.ProximityPrompt.HoldDuration = 0
                        end                     
                    elseif innerObj.Name == 'Diamond' then
                        if innerObj:FindFirstChild('Handle') and innerObj.Handle:FindFirstChild('ProximityPrompt') then
                            innerObj.Handle.ProximityPrompt.HoldDuration = 0
                        end
                    elseif innerObj.Name == 'Gold Bar' then
                        if innerObj:FindFirstChild('Handle') and innerObj.Handle:FindFirstChild('ProximityPrompt') then
                            innerObj.Handle.ProximityPrompt.HoldDuration = 0
                        end
                    elseif innerObj.Name == 'Ruby' then
                        if innerObj:FindFirstChild('Handle') and innerObj.Handle:FindFirstChild('ProximityPrompt') then
                            innerObj.Handle.ProximityPrompt.HoldDuration = 0
                        end
                    else
                        if innerObj:FindFirstChild('Box') and innerObj.Box:FindFirstChild('ProximityPrompt') then
                            innerObj.Box.ProximityPrompt.HoldDuration = 0
                        end
                    end
                end
            end
        end
    end
    local rocks2 = game:GetService('Workspace').GemRobbery.JewelryCases.LowYieldSpawns
    for _, obj in pairs(rocks2:GetChildren()) do
        if obj.ClassName == 'Model' then
            for _, innerObj in pairs(obj:GetChildren()) do
                if innerObj.ClassName == 'Model' then
                    if innerObj.Name == 'Case' then
                    elseif innerObj.Name == 'Emerald' then
                        if innerObj:FindFirstChild('Handle') and innerObj.Handle:FindFirstChild('ProximityPrompt') then
                            innerObj.Handle.ProximityPrompt.HoldDuration = 0
                        end
                    elseif innerObj.Name == 'Sapphire' then
                        if innerObj:FindFirstChild('Handle') and innerObj.Handle:FindFirstChild('ProximityPrompt') then
                            innerObj.Handle.ProximityPrompt.HoldDuration = 0
                        end
                    elseif innerObj.Name == 'Amethyst' then
                        if innerObj:FindFirstChild('Handle') and innerObj.Handle:FindFirstChild('ProximityPrompt') then
                            innerObj.Handle.ProximityPrompt.HoldDuration = 0
                        end
                    elseif innerObj.Name == 'Topaz' then
                        if innerObj:FindFirstChild('Handle') and innerObj.Handle:FindFirstChild('ProximityPrompt') then
                            innerObj.Handle.ProximityPrompt.HoldDuration = 0
                        end
                    elseif innerObj.Name == 'Diamond' then
                        if innerObj:FindFirstChild('Handle') and innerObj.Handle:FindFirstChild('ProximityPrompt') then
                            innerObj.Handle.ProximityPrompt.HoldDuration = 0
                        end
                    elseif innerObj.Name == 'Gold Bar' then
                        if innerObj:FindFirstChild('Handle') and innerObj.Handle:FindFirstChild('ProximityPrompt') then
                            innerObj.Handle.ProximityPrompt.HoldDuration = 0
                        end
                    elseif innerObj.Name == 'Ruby' then
                        if innerObj:FindFirstChild('Handle') and innerObj.Handle:FindFirstChild('ProximityPrompt') then
                            innerObj.Handle.ProximityPrompt.HoldDuration = 0
                        end
                    else
                        if innerObj:FindFirstChild('Box') and innerObj.Box:FindFirstChild('ProximityPrompt') then
                            innerObj.Box.ProximityPrompt.HoldDuration = 0
                        end
                    end
                end
            end
        end
    end
    end    
})
Dealer2 = function()
    while Dealer1 do
    wait(0.1)
    game:GetService('Workspace').BlackMarket.Dealer.Dealer.ProximityPrompt.MaxActivationDistance = 100000
    end
    while not Dealer1 do
    wait(0.1)
    game:GetService('Workspace').BlackMarket.Dealer.Dealer.ProximityPrompt.MaxActivationDistance = 16
    end
end

A:Toggle({
    Title = '显示聊天框',
    Callback = function()
    ChatSee()
    end
})
ChatSee = function()
    game:GetService('Players').LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = true
    game:GetService('Players').LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Position = UDim2.new(0, 0, 0, 40)
end



B:Toggle({
    Title = '自动开金保险',
    Callback = function(Value)
    AutoSafe1 = Value
        if AutoSafe1 then
            AutoSafe2()
        end
    end    
})
AutoSafe2 = function()
    while AutoSafe1 do
        wait()
        local BankDoor = game:GetService("Workspace").BankRobbery.VaultDoor
        local epoh2 = game:GetService('Players')
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        if BankDoor.Door.Attachment.ProximityPrompt.Enabled == true then
            BankDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
            BankDoor.Door.Attachment.ProximityPrompt.MaxActivationDistance = 16
            local epoh1 = CFrame.new(1071.955810546875, 9, -343.80816650390625)
            epoh3.CFrame = epoh1
            wait(1)
            BankDoor.Door.Attachment.ProximityPrompt:InputHoldBegin()
            BankDoor.Door.Attachment.ProximityPrompt:InputHoldEnd()
            BankDoor.Door.Attachment.ProximityPrompt.Enabled = false
        end
        local GoldJewelSafes = game:GetService("Workspace").Game.Entities.GoldJewelSafe
        local foundModel = false
        for _, model in pairs(GoldJewelSafes:GetChildren()) do
            if model.ClassName == 'Model' then
                foundModel = true
                local epoh1 = model.WorldPivot
                epoh3.CFrame = epoh1
                wait(1)
                model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.HoldDuration = 0
                model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.MaxActivationDistance = 16
                if model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.Enabled == true then
                    model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldBegin()
                    model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldEnd()
                    wait(5)
                    model:Destroy()
                    break
                end
            end
        end
        if not foundModel then
-- = 通知显示 =            
                WindUI:Notify({
                Name = '提示：',
                Content = '金保险未刷新！',
                Image = 'rbxassetid://4483345998',
                Time = 5
            })
            wait(30)
        end
    end
end

B:Toggle({
    Title = '自动开黑保险',
    Callback = function(Value)
    AutoSafe3 = Value
        if AutoSafe3 then
            AutoSafe4()
        end
    end    
})
AutoSafe4 = function()
    while AutoSafe3 do
        wait()
        local BankDoor = game:GetService("Workspace").BankRobbery.VaultDoor
        local epoh2 = game:GetService('Players')
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        if BankDoor.Door.Attachment.ProximityPrompt.Enabled == true then
            BankDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
            BankDoor.Door.Attachment.ProximityPrompt.MaxActivationDistance = 16
            local epoh1 = CFrame.new(1071.955810546875, 9, -343.80816650390625)
            epoh3.CFrame = epoh1
            wait(1)
            BankDoor.Door.Attachment.ProximityPrompt:InputHoldBegin()
            BankDoor.Door.Attachment.ProximityPrompt:InputHoldEnd()
            BankDoor.Door.Attachment.ProximityPrompt.Enabled = false
        end
        local JewelSafes = game:GetService("Workspace").Game.Entities.JewelSafe
        local foundModel = false
        for _, model in pairs(JewelSafes:GetChildren()) do
            if model.ClassName == 'Model' then
                foundModel = true
                local epoh1 = model.WorldPivot
                epoh3.CFrame = epoh1
                wait(1)
                model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.HoldDuration = 0
                model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.MaxActivationDistance = 16
                if model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.Enabled == true then
                    model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldBegin()
                    model.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt:InputHoldEnd()
                    wait(5)
                    model:Destroy()
                end
            end
        end
        if not foundModel then
-- = 通知显示 =            
                WindUI:Notify({
                Title = '提示：',
                Content = '黑保险未刷新！',
                Image = 'rbxassetid://4483345998',
                Time = 5
            })
            wait(30)
        end
    end
end

B:Toggle({
    Title = '自动开小宝箱',
    Default = false,
    Callback = function(Value)
    SmallChest1 = Value
        if SmallChest1 then
            SmallChest2()
        end
    end    
})
SmallChest2 = function()
    while SmallChest1 do
    wait()
    local SmallChes = game:GetService('Workspace').Game.Entities.SmallChest
        local foundModel = false
        for _, model in pairs(SmallChes:GetChildren()) do
            if model.ClassName == 'Model' then
                foundModel = true
                local epoh1 = model.WorldPivot
                local epoh2 = game:GetService('Players')
                local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
                epoh3.CFrame = epoh1
                wait(0.3)
                model.Lock["Meshes/untitled_chest.002_Material.009 (4)"].Attachment.ProximityPrompt:InputHoldBegin()
                model.Lock["Meshes/untitled_chest.002_Material.009 (4)"].Attachment.ProximityPrompt:InputHoldEnd()
                wait(0.3)
                local epoh1 = CFrame.new(240.52850341796875, -120, -620)
                epoh3.CFrame = epoh1
                break
            end
        end
        if not foundModel then
-- = 通知显示 =            
                WindUI:Notify({
                Name = '提示：',
                Content = '小宝箱未刷新！',
                Image = 'rbxassetid://4483345998',
                Time = 5
            })
            wait(30)
        end
    end
end


B:Toggle({
    Title = '自动开小保险+秒开',
    Default = false,
    Callback = function(Value)
    SmallSafe1 = Value
        if SmallSafe1 then
            SmallSafe2()
        end
    end    
})
SmallSafe2 = function()
    while SmallSafe1 do
    wait(0.1)
    local SmallSaf = game:GetService('Workspace').Game.Entities.SmallSafe
        local foundModel = false
        for _, model in pairs(SmallSaf:GetChildren()) do
            if model.ClassName == 'Model' then
                foundModel = true 
                local epoh1 = model.WorldPivot
                local epoh2 = game:GetService('Players')
                local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
                SmallSaf.SmallSafe.Door['Meshes/Safe1_Cube.002_Cube.003_None (1)'].Attachment.ProximityPrompt.HoldDuration = 0
                epoh3.CFrame = epoh1
                break
            end
        end
        if not foundModel then
-- = 通知显示 =            
                WindUI:Notify({
                Name = '提示：',
                Content = '小保险未刷新！',
                Image = 'rbxassetid://4483345998',
                Time = 5
            })
            wait(30)
        end
    end
end

B:Toggle({
    Title = '瞬移印钞机',
    Default = false,
    Callback = function(Value)
    MoneyPrint1 = Value
        if MoneyPrint1 then
            MoneyPrint2()
        end
    end    
})
MoneyPrint2 = function()
    while MoneyPrint1 do
    wait(0.1)
    while true do
            for i,l in pairs(game:GetService('Workspace').Game.Entities.ItemPickup:GetChildren()) do
                for i,v in pairs(l:GetChildren()) do
                    if v.ClassName == 'MeshPart' or 'Part' then
                        for i,e in pairs(v:GetChildren()) do
                            if e.ClassName == 'ProximityPrompt' then
                                if e.ObjectText == 'Money Printer' then
                                    local epoh1 = v.CFrame
                                    local epoh2 = game:GetService('Players')
                                    local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
                                    epoh3.CFrame = epoh1
                                else

                                end
                            end
        
                        end
        
                    end
        
        
                end
            end
        
            wait (0.1)
            for i,v in pairs (game:GetService('Workspace').Game.Entities.ItemPickup:GetChildren()) do
                for i,k in pairs(v:GetChildren()) do
                    for i,l in pairs(k:GetChildren()) do
                        if l.ClassName == 'BillboardGui' then
                            l:Remove()
                        end
                    end
                end
            end
        
        end
end
end

B:Button({
    Title = '残血自动逃逸',
    Value = false,
    Callback = function(Value)
    paolu1 = Value
        if paolu1 then
            paolu2()
        end
    end    
})
paolu2 = function()
    while paolu1 do
    wait(0.1)
    if game:GetService('Players').LocalPlayer.Character.Humanoid.Health <= 35 then
        local og1 = CFrame.new(175.191, 13.937, -132.69)
        local og3 = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
        og3.CFrame = og1
        wait(20)
    end
    end
end

C:Toggle({
    Title = '范围',
    Default = '',
    TextDisappear = true,
    Callback = function(Value)
        _G.HeadSize = Value
        _G.Disabled = true
        game:GetService('RunService').RenderStepped:connect(function()
        if _G.Disabled then
            for i,v in next, game:GetService('Players'):GetPlayers() do
                if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                pcall(function()
                    v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    v.Character.HumanoidRootPart.Transparency = 0.7
                    v.Character.HumanoidRootPart.CanCollide = false
                    end)
                    end
                end
            end
        end)
    end   
})


C:Toggle({
    Title = '最大视野',
    Callback = function(Value)
    Cam1 = Value
        if Cam1 then
            Cam2()
        end
    end    
})
Cam2 = function()
    while Cam1 do
    wait(0.1)
    game:GetService('Players').LocalPlayer.CameraMaxZoomDistance = 1000
    end
    while not Cam1 do
    wait(0.1)
    game:GetService('Players').LocalPlayer.CameraMaxZoomDistance = 32
    end
end

