-- ================ 全屏弹窗公告 - 独立版本（带自动加载功能） ================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- ================ 等待玩家加载 ================
local player = Players.LocalPlayer
while not player do
    wait(1)
    player = Players.LocalPlayer
end

-- ================  创建GUI ================



local gui = Instance.new("ScreenGui")
gui.Name = "HBFXMFullscreenAnnouncement"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true  -- 确保全屏覆盖
gui.Parent = player:WaitForChild("PlayerGui")

-- ================ 要加载的脚本URL（在这里修改你的脚本地址） ================
local SCRIPT_URL = "https://raw.githubusercontent.com/HB-ksdb/-HB-FXM/main/%E4%B8%BBHB%20FXM%20.txt"

-- 创建全屏弹窗函数
local function createFullscreenAnnouncement()
    -- 创建主框架
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.Position = UDim2.new(0, 0, 0, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)-- = 黑色背景 =
    frame.BorderSizePixel = 0
    frame.ZIndex = 10
    frame.Parent = gui

    -- 主标题
    local mainLabel = Instance.new("TextLabel")
    mainLabel.Size = UDim2.new(1, 0, 0.2, 0)
    mainLabel.Position = UDim2.new(0, 0, 0.3, 0)
    mainLabel.BackgroundTransparency = 1
    mainLabel.Text = "  HBFXM脚本"
    mainLabel.TextColor3 = Color3.new(1, 1, 1)-- = 白色文字 =
    mainLabel.TextScaled = true
    mainLabel.Font = Enum.Font.GothamBlack
    mainLabel.TextSize = 48
    mainLabel.ZIndex = 11
    mainLabel.Parent = frame

-- ================  副标题（可选） ================
    local subLabel = Instance.new("TextLabel")
    subLabel.Size = UDim2.new(1, 0, 0.1, 0)
    subLabel.Position = UDim2.new(0, 0, 0.55, 0)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = " HB FXM 脚本免费"
    subLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    subLabel.TextScaled = true
    subLabel.Font = Enum.Font.Gotham
    subLabel.TextSize = 24
    subLabel.ZIndex = 11
    subLabel.Parent = frame

-- ================ 倒计时提示 ================
    local countdownLabel = Instance.new("TextLabel")
    countdownLabel.Size = UDim2.new(1, 0, 0.05, 0)
    countdownLabel.Position = UDim2.new(0, 0, 0.7, 0)
    countdownLabel.BackgroundTransparency = 1
    countdownLabel.Text = "3秒后自动加载脚本..."
    countdownLabel.TextColor3 = Color3.new(0.7, 0.7, 1)
    countdownLabel.TextScaled = true
    countdownLabel.Font = Enum.Font.Gotham
    countdownLabel.TextSize = 18
    countdownLabel.ZIndex = 11
    countdownLabel.Parent = frame

-- ================  版本信息（可选） ================
    local versionLabel = Instance.new("TextLabel")
    versionLabel.Size = UDim2.new(1, 0, 0.05, 0)
    versionLabel.Position = UDim2.new(0, 0, 0.9, 0)
    versionLabel.BackgroundTransparency = 1
    versionLabel.Text = " 最早起源于2023年 | HB FXM"
    versionLabel.TextColor3 = Color3.new(0.6, 0.6, 0.6)
    versionLabel.TextScaled = true
    versionLabel.Font = Enum.Font.Gotham
    versionLabel.TextSize = 16
    versionLabel.ZIndex = 11
    versionLabel.Parent = frame

-- ================ 设置初始状态（完全透明） ================
    mainLabel.TextTransparency = 1
    mainLabel.Position = UDim2.new(0, 0, 0.4, 0)
    subLabel.TextTransparency = 1
    subLabel.Position = UDim2.new(0, 0, 0.6, 0)
    countdownLabel.TextTransparency = 1
    versionLabel.TextTransparency = 1

-- ================ 入场动画序列 ================
    local function playEntranceAnimation()
                  -- = 主标题入场动画 =
        local mainEntranceTween = TweenService:Create(
            mainLabel,
            TweenInfo.new(1.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            {TextTransparency = 0, Position = UDim2.new(0, 0, 0.3, 0)}
        )
        
        -- 副标题延迟入场
        local subEntranceTween = TweenService:Create(
            subLabel,
            TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextTransparency = 0, Position = UDim2.new(0, 0, 0.55, 0)}
        )
        
        -- 倒计时提示入场
        local countdownEntranceTween = TweenService:Create(
            countdownLabel,
            TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextTransparency = 0}
        )
        
        -- 版本信息入场
        local versionEntranceTween = TweenService:Create(
            versionLabel,
            TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextTransparency = 0}
        )

        -- 播放动画序列
        mainEntranceTween:Play()
        wait(0.3)
        subEntranceTween:Play()
        wait(0.2)
        countdownEntranceTween:Play()
        wait(0.1)
        versionEntranceTween:Play()
    end

    -- 退场动画序列
    local function playExitAnimation()
        -- 主标题退场动画
        local mainExitTween = TweenService:Create(
            mainLabel,
            TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
            {TextTransparency = 1, Position = UDim2.new(0, 0, 0.2, 0)}
        )
        
        -- 副标题退场
        local subExitTween = TweenService:Create(
            subLabel,
            TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {TextTransparency = 1, Position = UDim2.new(0, 0, 0.7, 0)}
        )
        
        -- 倒计时提示退场
        local countdownExitTween = TweenService:Create(
            countdownLabel,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {TextTransparency = 1}
        )
        
        -- 版本信息退场
        local versionExitTween = TweenService:Create(
            versionLabel,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {TextTransparency = 1}
        )

        -- 播放退场动画序列
        countdownExitTween:Play()
        wait(0.1)
        versionExitTween:Play()
        wait(0.1)
        subExitTween:Play()
        wait(0.1)
        mainExitTween:Play()
        
        return mainExitTween
    end

    -- 加载外部脚本函数
    local function loadExternalScript()
        print("正在加载外部脚本...")
        
        -- 使用pcall来安全加载脚本
        local success, result = pcall(function()
            -- 这里加载你的外部脚本
            loadstring(game:HttpGet(SCRIPT_URL))()
        end)
        
        if success then
            print("外部脚本加载成功！")
        else
            warn("外部脚本加载失败: " .. tostring(result))
        end
    end

    -- 启动动画
    playEntranceAnimation()

    -- 倒计时功能
    spawn(function()
        local countdown = 3
        while countdown > 0 do
            countdownLabel.Text = countdown .. "秒后自动加载脚本..."
            wait(1)
            countdown = countdown - 1
        end
    end)

    -- 4秒后自动消失并加载脚本
    spawn(function()
        wait(3)  -- 显示4秒
        
        local exitTween = playExitAnimation()
        exitTween.Completed:Wait()  -- 等待动画完成
        
        -- 销毁所有元素
        frame:Destroy()
        gui:Destroy()
        
        print(" HB FXM全屏弹窗已关闭，开始加载外部脚本...")
        
        -- 加载外部脚本
        loadExternalScript()
    end)

    -- 添加点击立即关闭并加载脚本功能
    frame.MouseButton1Click:Connect(function()
        playExitAnimation()
        wait(0.8)
        frame:Destroy()
        gui:Destroy()
        
        print("用户点击关闭，开始加载外部脚本...")
        loadExternalScript()
    end)
    
    return frame
end

-- 创建全屏弹窗
createFullscreenAnnouncement()

print("全屏弹窗已启动，3秒后自动加载脚本")