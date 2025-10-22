-- ================  ================
function Antihook()
    return "Hook"
end

hookfunction(Antihook, function()
    return "No Hook"
end)

hookfunction(game.HttpGet, print)

if not isfunctionhooked(Antihook) or not isfunctionhooked(game.HttpGet) then
    game:shutdown("别搞我")
    while true do end
end

restorefunction(game.HttpGet)

if isfunctionhooked(game.HttpGet) or isfunctionhooked(request) or isfunctionhooked(tostring) then
    game:shutdown("666")
    while true do end
end
-- ================  ================
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- ================ 1.5.弹窗窗口显示 ================
        WindUI:Popup({
            Title = "👑尊贵的"..game.Players.LocalPlayer.DisplayName.."用户",
            Icon = "info",
            Content = "欢迎使用HB FXM脚本",
            Buttons = {
                {
                    Title = "取消",
                    Callback = function() end,
                    Variant = "Tertiary",
                },
                {
                    Title = "执行",
                    Icon = "arrow-right",
                    Callback = function() 
                        DDZX = true 
                    end,
                    Variant = "Primary",
                }   
            }
        })

        repeat
            wait()
        until DDZX       

-- ================ 2.Ul背景…… ================
local Window = WindUI:CreateWindow({
        Title = "越 HB<font color='#00FF00'>1.5</font>",
        Icon = "rbxassetid://4483362748",-- =  =背景右上角的图片
        IconTransparency = 0.5,
        IconThemed = true,
        Author = "作者:HB",-- = 名字 =
        Folder = "CloudHub",
        Size = UDim2.fromOffset(400, 300),-- = 背景大小 =
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
            Title = " HB FXM脚本",
            Icon = "sword",
            CornerRadius = UDim.new(0, 16),
            StrokeThickness = 2,
            Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
            Draggable = true
        })

Window:Tag({
    Title = "v2.0越 HB",
    Color = Color3.fromHex("#30ff6a")
})

Window:Tag({
        Title = "越 HB版", -- 标签汉化
        Color = Color3.fromHex("#315dff")
    })
    local TimeTag = Window:Tag({
        Title = "正在更新",
        Color = Color3.fromHex("#000000")
    })

WindUI:Notify({
    Title = "HB FXM ",
    Content = "防抓包也开启",
    Duration = 3, -- 3 seconds
    Icon = "bird",
})

local Tabs = {
    Main = Window:Section({ Title = "自动", Opened = true }),
    gn = Window:Section({ Title = "功能", Opened = true }),    
}

local TabHandles = {    
    Q = Tabs.Main:Tab({ Title = "自动功能", Icon = "layout-grid" }),
    W = Tabs.Main:Tab({ Title = "传送功能", Icon = "layout-grid" }),
    E = Tabs.Main:Tab({ Title = "自动锻炼", Icon = "layout-grid" }),
    R = Tabs.Main:Tab({ Title = "自动跑步", Icon = "layout-grid" }),
    T = Tabs.Main:Tab({ Title = "自动蹲起", Icon = "layout-grid" }),
    Y = Tabs.Main:Tab({ Title = "引体向上", Icon = "layout-grid" }),
    U = Tabs.Main:Tab({ Title = "自动举重", Icon = "layout-grid" }),
    I = Tabs.Main:Tab({ Title = "自动投石", Icon = "layout-grid" }),
    SAN = Tabs.Main:Tab({ Title = "UI自定义", Icon = "layout-grid" }),    
}

TabHandles.Q:Input({
    Title = "修改力量",
    Value = configName,
    Callback = function(FXM)
      game:GetService("Players").LocalPlayer.leaderstats.Strength.Value = FXM  
    end
})

TabHandles.Q:Input({
    Title = "修改重生",
    Value = configName,
    Callback = function(FXM)
        game:GetService("Players").LocalPlayer.leaderstats.Rebirths.Value = FXM
    end
})

TabHandles.Q:Input({
    Title = "修改击杀",
    Value = configName,
    Callback = function(FXM)
        game:GetService("Players").LocalPlayer.leaderstats.Kills.Value = FXM
    end
})

TabHandles.Q:Input({
    Title = "修改获胜",
    Value = configName,
    Callback = function(FXM)
        game:GetService("Players").LocalPlayer.leaderstats.Brawls.Value = FXM
    end
})
TabHandles.Q:Divider()

Toggle = TabHandles.Q:Toggle({
    Title = "自动重生",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    if Value then
        while Value do
            game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            wait()
            end
        end        
    end
})

Toggle = TabHandles.Q:Toggle({
    Title = "自动修改体积为2",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    if Value then
        while Value do
        game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize",2)
        wait()
    end
end
end
})

Toggle = TabHandles.Q:Toggle({
    Title = "自动传送肌肉之王",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    if Value then
        while Value do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8625.9296875, 13.566278457641602, -5730.4736328125)
        wait()
    end
end
end
})
TabHandles.Q:Divider()

Toggle = TabHandles.Q:Toggle({
    Title = "0石头",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    -- 将开关值同步到全局RK0变量，统一控制逻辑
    getgenv().RK0 = Value
    Jump = Value

    -- 开启开关：启动循环传送+装备Punch工具
    if Value then
        spawn(function()
            while Jump do
                local plr = game.Players.LocalPlayer
                -- 空值判断，确保角色、人形和根部件加载完成
                if plr and plr.Character then
                    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                    local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")

                    -- 1. 循环传送逻辑
                    if rootPart then
                        rootPart.CFrame = CFrame.new(15.53,0.76,2117.85)
                    end

                    -- 2. 装备背包中的Punch工具
                    local punch = plr.Backpack:FindFirstChild("Punch")
                    if punch and punch:IsA("Tool") and humanoid then
                        humanoid:EquipTool(punch)
                    end
                end
                wait(0.1)
            end
        end)
    else
        -- 关闭开关：自动卸下所有工具
        local plr = game.Players.LocalPlayer
        if plr and plr.Character then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end
end
})

Toggle = TabHandles.Q:Toggle({
    Title = "10石头",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    -- 将开关值同步到全局RK0变量，统一控制逻辑
    getgenv().RK0 = Value
    Jump = Value

    -- 开启开关：启动循环传送+装备Punch工具
    if Value then
        spawn(function()
            while Jump do
                local plr = game.Players.LocalPlayer
                -- 空值判断，确保角色、人形和根部件加载完成
                if plr and plr.Character then
                    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                    local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")

                    -- 1. 循环传送逻辑
                    if rootPart then
                        rootPart.CFrame = CFrame.new(-151.39,2.10,437.53)
                    end

                    -- 2. 装备背包中的Punch工具
                    local punch = plr.Backpack:FindFirstChild("Punch")
                    if punch and punch:IsA("Tool") and humanoid then
                        humanoid:EquipTool(punch)
                    end
                end
                wait(0.1)
            end
        end)
    else
        -- 关闭开关：自动卸下所有工具
        local plr = game.Players.LocalPlayer
        if plr and plr.Character then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end
end
})

Toggle = TabHandles.Q:Toggle({
    Title = "100石头",
    Desc = "",
    Locked = false,
    Callback = function()
    -- 将开关值同步到全局RK0变量，统一控制逻辑
    getgenv().RK0 = Value
    Jump = Value

    -- 开启开关：启动循环传送+装备Punch工具
    if Value then
        spawn(function()
            while Jump do
                local plr = game.Players.LocalPlayer
                -- 空值判断，确保角色、人形和根部件加载完成
                if plr and plr.Character then
                    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                    local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")

                    -- 1. 循环传送逻辑
                    if rootPart then
                        rootPart.CFrame = CFrame.new(164.47,1.24,-137.76)
                    end

                    -- 2. 装备背包中的Punch工具
                    local punch = plr.Backpack:FindFirstChild("Punch")
                    if punch and punch:IsA("Tool") and humanoid then
                        humanoid:EquipTool(punch)
                    end
                end
                wait(0.1)
            end
        end)
    else
        -- 关闭开关：自动卸下所有工具
        local plr = game.Players.LocalPlayer
        if plr and plr.Character then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end
end
})

Toggle = TabHandles.Q:Toggle({
    Title = "5000石头",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    -- 将开关值同步到全局RK0变量，统一控制逻辑
    getgenv().RK0 = Value
    Jump = Value

    -- 开启开关：启动循环传送+装备Punch工具
    if Value then
        spawn(function()
            while Jump do
                local plr = game.Players.LocalPlayer
                -- 空值判断，确保角色、人形和根部件加载完成
                if plr and plr.Character then
                    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                    local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")

                    -- 1. 循环传送逻辑
                    if rootPart then
                        rootPart.CFrame = CFrame.new(313.02,2.06,-559.59)
                    end

                    -- 2. 装备背包中的Punch工具
                    local punch = plr.Backpack:FindFirstChild("Punch")
                    if punch and punch:IsA("Tool") and humanoid then
                        humanoid:EquipTool(punch)
                    end
                end
                wait(0.1)
            end
        end)
    else
        -- 关闭开关：自动卸下所有工具
        local plr = game.Players.LocalPlayer
        if plr and plr.Character then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end
end
})

Toggle = TabHandles.Q:Toggle({
    Title = "150000石头",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    -- 将开关值同步到全局RK0变量，统一控制逻辑
    getgenv().RK0 = Value
    Jump = Value

    -- 开启开关：启动循环传送+装备Punch工具
    if Value then
        spawn(function()
            while Jump do
                local plr = game.Players.LocalPlayer
                -- 空值判断，确保角色、人形和根部件加载完成
                if plr and plr.Character then
                    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                    local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")

                    -- 1. 循环传送逻辑
                    if rootPart then
                        rootPart.CFrame = CFrame.new(-2514.23,1.07,-256.83)
                    end

                    -- 2. 装备背包中的Punch工具
                    local punch = plr.Backpack:FindFirstChild("Punch")
                    if punch and punch:IsA("Tool") and humanoid then
                        humanoid:EquipTool(punch)
                    end
                end
                wait(0.1)
            end
        end)
    else
        -- 关闭开关：自动卸下所有工具
        local plr = game.Players.LocalPlayer
        if plr and plr.Character then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end
end
})

Toggle = TabHandles.Q:Toggle({
    Title = "400000石头",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    -- 将开关值同步到全局RK0变量，统一控制逻辑
    getgenv().RK0 = Value
    Jump = Value

    -- 开启开关：启动循环传送+装备Punch工具
    if Value then
        spawn(function()
            while Jump do
                local plr = game.Players.LocalPlayer
                -- 空值判断，确保角色、人形和根部件加载完成
                if plr and plr.Character then
                    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                    local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")

                    -- 1. 循环传送逻辑
                    if rootPart then
                        rootPart.CFrame = CFrame.new(2186.48,8.09,1290.90)
                    end

                    -- 2. 装备背包中的Punch工具
                    local punch = plr.Backpack:FindFirstChild("Punch")
                    if punch and punch:IsA("Tool") and humanoid then
                        humanoid:EquipTool(punch)
                    end
                end
                wait(0.1)
            end
        end)
    else
        -- 关闭开关：自动卸下所有工具
        local plr = game.Players.LocalPlayer
        if plr and plr.Character then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end
end
})

Toggle = TabHandles.Q:Toggle({
    Title = "750000石头",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    -- 将开关值同步到全局RK0变量，统一控制逻辑
    getgenv().RK0 = Value
    Jump = Value

    -- 开启开关：启动循环传送+装备Punch工具
    if Value then
        spawn(function()
            while Jump do
                local plr = game.Players.LocalPlayer
                -- 空值判断，确保角色、人形和根部件加载完成
                if plr and plr.Character then
                    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                    local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")

                    -- 1. 循环传送逻辑
                    if rootPart then
                        rootPart.CFrame = CFrame.new(-7262.31,9.66,-1218.25)
                    end

                    -- 2. 装备背包中的Punch工具
                    local punch = plr.Backpack:FindFirstChild("Punch")
                    if punch and punch:IsA("Tool") and humanoid then
                        humanoid:EquipTool(punch)
                    end
                end
                wait(0.1)
            end
        end)
    else
        -- 关闭开关：自动卸下所有工具
        local plr = game.Players.LocalPlayer
        if plr and plr.Character then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end
end
})

Toggle = TabHandles.Q:Toggle({
    Title = "100万石头",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    -- 将开关值同步到全局RK0变量，统一控制逻辑
    getgenv().RK0 = Value
    Jump = Value

    -- 开启开关：启动循环传送+装备Punch工具
    if Value then
        spawn(function()
            while Jump do
                local plr = game.Players.LocalPlayer
                -- 空值判断，确保角色、人形和根部件加载完成
                if plr and plr.Character then
                    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                    local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")

                    -- 1. 循环传送逻辑
                    if rootPart then
                        rootPart.CFrame = CFrame.new(4132.50,991.64,-4035.54)
                    end

                    -- 2. 装备背包中的Punch工具
                    local punch = plr.Backpack:FindFirstChild("Punch")
                    if punch and punch:IsA("Tool") and humanoid then
                        humanoid:EquipTool(punch)
                    end
                end
                wait(0.1)
            end
        end)
    else
        -- 关闭开关：自动卸下所有工具
        local plr = game.Players.LocalPlayer
        if plr and plr.Character then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end
end
})

Toggle = TabHandles.Q:Toggle({
    Title = "500万石头",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    -- 将开关值同步到全局RK0变量，统一控制逻辑
    getgenv().RK0 = Value
    Jump = Value

    -- 开启开关：启动循环传送+装备Punch工具
    if Value then
        spawn(function()
            while Jump do
                local plr = game.Players.LocalPlayer
                -- 空值判断，确保角色、人形和根部件加载完成
                if plr and plr.Character then
                    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                    local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")

                    -- 1. 循环传送逻辑
                    if rootPart then
                        rootPart.CFrame = CFrame.new(-8985.91,17.23,-5989.86)
                    end

                    -- 2. 装备背包中的Punch工具
                    local punch = plr.Backpack:FindFirstChild("Punch")
                    if punch and punch:IsA("Tool") and humanoid then
                        humanoid:EquipTool(punch)
                    end
                end
                wait(0.1)
            end
        end)
    else
        -- 关闭开关：自动卸下所有工具
        local plr = game.Players.LocalPlayer
        if plr and plr.Character then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end
end
})

Toggle = TabHandles.Q:Toggle({
    Title = "1000万石头",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    -- 将开关值同步到全局RK0变量，统一控制逻辑
    getgenv().RK0 = Value
    Jump = Value

    -- 开启开关：启动循环传送+装备Punch工具
    if Value then
        spawn(function()
            while Jump do
                local plr = game.Players.LocalPlayer
                -- 空值判断，确保角色、人形和根部件加载完成
                if plr and plr.Character then
                    local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
                    local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")

                    -- 1. 循环传送逻辑
                    if rootPart then
                        rootPart.CFrame = CFrame.new(-7639.93,4.30,3007.76)
                    end

                    -- 2. 装备背包中的Punch工具
                    local punch = plr.Backpack:FindFirstChild("Punch")
                    if punch and punch:IsA("Tool") and humanoid then
                        humanoid:EquipTool(punch)
                    end
                end
                wait(0.1)
            end
        end)
    else
        -- 关闭开关：自动卸下所有工具
        local plr = game.Players.LocalPlayer
        if plr and plr.Character then
            local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end
end
})

Button = TabHandles.W:Button({
    Title = "自动宝箱（传送+检测）[重复2次]",
    Desc = "",
    Locked = false,
    Callback = function()
    spawn(function()
        local repeatTimes = 2
        for cycle = 1, repeatTimes do
            -- 替换“开始轮次”提示
            showNotice(string.format("开始第 %d/%d 轮宝箱流程", cycle, repeatTimes))
            
            -- 1. 传送逻辑
            local teleportPoints = {
                CFrame.new(-138.17,7.33,-276.85),        
                CFrame.new(4680.29,1001.05,-3689.63),    
                CFrame.new(2213.03,7.33,918.64),    
                CFrame.new(-6713.86,7.33,-1454.19),  
                CFrame.new(-2572.08,7.33,-556.94),        
                CFrame.new(40.71,7.33,410.27),    
                CFrame.new(-7914.54,4.30,3028.47)
            }
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local rootPart = character:WaitForChild("HumanoidRootPart")
            
            for _, targetCFrame in ipairs(teleportPoints) do
                rootPart.CFrame = targetCFrame
                task.wait(5)
            end
            task.wait(1)
            -- 新增“传送完成”提示
            showNotice("本轮传送已完成，准备检测宝箱")
            
            -- 2. 宝箱检测逻辑
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local chestRewards = ReplicatedStorage:FindFirstChild("chestRewards")
            local checkRemote = ReplicatedStorage:FindFirstChild("rEvents"):FindFirstChild("checkChestRemote")
            
            if not chestRewards or not checkRemote then
                -- 替换“对象缺失”提示
                showNotice("宝箱目录或检测事件不存在，跳过本轮")
                task.wait(2)
                continue
            end
            
            local jk = {}
            for _, v in pairs(chestRewards:GetDescendants()) do
                if v.Name ~= "Light Karma Chest" and v.Name ~= "Evil Karma Chest" then
                    table.insert(jk, v.Name)
                end
            end
            
            for _, chestName in ipairs(jk) do
                checkRemote:InvokeServer(chestName)
                task.wait(2)
            end
            -- 新增“检测完成”提示
            showNotice(string.format("第 %d/%d 轮宝箱检测完成", cycle, repeatTimes))
            
            -- 替换“轮间等待”提示
            showNotice("等待3秒后进入下一轮")
            task.wait(3)
        end
        
        -- 替换“全部完成”提示
        showNotice("所有2轮宝箱流程已执行完毕！")
    end)
end
})
TabHandles.W:Divider()

Button = TabHandles.W:Button({
    Title = "沙滩",
    Desc = "",
    Locked = false,
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-42.7, 3.7, 404.2)
end
})

Button = TabHandles.W:Button({
    Title = "小岛（0-1000力量）",
    Desc = "",
    Locked = false,
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-37.636775970458984, 3.86960768699646, 1879.180908203125)
end
})

Button = TabHandles.W:Button({
    Title = "冰霜健身房（1重生）",
    Desc = "",
    Locked = false,
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2623.022216796875, 3.716249465942383, -409.0733337402344)
end
})

Button = TabHandles.W:Button({
    Title = "神话健身房（5重生）",
    Desc = "",
    Locked = false,
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2250.778076171875, 3.716248035430908, 1073.2266845703125)
end
})

Button = TabHandles.W:Button({
    Title = "永恒健身房（15重生）",
    Desc = "",
    Locked = false,
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6758.9638671875, 3.71626353263855, -1284.918701171875)
end
})

Button = TabHandles.W:Button({
    Title = "传奇健身房（30重生）",
    Desc = "",
    Locked = false,
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4603.28173828125, 987.869140625, -3897.86572265625)
end
})

Button = TabHandles.W:Button({
    Title = "力量之王”健身房（5重生）",
    Desc = "",
    Locked = false,
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8625.9296875, 13.566278457641602, -5730.4736328125)
end
})

Button = TabHandles.W:Button({
    Title = "狂野健身房（60重生）",
    Desc = "",
    Locked = false,
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8693.0927734375, 8.93972396850586, 2400.66259765625)
end
})


local AutoTrainEnabled = false  -- 自动锻炼状态
local TrainThread = nil         -- 自动锻炼线程
-- 自动锻炼（修复线程管理）
Toggle = TabHandles.E:Toggle({
    Title = "自动锻炼",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    AutoTrainEnabled = Value
    -- 终止旧线程
    if TrainThread then
        task.cancel(TrainThread)
        TrainThread = nil
    end
    -- 启动新线程
    if AutoTrainEnabled then
        TrainThread = task.spawn(function()
            while AutoTrainEnabled do
                local args = {[1] = "rep"}
                local muscleEvent = game.Players.LocalPlayer:FindFirstChild("muscleEvent")
                if muscleEvent then
                    muscleEvent:FireServer(unpack(args))
                end
                task.wait(0.1)
            end
        end)
    end
end
})

local AutoPunchEnabled = false  -- 自动挥拳状态
local PunchThread = nil         -- 自动挥拳线程

-- 自动挥拳（保留优化后的代码）
Toggle = TabHandles.E:Toggle({
    Title = "自动挥拳",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    AutoPunchEnabled = Value
    -- 终止旧线程
    if PunchThread then
        task.cancel(PunchThread)
        PunchThread = nil
    end
    -- 启动新线程
    if AutoPunchEnabled then
        PunchThread = task.spawn(function()
            while AutoPunchEnabled do
                local args = {[1] = "punch", [2] = "rightHand"}
                local muscleEvent = game.Players.LocalPlayer:FindFirstChild("muscleEvent")
                if muscleEvent then
                    muscleEvent:FireServer(unpack(args))
                end
                task.wait(0.1)
            end
        end)
    end
 end
})
TabHandles.E:Divider()

Toggle = TabHandles.E:Toggle({
    Title = "自动哑铃",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.ClassName == "Tool" and v.Name == "Weight" then
            v.Parent = game.Players.LocalPlayer.Character
            wait()
        end
    end
    if Value then
    local AutoRep = Value
        while AutoRep do
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            wait()
        end
    end
end
})

Toggle = TabHandles.E:Toggle({
    Title = "自动俯卧撑",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.ClassName == "Tool" and v.Name == "Pushups" then
            v.Parent = game.Players.LocalPlayer.Character
            wait()
        end
    end
    if Value then
    local AutoRep = Value
        while AutoRep do
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            wait()
        end
    end
end
})

Toggle = TabHandles.E:Toggle({
    Title = "自动仰卧起坐",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.ClassName == "Tool" and v.Name == "Situps" then
            v.Parent = game.Players.LocalPlayer.Character
            wait()
        end
    end
    if Value then
    local AutoRep = Value
        while AutoRep do
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            wait()
        end
    end
end
})

Toggle = TabHandles.E:Toggle({
    Title = "自动倒立",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.ClassName == "Tool" and v.Name == "Handstands" then
            v.Parent = game.Players.LocalPlayer.Character
            wait()
        end
    end
    if Value then
    local AutoRep = Value
        while AutoRep do
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            wait()
        end
    end
end
})

Toggle = TabHandles.E:Toggle({
    Title = "自动练全部",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.ClassName == "Tool" and v.Name == "Weight" or v.Name == "Handstands" or v.Name == "Pushups" or v.Name == "Situps" then
            v.Parent = game.Players.LocalPlayer.Character
            wait()
        end
    end
    if Value then
    local AutoRep = Value
        while AutoRep do
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            wait()
        end
    end
end
})

Toggle = TabHandles.R:Toggle({
    Title = "跑步机海滩10",
    Desc = "",
    Locked = false,
    Callback = function(treadmill)
    getgenv().spam = treadmill
while getgenv().spam do
wait()
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(238.671112, 5.40315914, 387.713165, -0.0160072874, -2.90710176e-08, -0.99987185, -3.3434191e-09, 1, -2.90212157e-08, 0.99987185, 2.87843993e-09, -0.0160072874)
local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
 
local localPlayer = Players.LocalPlayer
 
RunService:BindToRenderStep("move",
    -- run after the character
    Enum.RenderPriority.Character.Value + 1,
    function()
   	 if localPlayer.Character then
   		 local humanoid = localPlayer.Character:WaitForChild("Humanoid")
   		 if humanoid then
   			 humanoid:Move(Vector3.new(10000, 0, -1), true)
   		 end
   	 end
    end
)
end

if not getgenv().spam then
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
 
local localPlayer = Players.LocalPlayer
 
RunService:UnbindFromRenderStep("move",
    -- run after the character
    Enum.RenderPriority.Character.Value + 1,
    function()
   	 if localPlayer.Character then
   		 local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
   		 if humanoid then
   			 humanoid:Move(Vector3.new(10000, 0, -1), true)
   		 end
   	 end
    end
)
end
end
})

Toggle = TabHandles.R:Toggle({
    Title = "跑步机Frost-健身房-2000",
    Desc = "",
    Locked = false,
    Callback = function(treadmill)
    if game.Players.LocalPlayer.Agility.Value >= 2000 then
getgenv().spam = treadmill
while getgenv().spam do
wait()
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-3005.37866, 14.3221855, -464.697876, -0.015773816, -1.38508964e-08, 0.999875605, -5.13225586e-08, 1, 1.30429667e-08, -0.999875605, -5.11104332e-08, -0.015773816)
local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
 
local localPlayer = Players.LocalPlayer
 
RunService:BindToRenderStep("move",
    -- run after the character
    Enum.RenderPriority.Character.Value + 1,
    function()
   	 if localPlayer.Character then
   		 local humanoid = localPlayer.Character:WaitForChild("Humanoid")
   		 if humanoid then
   			 humanoid:Move(Vector3.new(10000, 0, -1), true)
   		 end
   	 end
    end
)
end
end

if not getgenv().spam then
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
 
local localPlayer = Players.LocalPlayer
 
RunService:UnbindFromRenderStep("move",
    -- run after the character
    Enum.RenderPriority.Character.Value + 1,
    function()
   	 if localPlayer.Character then
   		 local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
   		 if humanoid then
   			 humanoid:Move(Vector3.new(10000, 0, -1), true)
   		 end
   	 end
    end
)
end
end
})

Toggle = TabHandles.R:Toggle({
    Title = "跑步机神话-健身房2000",
    Desc = "",
    Locked = false,
    Callback = function(treadmill)
    if game.Players.LocalPlayer.Agility.Value >= 2000 then
getgenv().spam = treadmill
while getgenv().spam do
wait()
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2571.23706, 15.6896839, 898.650391, 0.999968231, 2.23868635e-09, -0.00797206629, -1.73198844e-09, 1, 6.35660768e-08, 0.00797206629, -6.3550246e-08, 0.999968231)
local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
 
local localPlayer = Players.LocalPlayer
 
RunService:BindToRenderStep("move",
    -- run after the character
    Enum.RenderPriority.Character.Value + 1,
    function()
   	 if localPlayer.Character then
   		 local humanoid = localPlayer.Character:WaitForChild("Humanoid")
   		 if humanoid then
   			 humanoid:Move(Vector3.new(10000, 0, -1), true)
   		 end
   	 end
    end
)
end
end

if not getgenv().spam then
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
 
local localPlayer = Players.LocalPlayer
 
RunService:UnbindFromRenderStep("move",
    -- run after the character
    Enum.RenderPriority.Character.Value + 1,
    function()
   	 if localPlayer.Character then
   		 local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
   		 if humanoid then
   			 humanoid:Move(Vector3.new(10000, 0, -1), true)
   		 end
   	 end
    end
)
end
end
})

Toggle = TabHandles.R:Toggle({
    Title = "永恒跑步机-健身房",
    Desc = "",
    Locked = false,
    Callback = function(treadmill)
    if game.Players.LocalPlayer.Agility.Value >= 3500 then
getgenv().spam = treadmill
while getgenv().spam do
wait()
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-7077.79102, 29.6702118, -1457.59961, -0.0322036594, -3.31122768e-10, 0.99948132, -6.44344267e-09, 1, 1.23684493e-10, -0.99948132, -6.43611742e-09, -0.0322036594)
local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
 
local localPlayer = Players.LocalPlayer
 
RunService:BindToRenderStep("move",
    -- run after the character
    Enum.RenderPriority.Character.Value + 1,
    function()
   	 if localPlayer.Character then
   		 local humanoid = localPlayer.Character:WaitForChild("Humanoid")
   		 if humanoid then
   			 humanoid:Move(Vector3.new(10000, 0, -1), true)
   		 end
   	 end
    end
)
end
end

if not getgenv().spam then
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
 
local localPlayer = Players.LocalPlayer
 
RunService:UnbindFromRenderStep("move",
    -- run after the character
    Enum.RenderPriority.Character.Value + 1,
    function()
   	 if localPlayer.Character then
   		 local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
   		 if humanoid then
   			 humanoid:Move(Vector3.new(10000, 0, -1), true)
   		 end
   	 end
    end
)
end
end
})

Toggle = TabHandles.R:Toggle({
    Title = "跑步机传奇-健身房",
    Desc = "",
    Locked = false,
    Callback = function(treadmill)
    if game.Players.LocalPlayer.Agility.Value >= 3000 then
getgenv().spam = treadmill
while getgenv().spam do
wait()
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 10
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4370.82812, 999.358704, -3621.42773, -0.960604727, -8.41949266e-09, -0.27791819, -6.12478646e-09, 1, -9.12496567e-09, 0.27791819, -7.06329528e-09, -0.960604727)
local oldpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
 
local localPlayer = Players.LocalPlayer
 
RunService:BindToRenderStep("move",
    -- run after the character
    Enum.RenderPriority.Character.Value + 1,
    function()
   	 if localPlayer.Character then
   		 local humanoid = localPlayer.Character:WaitForChild("Humanoid")
   		 if humanoid then
   			 humanoid:Move(Vector3.new(10000, 0, -1), true)
   		 end
   	 end
    end
)
end
end

if not getgenv().spam then
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
 
local localPlayer = Players.LocalPlayer
 
RunService:UnbindFromRenderStep("move",
    -- run after the character
    Enum.RenderPriority.Character.Value + 1,
    function()
   	 if localPlayer.Character then
   		 local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
   		 if humanoid then
   			 humanoid:Move(Vector3.new(10000, 0, -1), true)
   		 end
   	 end
    end
)
end
end
})

Toggle = TabHandles.T:Toggle({
    Title = "沙滩",
    Desc = "",
    Locked = false,
    Callback = function(rack)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 1000 then
getgenv().spam = rack
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(232.627625, 3.67689133, 96.3039856, -0.963445187, -7.78685845e-08, -0.267905563, -7.92865222e-08, 1, -5.52570167e-09, 0.267905563, 1.5917589e-08, -0.963445187)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

Toggle = TabHandles.T:Toggle({
    Title = "冰冻健身房",
    Desc = "",
    Locked = false,
    Callback = function(rack)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 4000 then
getgenv().spam = rack
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2629.13818, 3.36860609, -609.827454, -0.995664716, -2.67296816e-08, -0.0930150598, -1.90042453e-08, 1, -8.39415222e-08, 0.0930150598, -8.18099295e-08, -0.995664716)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

Toggle = TabHandles.T:Toggle({
    Title = "传奇健身房",
    Desc = "",
    Locked = false,
    Callback = function(rack)
    getgenv().spam = rack
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4443.04443, 987.521484, -4061.12988, 0.83309716, 3.33018835e-09, 0.553126693, -2.87759438e-09, 1, -1.68654424e-09, -0.553126693, -1.86619012e-10, 0.83309716)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

Toggle = TabHandles.T:Toggle({
    Title = "肌肉健身房",
    Desc = "",
    Locked = false,
    Callback = function(rack)
    getgenv().spam = rack
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8757.37012, 13.2186356, -6051.24365, -0.902269304, 1.63610299e-08, -0.431172907, 1.71076486e-08, 1, 2.14606288e-09, 0.431172907, -5.44002754e-09, -0.902269304)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder["Squat Rack"].interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

Toggle = TabHandles.Y:Toggle({
    Title = "海滩",
    Desc = "",
    Locked = false,
    Callback = function(pull)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 1000 then
getgenv().spam = pull
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-185.157745, 5.81071186, 104.747154, 0.227061391, -8.2363325e-09, 0.97388047, 5.58502826e-08, 1, -4.56432803e-09, -0.97388047, 5.54278827e-08, 0.227061391)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder["Legends Pullup"].interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

Toggle = TabHandles.Y:Toggle({
    Title = "神话",
    Desc = "",
    Locked = false,
    Callback = function(pull)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 4000 then
getgenv().spam = pull
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2315.82104, 5.81071281, 847.153076, 0.993555248, 6.99809632e-08, 0.113349125, -7.05298859e-08, 1, 8.32554692e-10, -0.113349125, -8.82168916e-09, 0.993555248)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder["Legends Pullup"].interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

Toggle = TabHandles.Y:Toggle({
    Title = "传奇",
    Desc = "",
    Locked = false,
    Callback = function(pull)
    getgenv().spam = pull
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4305.08203, 989.963623, -4118.44873, -0.953815758, -7.58000382e-08, -0.30039227, -8.98859724e-08, 1, 3.30721512e-08, 0.30039227, 5.85457904e-08, -0.953815758)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder["Legends Pullup"].interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

Toggle = TabHandles.U:Toggle({
    Title = "海滩",
    Desc = "",
    Locked = false,
    Callback = function(lift)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 1500 then
getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(136.606216, 3.67689133, 97.661499, -0.974106729, -1.89495477e-08, 0.226088539, -1.78365624e-08, 1, 6.96555214e-09, -0.226088539, 2.75254886e-09, -0.974106729)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

Toggle = TabHandles.U:Toggle({
    Title = "传说健身房",
    Desc = "",
    Locked = false,
    Callback = function(lift)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 5000 then
getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-2916.11572, 3.67689204, -212.97438, -0.241641939, -6.10995343e-08, 0.970365465, 6.65890596e-08, 1, 7.9547597e-08, -0.970365465, 8.38377616e-08, -0.241641939)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

Toggle = TabHandles.U:Toggle({
    Title = "传奇健身房",
    Desc = "",
    Locked = false,
    Callback = function(lift)
    getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4538.42627, 987.829834, -4008.82007, -0.830109239, 2.21324914e-08, 0.557600796, 8.02302083e-08, 1, 7.97476361e-08, -0.557600796, 1.1093568e-07, -0.830109239)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

Toggle = TabHandles.U:Toggle({
    Title = "肌肉之王",
    Desc = "",
    Locked = false,
    Callback = function(lift)
    getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-8768.4375, 13.5269203, -5681.62256, -0.997508109, -5.4007393e-10, 0.0705519542, 1.52984292e-10, 1, 9.81797044e-09, -0.0705519542, 9.80429782e-09, -0.997508109)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

Toggle = TabHandles.I:Toggle({
    Title = "海滩",
    Desc = "",
    Locked = false,
    Callback = function(lift)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 3000 then
getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-91.6730804, 3.67689133, -292.42868, -0.221022144, -2.21041621e-08, -0.975268781, 1.21414407e-08, 1, -2.54162646e-08, 0.975268781, -1.7458726e-08, -0.221022144)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

Toggle = TabHandles.I:Toggle({
    Title = "神话",
    Desc = "",
    Locked = false,
    Callback = function(lift)
    if game.Players.LocalPlayer.leaderstats.Strength.Value >= 10000 then
getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2486.01733, 3.67689276, 1237.89331, 0.883595645, -2.06135038e-08, -0.468250751, -3.3286871e-09, 1, -5.03036404e-08, 0.468250751, 4.60067362e-08, 0.883595645)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

Toggle = TabHandles.I:Toggle({
    Title = "传奇",
    Desc = "",
    Locked = false,
    Callback = function(lift)
    getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4189.96143, 987.829773, -3903.0166, 0.422592968, 0, 0.906319559, 0, 1, 0, -0.906319559, 0, 0.422592968)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

Toggle = TabHandles.I:Toggle({
    Title = "肌肉之王",
    Desc = "",
    Locked = false,
    Callback = function(lift)
    getgenv().spam = lift
while getgenv().spam do
wait()
if game.Players.LocalPlayer.machineInUse.Value == nil then
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(8933.69434, 13.5269222, -5700.12598, -0.823058188, 6.96304259e-09, 0.567957044, -1.19721832e-08, 1, -2.96093621e-08, -0.567957044, -3.11699146e-08, -0.823058188)
local vim = game:service("VirtualInputManager")
           vim:SendKeyEvent(true, "E", false, game)
else
local A_1 = "rep"
local A_2 = game:GetService("Workspace").machinesFolder.Deadlift.interactSeat
local Event = game:GetService("Players").LocalPlayer.muscleEvent
Event:FireServer(A_1, A_2)
end
end
if not getgenv().spam then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end
})

local Button = TabHandles.SAN:Button({
    Title = "自定义界面",
    Desc = "个性化您的体验",
    Image = "palette",
    ImageSize = 20,
    Color = "White"
})

local themes = {}
for themeName, _ in pairs(WindUI:GetThemes()) do
    table.insert(themes, themeName)
end
table.sort(themes)

local themeDropdown = TabHandles.SAN:Dropdown({
    Title = "主题选择",
    Values = themes,
    Value = "Dark",
    Callback = function(theme)
        WindUI:SetTheme(theme)
        WindUI:Notify({
            Title = "主题应用",
            Content = theme,
            Icon = "palette",
            Duration = 2
        })
    end
})

local transparencySlider = TabHandles.SAN:Slider({
    Title = "透明度",
    Value = { 
        Min = 0,
        Max = 1,
        Default = 0.2,
    },
    Step = 0.1,
    Callback = function(value)
        Window:ToggleTransparency(tonumber(value) > 0)
        WindUI.TransparencyValue = tonumber(value)
    end
})

TabHandles.SAN:Toggle({
    Title = "启用黑色主题",
    Desc = "使用黑色调主题方案",
    Value = true,
    Callback = function(state)
        WindUI:SetTheme(state and "Dark" or "Light")
        themeDropdown:Select(state and "Dark" or "Light")
    end
})


TabHandles.SAN:Button({
    Title = "创建新主题",
    Icon = "plus",
    Callback = function()
        Window:Dialog({
            Title = "创建主题",
            Content = "此功能很快就会推出",
            Buttons = {
                {
                    Title = "确认",
                    Variant = "Primary"
                }
            }
        })
    end
})

TabHandles.SAN:Paragraph({
    Title = "配置管理",
    Desc = "保存你的设置",
    Image = "save",
    ImageSize = 20,
    Color = "White"
})

local configName = "default"
local configFile = nil
local MyPlayerData = {
    name = "Player1",
    level = 1,
    inventory = { "sword", "shield", "potion" }
}

TabHandles.SAN:Input({
    Title = "配置名称",
    Value = configName,
    Callback = function(value)
        configName = value
    end
})

local ConfigManager = Window.ConfigManager
if ConfigManager then
    ConfigManager:Init(Window)
    
TabHandles.SAN:Button({
        Title = "保存配置",
        Icon = "save",
        Variant = "Primary",
        Callback = function()
            configFile = ConfigManager:CreateConfig(configName)
            
            configFile:Register("featureToggle", featureToggle)
            configFile:Register("intensitySlider", intensitySlider)
            configFile:Register("modeDropdown", modeDropdown)
            configFile:Register("themeDropdown", themeDropdown)
            configFile:Register("transparencySlider", transparencySlider)
            
            configFile:Set("playerData", MyPlayerData)
            configFile:Set("lastSave", os.date("%Y-%m-%d %H:%M:%S"))
            
            if configFile:Save() then
                WindUI:Notify({ 
                    Title = "保存配置", 
                    Content = "保存为："..configName,
                    Icon = "check",
                    Duration = 3
                })
            else
                WindUI:Notify({ 
                    Title = "错误", 
                    Content = "保存失败",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    TabHandles.SAN:Button({
        Title = "加载配置",
        Icon = "folder",
        Callback = function()
            configFile = ConfigManager:CreateConfig(configName)
            local loadedData = configFile:Load()
            
            if loadedData then
                if loadedData.playerData then
                    MyPlayerData = loadedData.playerData
                end
                
                local lastSave = loadedData.lastSave or "Unknown"
                WindUI:Notify({ 
                    Title = "加载配置", 
                    Content = "正在加载："..configName.."\n上次保存："..lastSave,
                    Icon = "refresh-cw",
                    Duration = 5
                })
                
                Button = TabHandles.Elements:Button({
                    Title = "玩家数据",
                    Desc = string.format("名字: %s\n等级: %d\n库存: %s", 
                        MyPlayerData.name, 
                        MyPlayerData.level, 
                        table.concat(MyPlayerData.inventory, ", "))
                })
            else
                WindUI:Notify({ 
                    Title = "错误", 
                    Content = "加载失败",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })
else
    TabHandles.SAN:Paragraph({
        Title = "配置管理不可用",
        Desc = "此功能需要配置管理",
        Image = "alert-triangle",
        ImageSize = 20,
        Color = "White"
    })
end
