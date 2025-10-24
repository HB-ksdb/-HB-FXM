-- ================ 黑名单 ================
-- 名字用户（别人用不了脚本）
local blacklist = {
    "BadPlayer1",
    "Hacker123",
    "CheaterABC",
    "",
    "要拉黑的用户名2"
-- ================ 添加要拉黑的用户名 ================
}

-- ================ 检查当前玩家是否在黑名单中 ================
local function checkBlacklist()
    local localPlayer = game.Players.LocalPlayer
    local username = localPlayer.Name
    
-- ================ 遍历黑名单检查 ================
    for _, blacklistedName in ipairs(blacklist) do
        if username == blacklistedName then
-- ================ 如果在黑名单中，执行踢出代码 ================
            game.Players.LocalPlayer:Kick("你已被HB FXM脚本加入至黑名单，我让你惹HB FXM现在好了吧？你活该！")
            return true
        end
    end
    return false
end

-- ================ 立即执行检查 ================
if checkBlacklist() then
    return  -- = 如果在黑名单中，停止执行后续代码 =
end
-- ================ 彩虹字符 ================


-- ================ 支持服务器 ================
--支持服务器
--通用
--刀刃球
--最强战场
--环山军区（收费）
--极速传奇
--99夜
--力量传奇
--忍者传奇（收费）
--战争大享
--火箭发射模拟器 
--自然灾害
--doors









-- ================ 支持服务器 ================
-- ================ 1.执行UI加载器…… ================
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
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "鹤pro"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("HB FXM:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S")).."秒"
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
-- ================  ================











-- ================  ================
local WindUI = loadstring(game:HttpGet(" https://github.com/Footagesus/WindUI/releases/download/1.6.41/main.lua"))()
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
        Title = "<font color='#FF0000'>HB I FXM</font>",
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
            CornerRadius = UDim.new(0, 1),
            StrokeThickness = 3,
            Color = ColorSequence.new(Color3.fromHex("#ff0000"), Color3.fromHex("#ffc0cb")),
            Draggable = true
        })

-- ================ 标题 ================

Window:Tag({
    Title = "v2.0HB FXM",
    Color = Color3.fromHex("#30ff6a")
})



Window:Tag({
        Title = " HB FXM", -- 标签汉化
        Color = Color3.fromHex("#800080")
    })
        local TimeTag = Window:Tag({
        Title = "00:00",
        Color = Color3.fromHex("#ff0000")
    })
    
    -- Rainbow effect & Time 
    local hue = 0
    task.spawn(function()
        while true do
            local now = os.date("*t")
            local hours = string.format("%02d", now.hour)
            local minutes = string.format("%02d", now.min)
            
            hue = (hue + 0.01) % 1
            local color = Color3.fromHSV(hue, 1, 1)
            
            TimeTag:SetTitle(hours .. ":" .. minutes)
            --TimeTag:SetColor(color)

            task.wait(0.06)
        end
    end)
    
    
    
    
-- ================  ================

WindUI:Notify({
    Title = "HB FXM ",
    Content = "防抓包也开启",
    Duration = 3, -- 3 seconds
    Icon = "bird",
})






-- ================ 选项下拉 ================
local Tabs = {
    HB = Window:Section({ Title = "公告或脚本", Opened = true }),
    Main = Window:Section({ Title = "通用", Opened = true }),
    xx = Window:Section({ Title = "服务器", Opened = true }),        
    gn = Window:Section({ Title = "UI自定义", Opened = true }),    
}

local TabHandles = {
    Y = Tabs.HB:Tab({ Title = "信息", Icon = "atom" }),    
    QI = Tabs.HB:Tab({ Title = "HB FXM脚本", Icon = "atom" }),            
    YI = Tabs.Main:Tab({ Title = "功能通用", Icon = "atom" }),    
    Q = Tabs.Main:Tab({ Title = "透视功能", Icon = "cctv" }),        
    E = Tabs.Main:Tab({ Title = "自瞄功能", Icon = "lock", Desc = "This tab is locked", Locked = true }),
    ER = Tabs.xx:Tab({ Title = "加入服务器", Icon = "chart-bar-big" }),            
    SAN = Tabs.gn:Tab({ Title = "自定义UI", Icon = "expand" }),    
    XX = Tabs.Main:Tab({ Title = "UI.2", Icon = "lock", Desc = "This tab is locked", Locked = true }),
}


-- ================ 测试注入器 ================
Paragraph = TabHandles.Y:Paragraph({
    Title = "您的注入器：",
    Desc = "" .. identifyexecutor() .. "",
    Image = "rbxassetid://129287693322764",
    ImageSize = 42, -- default 30
    Thumbnail = "rbxassetid://114457723265156",
    ThumbnailSize = 120, -- Thumbnail height
    Buttons = {{
        Title = "测试您注入器的UNC",
        Variant = "Primary",
        Callback = function()
            Window:Dialog({
                Title = "HB脚本中心",
                Content = "温馨提示：请勿点击多次，\n否则会造成游戏卡顿!",
                Icon = "bell",
                Buttons = {{
                    Title = "确定",
                    Variant = "Primary",
                    Callback = function()
                        print("ok")
                    end
                }}
            })
            loadstring(game:HttpGet "https://raw.githubusercontent.com/Yungengxin/roblox/refs/heads/main/unc")()

            local Sound = Instance.new("Sound", game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
            WindUI:Notify({
                Title = "HB脚本中心---提示：",
                Content = "已成功执行，请在控制台查看UNC！",
                Icon = "bell",
                IconThemed = true, -- automatic color icon to theme 
                Duration = 5
            })

        end,
        Icon = "bird"
    }}
})

Paragraph = TabHandles.Y:Paragraph({
    Title = "支持人",
    Desc = "合作人：FXM 支持：小猫土豆 支持：小皮",
    Image = "palette",
    ImageSize = 45,
    Color = "White"
})

-- ================ 图片x ================
Paragraph = TabHandles.Y:Paragraph({
    Title = "欢迎使用 越 HB脚本",
    Desc = "QQ群 1055870765",
    Thumbnail = "rbxassetid://79087575647853",-- = ID图片大 =
    ThumbnailSize = 120,
})

-- ================ 你的账号用户名ID ================
Paragraph = TabHandles.Y:Paragraph({
    Title = "您的用户名ID：",
    Desc = "" .. game:GetService("Players").LocalPlayer.UserId .. "",
    Buttons = {{
        Title = "复制您的用户名ID",
        Icon = "copy",
        Variant = "Primary",
        Callback = function()

            setclipboard(game:GetService("Players").LocalPlayer.UserId)

            local Sound = Instance.new("Sound", game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
            WindUI:Notify({
                Title = "HB脚本中心---提示：",
                Content = "已成功复制！",
                Icon = "bell",
                IconThemed = true, -- automatic color icon to theme 
                Duration = 5
            })

        end,
        Icon = "bird"
    }}
})


-- ================ 服务器名 ================
Paragraph = TabHandles.Y:Paragraph({
    Title = "您所在的服务器名称：",
    Desc = "" .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. "",
    Buttons = {{
        Title = "复制您所在的服务器名称",
        Icon = "copy",
        Variant = "Primary",
        Callback = function()

            setclipboard(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)

            local Sound = Instance.new("Sound", game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
            WindUI:Notify({
                Title = "HB脚本中心---提示：",
                Content = "已成功复制！",
                Icon = "bell",
                IconThemed = true, -- automatic color icon to theme 
                Duration = 5
            })

        end,
        Icon = "bird"
    }}
})

-- ================ 账号注册时间天 ================
Paragraph = TabHandles.Y:Paragraph({
    Title = "您的账号注册时间（天）：",
    Desc = "" .. game:GetService("Players").LocalPlayer.AccountAge .. "",
    Buttons = {{
        Title = "复制您的注册时间",
        Icon = "copy",
        Variant = "Primary",
        Callback = function()

            setclipboard(game:GetService("Players").LocalPlayer.AccountAge)

            local Sound = Instance.new("Sound", game:GetService("SoundService"))
            Sound.SoundId = "rbxassetid://2865227271"
            Sound:Play()
            WindUI:Notify({
                Title = "HB脚本中心---提示：",
                Content = "已成功复制！",
                Icon = "bell",
                IconThemed = true, -- automatic color icon to theme 
                Duration = 5
            })

        end,
        Icon = "bird"
    }}
})

Section = TabHandles.QI:Section({ Title = "你启动了多次脚本你把它关闭后，你再选择后选择不了了" })

Button = TabHandles.QI:Button({
    Title = "［脚本选择］",
    Callback = function()
        Window:Dialog({
            Title = "请选择",
            Icon = "bird",
            Buttons = {
                {
                    Title = "［DOORS］",
                    Icon = "bird",
                    Variant = "Tertiary",
                    Callback = function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/HB-ksdb/-HB-FXM/main/1.HB%20FXM%20DOORS%E5%8A%A0%E5%AF%86.txt",true))()
                    end,
                },
                {
                    Title = "［自然灾害］",
                    Icon = "bird",
                    Variant = "Tertiary",
                    Callback = function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/HB-ksdb/-HB-FXM/main/5.HB%20FXM%20%E8%87%AA%E7%84%B6%E7%81%BE%E5%AE%B3%E5%8A%A0%E5%AF%86.txt",true))()
                    end,
                },
                {
                    Title = "［战争大亨］",
                    Icon = "bird",
                    Variant = "Tertiary",
                    Callback = function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/HB-ksdb/-HB-FXM/main/2.HB%20FXM%20%E6%88%98%E4%BA%89%E5%A4%A7%E4%BA%AB%E5%8A%A0%E5%AF%86.txt",true))()
                    end,
                },
                {
                    Title = "［忍者传奇］",
                    Icon = "bird",
                    Variant = "Tertiary",
                    Callback = function() 
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/HB-ksdb/-HB-FXM/main/7.HB%20FXM%20%E5%BF%8D%E8%80%85%E4%BC%A0%E5%A5%87%E5%8A%A0%E5%AF%86.txt",true))()
                    end,
                },
                {
                    Title = "［力量传奇］",
                    Icon = "bird",
                    Variant = "Tertiary",
                    Callback = function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/HB-ksdb/-HB-FXM/main/6.HB%20FXM%20%E5%8A%9B%E9%87%8F%E4%BC%A0%E5%A5%87%E5%8A%A0%E5%AF%86.txt",true))()
                    end,
                },
                {
                    Title = "［极速传奇］",
                    Icon = "bird",
                    Variant = "Tertiary",
                    Callback = function()
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/HB-ksdb/-4/main/%E6%9E%81%E9%80%9F%E4%BC%A0%E5%A5%87.txt",true))()
                    end,
                },
                {
                    Title = "［环山军区］",
                    Icon = "bird",
                    Variant = "Tertiary",
                    Callback = function() 
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/HB-ksdb/-HB-FXM/main/3.HB%20FXM%20%E7%8E%AF%E5%B1%B1%E5%86%9B%E5%8C%BA%E5%8A%A0%E5%AF%86.txt",true))()
                    end,
                },    
                {
                    Title = "关闭",
                    Variant = "Primary"                
                }
            }
        })
    end,
})

-- ================ 更改跳跃 ================
Slider = TabHandles.YI:Slider({
    Title = "跳跃",
    Value = {
        Min = 50,
        Max = 200,
        Default = 50,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = value
        end
    end
})
-- ================ 更改速度 ================
Slider = TabHandles.YI:Slider({
    Title = "速度",
    Value = {
        Min = 16,
        Max = 400,
        Default = 16,
    },
    Increment = 1,
    Callback = function(value)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = value
        end
    end
})
-- ================ 更改重量 ================
Slider = TabHandles.YI:Slider({
    Title = "重量",
    Value = {
        Min = 0.1,
        Max = 500.0,
        Default = 196.2,
    },
    Step = 0.1,
    Callback = function(value)
        game.Workspace.Gravity = value
    end
})

Slider = TabHandles.YI:Slider({
    Title = "视野(正常70)",
    Value = {
        Min = 70,
        Max = 250,
        Default = 70,
    },
    Increment = 1,
    Callback = function(v)
game.Workspace.CurrentCamera.FieldOfView = v
    end
})
TabHandles.YI:Divider()

-- ================ 通用下 ================


Button = TabHandles.YI:Button({
    Title = "偷别人的道具",
    Desc = "偷背包里的东西",
    Locked = false,
    Callback = function()
-- ================ 偷道具 ================
for i,v in pairs (game.Players:GetChildren()) do
wait()
for i,b in pairs (v.Backpack:GetChildren()) do
b.Parent = game.Players.LocalPlayer.Backpack
end
end
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})


-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =
-- ================ HB FXM  ================
Button =TabHandles.YI:Button({
    Title = "飞行v1",
    Desc = "HB FXM飞行",
    Locked = false,
    Callback = function()
        local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)

up.Name = "上"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "上"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000

down.Name = "下"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "下"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "fly"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "越 HB脚本"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true

closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "关闭"
closebutton.TextSize = 30
closebutton.Position =  UDim2.new(0, 0, -1, 27)

mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "T"
mini.TextSize = 30
mini.Position = UDim2.new(0, 44, -1, 27)

mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "T"
mini2.TextSize = 30
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false

speeds = 1

local speaker = game:GetService("Players").LocalPlayer

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

nowe = false

game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "越 HB飞行";
	Text = "lnjection succeeded";
	Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5;

Frame.Active = true -- main = gui
Frame.Draggable = true

onof.MouseButton1Down:connect(function()

	if nowe == true then
		nowe = false

		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else 
		nowe = true



		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end


	if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



		local plr = game.Players.LocalPlayer
		local torso = plr.Character.Torso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			game:GetService("RunService").RenderStepped:Wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end
			--	game.Players.LocalPlayer.Character.Animate.Disabled = true
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false




	else
		local plr = game.Players.LocalPlayer
		local UpperTorso = plr.Character.UpperTorso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", UpperTorso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = UpperTorso.CFrame
		local bv = Instance.new("BodyVelocity", UpperTorso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end

			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false



	end





end)

local tis

up.MouseButton1Down:connect(function()
	tis = up.MouseEnter:connect(function()
		while tis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
		end
	end)
end)

up.MouseLeave:connect(function()
	if tis then
		tis:Disconnect()
		tis = nil
	end
end)

local dis

down.MouseButton1Down:connect(function()
	dis = down.MouseEnter:connect(function()
		while dis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
		end
	end)
end)

down.MouseLeave:connect(function()
	if dis then
		dis:Disconnect()
		dis = nil
	end
end)


game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
	wait(0.7)
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	game.Players.LocalPlayer.Character.Animate.Disabled = false

end)


plus.MouseButton1Down:connect(function()
	speeds = speeds + 1
	speed.Text = speeds
	if nowe == true then


		tpwalking = false
		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
	end
end)
mine.MouseButton1Down:connect(function()
	if speeds == 1 then
		speed.Text = 'flyno1'
		wait(1)
		speed.Text = speeds
	else
		speeds = speeds - 1
		speed.Text = speeds
		if nowe == true then
			tpwalking = false
			for i = 1, speeds do
				spawn(function()

					local hb = game:GetService("RunService").Heartbeat	


					tpwalking = true
					local chr = game.Players.LocalPlayer.Character
					local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
					while tpwalking and hb:Wait() and chr and hum and hum.Parent do
						if hum.MoveDirection.Magnitude > 0 then
							chr:TranslateBy(hum.MoveDirection)
						end
					end

				end)
			end
		end
	end
end)

closebutton.MouseButton1Click:Connect(function()
	main:Destroy()
end)

mini.MouseButton1Click:Connect(function()
	up.Visible = false
	down.Visible = false
	onof.Visible = false
	plus.Visible = false
	speed.Visible = false
	mine.Visible = false
	mini.Visible = false
	mini2.Visible = true
	main.Frame.BackgroundTransparency = 1
	closebutton.Position =  UDim2.new(0, 0, -1, 57)
end)

mini2.MouseButton1Click:Connect(function()
	up.Visible = true
	down.Visible = true
	onof.Visible = true
	plus.Visible = true
	speed.Visible = true
	mine.Visible = true
	mini.Visible = true
	mini2.Visible = false
	main.Frame.BackgroundTransparency = 0 
	closebutton.Position =  UDim2.new(0, 0, -1, 27)
end)
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})
    end
})
TabHandles.YI:Divider()
-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =
-- ================ HB FXM  ================





-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =
-- ================ 点击加载 ================
Toggle = TabHandles.YI:Toggle({
    Title = "夜视仪",
    Desc = "能看到更清楚",
    Locked = false,
    Callback = function(Value)
    if Value then
      game.Lighting.Ambient = Color3.new(1, 1, 1)
     else
      game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
WindUI:Notify({
            Title = "夜视仪脚本中心：",
            Content = state and "已开启夜视仪" or "已关闭夜视仪",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})
-- ================ 🤫🤫🤫 ================
-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =
-- =  =
Toggle = TabHandles.YI:Toggle({
    Title = "穿墙",
    Desc = "点击加载",
    Locked = false,
    Callback = function(Value)
    if Value then
      Noclip = true
      Stepped = game.RunService.Stepped:Connect(function()
        if Noclip == true then
          for a, b in pairs(game.Workspace:GetChildren()) do
            if b.Name == game.Players.LocalPlayer.Name then
              for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                  v.CanCollide = false
                end
              end
            end
          end
         else
          Stepped:Disconnect()
        end
      end)
     else
      Noclip = false
    end
    WindUI:Notify({
            Title = "脚本中心：",
            Content = state and "已开启穿墙" or "已关闭穿墙",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})
-- =  =
-- ================  ================

Button = TabHandles.YI:Button({
    Title = "无限跳",
    Desc = "点击加载",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})










-- ================  ================
Button = TabHandles.YI:Button({
    Title = "指令挂(英文)",
    Desc = "点击加载",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})
-- ================  ================
-- =  =

Button = TabHandles.YI:Button({
    Title = "甩飞所有人",
    Desc = "78",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.YI:Button({
    Title = "断腿+无头",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet(" https://rawscripts.net/raw/Universal-Script-Permanent-Headless-And-korblox-Script-4140",true))()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

-- =  =
-- ================  ================-- =  =
Button = TabHandles.YI:Button({
    Title = "点击传送工具",
    Desc = "点击加载",
    Locked = false,
    Callback = function()
      mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "HB FXM 点击传送" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})
-- ================  ================-- =  =
-- =  =
Button = TabHandles.YI:Button({
    Title = "防甩飞",
    Desc = "别人想甩飞你是不可能的",
    Locked = false,
    Callback = function()
        local Services = setmetatable({}, {__index = function(Self, Index)
local NewService = game.GetService(game, Index)
if NewService then
Self[Index] = NewService
end
return NewService
end})

local LocalPlayer = Services.Players.LocalPlayer

local function PlayerAdded(Player)
   local Detected = false
   local Character;
   local PrimaryPart;

   local function CharacterAdded(NewCharacter)
       Character = NewCharacter
       repeat
           wait()
           PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
       until PrimaryPart
       Detected = false
   end

   CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
   Player.CharacterAdded:Connect(CharacterAdded)
   Services.RunService.Heartbeat:Connect(function()
       if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
           if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
               if Detected == false then
                   game.StarterGui:SetCore("ChatMakeSystemMessage", {
                       Text = "Fling Exploit Detected Player : "..tostring(Player);
                       Color = Color3.fromRGB(255, 200, 0);
                   })
               end
               Detected = true
               for i,v in ipairs(Character:GetDescendants()) do
                   if v:IsA("BasePart") then
                       v.CanCollide = false
                       v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                       v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                       v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                   end
               end
               PrimaryPart.CanCollide = false
               PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
           end
       end
   end)
end

for i,v in ipairs(Services.Players:GetPlayers()) do
   if v ~= LocalPlayer then
       PlayerAdded(v)
   end
end
Services.Players.PlayerAdded:Connect(PlayerAdded)            

WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})
    end
})
-- =  =
-- ================  ================



-- ================  ================
-- =  =
Button = TabHandles.YI:Button({
    Title = "撸关R15",
    Desc = "R15",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
        
    WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})
        
    end
})
-- =  =
-- ================  ================

Button = TabHandles.YI:Button({
    Title = "撸关R6",
    Desc = "R6",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()

    WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})
        
    end
})
-- =  =
-- ================  ================



-- ================  ================
-- =  =

-- =  =
-- ================  ================


-- ================  ================
Button = TabHandles.YI:Button({
    Title = "爬墙",
    Desc = "怎么都可以爬墙",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
        
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})
-- ================  ================

-- ================  ================
Button = TabHandles.YI:Button({
    Title = "动作",
    Desc = "支持R15体型",
    Locked = false,
    Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()

WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})       
       
    end
})
-- ================  ================
-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =














-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =
-- ================ 透视esp ================
getgenv().ESPEnabled = false
getgenv().ShowBox = false
getgenv().ShowHealth = false
getgenv().ShowName = false
getgenv().ShowDistance = false
getgenv().ShowTracer = false
getgenv().TeamCheck = false
getgenv().ShowSkeleton = false
getgenv().ShowRadar = false
getgenv().ShowPlayerCount = false
getgenv().ShowWeapon = false
getgenv().ShowFOV = false
getgenv().OutOfViewArrows = false
getgenv().Chams = false

getgenv().TracerColor = Color3.new(1, 0, 0)
getgenv().SkeletonColor = Color3.new(0.2, 0.8, 1)
getgenv().BoxColor = Color3.new(1, 1, 1)
getgenv().HealthBarColor = Color3.new(0, 1, 0)
getgenv().HealthTextColor = Color3.new(1, 1, 1)
getgenv().NameColor = Color3.new(1, 1, 1)
getgenv().DistanceColor = Color3.new(1, 1, 0)
getgenv().WeaponColor = Color3.new(1, 0.5, 0)
getgenv().ArrowColor = Color3.new(1, 0, 0)
getgenv().FOVColor = Color3.new(1, 1, 1)
getgenv().ChamsColor = Color3.new(1, 0, 0)

getgenv().BoxThickness = 1
getgenv().TracerThickness = 1
getgenv().SkeletonThickness = 2
getgenv().FOVRadius = 100
getgenv().ArrowSize = 15

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local function getGradientColor(time)
    local r = math.sin(time * 2) * 0.5 + 0.5
    local g = math.sin(time * 3) * 0.5 + 0.5
    local b = math.sin(time * 4) * 0.5 + 0.5
    return Color3.new(r, g, b)
end

local playerCountText = Drawing.new("Text")
playerCountText.Visible = false
playerCountText.Color = Color3.new(1, 1, 1)
playerCountText.Size = 20
playerCountText.Font = Drawing.Fonts.Monospace
playerCountText.Outline = true
playerCountText.OutlineColor = Color3.new(0, 0, 0)
playerCountText.Position = Vector2.new(Camera.ViewportSize.X / 2, 10)

local fovCircle = Drawing.new("Circle")
fovCircle.Visible = false
fovCircle.Color = getgenv().FOVColor
fovCircle.Thickness = 1
fovCircle.Filled = false
fovCircle.Radius = getgenv().FOVRadius
fovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

local function updatePlayerCount()
    local playerCount = #Players:GetPlayers()
    playerCountText.Text = "在线玩家: " .. playerCount
    playerCountText.Visible = getgenv().ESPEnabled and getgenv().ShowPlayerCount

    local time = tick()
    playerCountText.Color = getGradientColor(time)
end

local function updateFOV()
    fovCircle.Visible = getgenv().ShowFOV
    fovCircle.Color = getgenv().FOVColor
    fovCircle.Radius = getgenv().FOVRadius
    fovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
end

local ESPComponents = {}

local function createESP(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = getgenv().BoxColor
    box.Thickness = getgenv().BoxThickness
    box.Filled = false

    local healthBar = Drawing.new("Square")
    healthBar.Visible = false
    healthBar.Color = getgenv().HealthBarColor
    healthBar.Thickness = 1
    healthBar.Filled = true

    local healthBarBackground = Drawing.new("Square")
    healthBarBackground.Visible = false
    healthBarBackground.Color = Color3.new(0, 0, 0)
    healthBarBackground.Transparency = 0.5
    healthBarBackground.Thickness = 1
    healthBarBackground.Filled = true

    local healthBarBorder = Drawing.new("Square")
    healthBarBorder.Visible = false
    healthBarBorder.Color = Color3.new(1, 1, 1)
    healthBarBorder.Thickness = 1
    healthBarBorder.Filled = false

    local healthText = Drawing.new("Text")
    healthText.Visible = false
    healthText.Color = getgenv().HealthTextColor
    healthText.Size = 14
    healthText.Font = Drawing.Fonts.Monospace
    healthText.Outline = true
    healthText.OutlineColor = Color3.new(0, 0, 0)

    local nameText = Drawing.new("Text")
    nameText.Visible = false
    nameText.Color = getgenv().NameColor
    nameText.Size = 16
    nameText.Font = Drawing.Fonts.Monospace
    nameText.Outline = true
    nameText.OutlineColor = Color3.new(0, 0, 0)

    local distanceText = Drawing.new("Text")
    distanceText.Visible = false
    distanceText.Color = getgenv().DistanceColor
    distanceText.Size = 14
    distanceText.Font = Drawing.Fonts.Monospace
    distanceText.Outline = true
    distanceText.OutlineColor = Color3.new(0, 0, 0)

    local weaponText = Drawing.new("Text")
    weaponText.Visible = false
    weaponText.Color = getgenv().WeaponColor
    weaponText.Size = 14
    weaponText.Font = Drawing.Fonts.Monospace
    weaponText.Outline = true
    weaponText.OutlineColor = Color3.new(0, 0, 0)

    local tracer = Drawing.new("Line")
    tracer.Visible = false
    tracer.Color = getgenv().TracerColor
    tracer.Thickness = getgenv().TracerThickness

    local arrow = Drawing.new("Triangle")
    arrow.Visible = false
    arrow.Color = getgenv().ArrowColor
    arrow.Filled = true
    arrow.Thickness = 1

    local skeletonLines = {}
    local skeletonPoints = {}

    local function createSkeleton()
        for i = 1, 15 do
            skeletonLines[i] = Drawing.new("Line")
            skeletonLines[i].Visible = false
            skeletonLines[i].Color = getgenv().SkeletonColor
            skeletonLines[i].Thickness = getgenv().SkeletonThickness
        end

        skeletonPoints["Head"] = Drawing.new("Circle")
        skeletonPoints["Head"].Visible = false
        skeletonPoints["Head"].Color = Color3.new(1, 0.5, 0)
        skeletonPoints["Head"].Thickness = 2
        skeletonPoints["Head"].Filled = true
        skeletonPoints["Head"].Radius = 4
    end

    createSkeleton()

    local lastHealth = 100
    local healthChangeTime = 0
    local smoothHealth = 100

    ESPComponents[player] = {
        box = box,
        healthBar = healthBar,
        healthBarBackground = healthBarBackground,
        healthBarBorder = healthBarBorder,
        healthText = healthText,
        nameText = nameText,
        distanceText = distanceText,
        weaponText = weaponText,
        tracer = tracer,
        arrow = arrow,
        skeletonLines = skeletonLines,
        skeletonPoints = skeletonPoints
    }

    RunService.RenderStepped:Connect(function()
        if not getgenv().ESPEnabled or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") or not player.Character:FindFirstChild("Humanoid") or player == LocalPlayer then
            box.Visible = false
            healthBar.Visible = false
            healthBarBackground.Visible = false
            healthBarBorder.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            weaponText.Visible = false
            tracer.Visible = false
            arrow.Visible = false
            for _, line in pairs(skeletonLines) do
                line.Visible = false
            end
            for _, point in pairs(skeletonPoints) do
                point.Visible = false
            end
            return
        end

        if getgenv().TeamCheck and player.Team == LocalPlayer.Team then
            box.Visible = false
            healthBar.Visible = false
            healthBarBackground.Visible = false
            healthBarBorder.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            weaponText.Visible = false
            tracer.Visible = false
            arrow.Visible = false
            for _, line in pairs(skeletonLines) do
                line.Visible = false
            end
            for _, point in pairs(skeletonPoints) do
                point.Visible = false
            end
            return
        end

        local character = player.Character
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")

        if rootPart and humanoid and humanoid.Health > 0 then
            local rootPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            local headPos, _ = Camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 3, 0))
            local legPos, _ = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))

            local weaponName = "无武器"
            for _, tool in ipairs(character:GetChildren()) do
                if tool:IsA("Tool") then
                    weaponName = tool.Name
                    break
                end
            end

            if getgenv().ShowBox and onScreen then
                box.Size = Vector2.new(1000 / rootPos.Z, headPos.Y - legPos.Y)
                box.Position = Vector2.new(rootPos.X - box.Size.X / 2, rootPos.Y - box.Size.Y / 2)
                box.Visible = true
                box.Color = getgenv().BoxColor
                box.Thickness = getgenv().BoxThickness
            else
                box.Visible = false
            end

            if getgenv().ShowHealth and onScreen then
                local healthPercentage = humanoid.Health / humanoid.MaxHealth
                local barWidth = 50
                local barHeight = 5
                local barX = headPos.X - barWidth / 2
                local barY = headPos.Y - 20

                healthBarBackground.Size = Vector2.new(barWidth, barHeight)
                healthBarBackground.Position = Vector2.new(barX, barY)
                healthBarBackground.Visible = true

                healthBarBorder.Size = Vector2.new(barWidth, barHeight)
                healthBarBorder.Position = Vector2.new(barX, barY)
                healthBarBorder.Visible = true

                smoothHealth = smoothHealth + (humanoid.Health - smoothHealth) * 0.1
                local smoothHealthPercentage = smoothHealth / humanoid.MaxHealth

                healthBar.Size = Vector2.new(barWidth * smoothHealthPercentage, barHeight)
                healthBar.Position = Vector2.new(barX, barY)

                if smoothHealthPercentage >= 0.8 then
                    healthBar.Color = Color3.new(0, 1, 0)
                elseif smoothHealthPercentage >= 0.5 then
                    healthBar.Color = Color3.new(1, 1, 0)
                elseif smoothHealthPercentage >= 0.2 then
                    healthBar.Color = Color3.new(1, 0.5, 0)
                else
                    healthBar.Color = Color3.new(1, 0, 0)
                end

                healthBar.Visible = true

                if humanoid.Health ~= lastHealth then
                    healthChangeTime = tick()
                    lastHealth = humanoid.Health
                end

                if tick() - healthChangeTime < 0.5 then
                    healthBar.Color = Color3.new(1, 0, 0)
                end

                healthText.Position = Vector2.new(barX + barWidth + 5, barY - 5)
                healthText.Text = math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
                healthText.Visible = true
            else
                healthBar.Visible = false
                healthBarBackground.Visible = false
                healthBarBorder.Visible = false
                healthText.Visible = false
            end

            if getgenv().ShowName and onScreen then
                nameText.Position = Vector2.new(headPos.X, headPos.Y - 35)
                nameText.Text = player.Name
                nameText.Visible = true

                if getgenv().ShowDistance then
                    local distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                    distanceText.Position = Vector2.new(headPos.X, headPos.Y + 10)
                    distanceText.Text = math.floor(distance) .. "m"
                    distanceText.Visible = true
                else
                    distanceText.Visible = false
                end
                
                if getgenv().ShowWeapon then
                    weaponText.Position = Vector2.new(headPos.X, headPos.Y - 50)
                    weaponText.Text = weaponName
                    weaponText.Visible = true
                else
                    weaponText.Visible = false
                end
            else
                nameText.Visible = false
                distanceText.Visible = false
                weaponText.Visible = false
            end

            if getgenv().ShowTracer then
                local head = character:FindFirstChild("Head")
                if head then
                    local headPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                    if onScreen then
                        tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                        tracer.To = Vector2.new(headPos.X, headPos.Y)
                        tracer.Visible = true
                        tracer.Color = getgenv().TracerColor
                        tracer.Thickness = getgenv().TracerThickness
                        
                        local distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                        if distance < 20 then
                            tracer.Color = Color3.new(0, 1, 0)
                        elseif distance < 50 then
                            tracer.Color = Color3.new(1, 1, 0) 
                        else
                            tracer.Color = getgenv().TracerColor 
                        end
                    else
                        tracer.Visible = false
                    end
                else
                    tracer.Visible = false
                end
            else
                tracer.Visible = false
            end

            if getgenv().OutOfViewArrows and not onScreen then
                local direction = (rootPart.Position - Camera.CFrame.Position).Unit
                local dotProduct = Camera.CFrame.RightVector:Dot(direction)
                local crossProduct = Camera.CFrame.RightVector:Cross(direction)
                
                local screenPosition = Vector2.new(
                    Camera.ViewportSize.X / 2 + dotProduct * Camera.ViewportSize.X / 3,
                    Camera.ViewportSize.Y / 2 - crossProduct.Y * Camera.ViewportSize.Y / 3
                )
                
                screenPosition = Vector2.new(
                    math.clamp(screenPosition.X, getgenv().ArrowSize, Camera.ViewportSize.X - getgenv().ArrowSize),
                    math.clamp(screenPosition.Y, getgenv().ArrowSize, Camera.ViewportSize.Y - getgenv().ArrowSize)
                )
                
                local angle = math.atan2(screenPosition.Y - Camera.ViewportSize.Y / 2, screenPosition.X - Camera.ViewportSize.X / 2)
                
                arrow.PointA = screenPosition
                arrow.PointB = Vector2.new(
                    screenPosition.X - getgenv().ArrowSize * math.cos(angle - 0.5),
                    screenPosition.Y - getgenv().ArrowSize * math.sin(angle - 0.5)
                )
                arrow.PointC = Vector2.new(
                    screenPosition.X - getgenv().ArrowSize * math.cos(angle + 0.5),
                    screenPosition.Y - getgenv().ArrowSize * math.sin(angle + 0.5)
                )
                
                arrow.Color = getgenv().ArrowColor
                arrow.Visible = true
            else
                arrow.Visible = false
            end

            if getgenv().ShowSkeleton and onScreen then
                local head = character:FindFirstChild("Head")
                local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
                local leftArm = character:FindFirstChild("Left Arm") or character:FindFirstChild("LeftUpperArm")
                local rightArm = character:FindFirstChild("Right Arm") or character:FindFirstChild("RightUpperArm")
                local leftLeg = character:FindFirstChild("Left Leg") or character:FindFirstChild("LeftUpperLeg")
                local rightLeg = character:FindFirstChild("Right Leg") or character:FindFirstChild("RightUpperLeg")
                
                if head and torso and leftArm and rightArm and leftLeg and rightLeg then
                    local headPos = Camera:WorldToViewportPoint(head.Position)
                    local torsoPos = Camera:WorldToViewportPoint(torso.Position)
                    local leftArmPos = Camera:WorldToViewportPoint(leftArm.Position)
                    local rightArmPos = Camera:WorldToViewportPoint(rightArm.Position)
                    local leftLegPos = Camera:WorldToViewportPoint(leftLeg.Position)
                    local rightLegPos = Camera:WorldToViewportPoint(rightLeg.Position)

                    skeletonPoints["Head"].Position = Vector2.new(headPos.X, headPos.Y)
                    skeletonPoints["Head"].Visible = true

                    skeletonLines[1].From = Vector2.new(headPos.X, headPos.Y)
                    skeletonLines[1].To = Vector2.new(torsoPos.X, torsoPos.Y) 
                    skeletonLines[1].Visible = true

                    skeletonLines[2].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[2].To = Vector2.new(leftArmPos.X, leftArmPos.Y)
                    skeletonLines[2].Visible = true

                    skeletonLines[3].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[3].To = Vector2.new(rightArmPos.X, rightArmPos.Y)
                    skeletonLines[3].Visible = true

                    skeletonLines[4].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[4].To = Vector2.new(leftLegPos.X, leftLegPos.Y)
                    skeletonLines[4].Visible = true

                    skeletonLines[5].From = Vector2.new(torsoPos.X, torsoPos.Y)
                    skeletonLines[5].To = Vector2.new(rightLegPos.X, rightLegPos.Y)
                    skeletonLines[5].Visible = true
                    
                    if character:FindFirstChild("LeftLowerArm") then
                        local leftLowerArmPos = Camera:WorldToViewportPoint(character.LeftLowerArm.Position)
                        skeletonLines[6].From = Vector2.new(leftArmPos.X, leftArmPos.Y)
                        skeletonLines[6].To = Vector2.new(leftLowerArmPos.X, leftLowerArmPos.Y)
                        skeletonLines[6].Visible = true
                    end

                    if character:FindFirstChild("RightLowerArm") then
                        local rightLowerArmPos = Camera:WorldToViewportPoint(character.RightLowerArm.Position)
                        skeletonLines[7].From = Vector2.new(rightArmPos.X, rightArmPos.Y)
                        skeletonLines[7].To = Vector2.new(rightLowerArmPos.X, rightLowerArmPos.Y)
                        skeletonLines[7].Visible = true
                    end

                    if character:FindFirstChild("LeftLowerLeg") then
                        local leftLowerLegPos = Camera:WorldToViewportPoint(character.LeftLowerLeg.Position)
                        skeletonLines[8].From = Vector2.new(leftLegPos.X, leftLegPos.Y)
                        skeletonLines[8].To = Vector2.new(leftLowerLegPos.X, leftLowerLegPos.Y)
                        skeletonLines[8].Visible = true
                    end

                    if character:FindFirstChild("RightLowerLeg") then
                        local rightLowerLegPos = Camera:WorldToViewportPoint(character.RightLowerLeg.Position)
                        skeletonLines[9].From = Vector2.new(rightLegPos.X, rightLegPos.Y)
                        skeletonLines[9].To = Vector2.new(rightLowerLegPos.X, rightLowerLegPos.Y)
                        skeletonLines[9].Visible = true
                    end
                else
                    for _, line in pairs(skeletonLines) do
                        line.Visible = false
                    end
                    for _, point in pairs(skeletonPoints) do
                        point.Visible = false
                    end
                end
            else
                for _, line in pairs(skeletonLines) do
                    line.Visible = false
                end
                for _, point in pairs(skeletonPoints) do
                    point.Visible = false
                end
            end
        else
            box.Visible = false
            healthBar.Visible = false
            healthBarBackground.Visible = false
            healthBarBorder.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            weaponText.Visible = false
            tracer.Visible = false
            arrow.Visible = false
            for _, line in pairs(skeletonLines) do
                line.Visible = false
            end
            for _, point in pairs(skeletonPoints) do
                point.Visible = false
            end
        end
    end)
end

local radar = Drawing.new("Circle")
radar.Visible = false
radar.Color = Color3.new(1, 1, 1)
radar.Thickness = 2
radar.Filled = false
radar.Radius = 100
radar.Position = Vector2.new(Camera.ViewportSize.X - 120, 120)

local radarCenter = Drawing.new("Circle")
radarCenter.Visible = false
radarCenter.Color = Color3.new(1, 1, 1)
radarCenter.Thickness = 2
radarCenter.Filled = true
radarCenter.Radius = 3
radarCenter.Position = radar.Position

local radarDirection = Drawing.new("Line")
radarDirection.Visible = false
radarDirection.Color = Color3.new(1, 1, 1)
radarDirection.Thickness = 2

local radarGridLines = {}
for i = 1, 4 do
    radarGridLines[i] = Drawing.new("Line")
    radarGridLines[i].Visible = false
    radarGridLines[i].Color = Color3.new(0.5, 0.5, 0.5)
    radarGridLines[i].Thickness = 1
end

local radarRangeText = Drawing.new("Text")
radarRangeText.Visible = false
radarRangeText.Color = Color3.new(1, 1, 1)
radarRangeText.Size = 14
radarRangeText.Font = Drawing.Fonts.Monospace
radarRangeText.Outline = true
radarRangeText.OutlineColor = Color3.new(0, 0, 0)
radarRangeText.Text = "100m"

local radarPlayers = {}

local function updateRadar()
    if not getgenv().ShowRadar then
        radar.Visible = false
        radarCenter.Visible = false
        radarDirection.Visible = false
        radarRangeText.Visible = false
        
        for _, line in pairs(radarGridLines) do
            line.Visible = false
        end
        
        for _, player in pairs(radarPlayers) do
            if player.dot then player.dot.Visible = false end
            if player.direction then player.direction.Visible = false end
            if player.name then player.name.Visible = false end
        end
        return
    end

    radar.Visible = true
    radarCenter.Visible = true
    radarDirection.Visible = true
    radarRangeText.Visible = true
    
    radarRangeText.Position = Vector2.new(radar.Position.X, radar.Position.Y + radar.Radius + 5)
    
    for i = 1, 4 do
        local angle = (i-1) * math.pi / 2
        radarGridLines[i].From = radar.Position
        radarGridLines[i].To = Vector2.new(
            radar.Position.X + math.cos(angle) * radar.Radius,
            radar.Position.Y + math.sin(angle) * radar.Radius
        )
        radarGridLines[i].Visible = true
    end
    
    radarDirection.From = radar.Position
    radarDirection.To = Vector2.new(radar.Position.X, radar.Position.Y - radar.Radius)

    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer then
            local rootPart = player.Character.HumanoidRootPart
            local relativePosition = rootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position
            
            local radarX = radar.Position.X + (relativePosition.X / 10)
            local radarY = radar.Position.Y + (relativePosition.Z / 10)
            
            local distanceFromCenter = math.sqrt((radarX - radar.Position.X)^2 + (radarY - radar.Position.Y)^2)
            
            if distanceFromCenter > radar.Radius then
                local angle = math.atan2(radarY - radar.Position.Y, radarX - radar.Position.X)
                radarX = radar.Position.X + math.cos(angle) * radar.Radius
                radarY = radar.Position.Y + math.sin(angle) * radar.Radius
            end
            
            if not radarPlayers[player] then
                radarPlayers[player] = {
                    dot = Drawing.new("Circle"),
                    direction = Drawing.new("Line"),
                    name = Drawing.new("Text")
                }
                
                radarPlayers[player].dot.Thickness = 1
                radarPlayers[player].dot.Filled = true
                radarPlayers[player].dot.Radius = 4
                
                radarPlayers[player].direction.Thickness = 2
                radarPlayers[player].direction.Visible = true
                
                radarPlayers[player].name.Size = 12
                radarPlayers[player].name.Font = Drawing.Fonts.Monospace
                radarPlayers[player].name.Outline = true
                radarPlayers[player].name.OutlineColor = Color3.new(0, 0, 0)
            end
            
            if player.Team == LocalPlayer.Team then
                radarPlayers[player].dot.Color = Color3.new(0, 1, 0)  
                radarPlayers[player].direction.Color = Color3.new(0, 0.8, 0)
                radarPlayers[player].name.Color = Color3.new(0, 1, 0)
            else
                radarPlayers[player].dot.Color = Color3.new(1, 0, 0) 
                radarPlayers[player].direction.Color = Color3.new(1, 0, 0)
                radarPlayers[player].name.Color = Color3.new(1, 0, 0)
            end
            
            radarPlayers[player].dot.Position = Vector2.new(radarX, radarY)
            radarPlayers[player].dot.Visible = true
            
            local lookVector = rootPart.CFrame.LookVector
            local directionLength = 10
            radarPlayers[player].direction.From = Vector2.new(radarX, radarY)
            radarPlayers[player].direction.To = Vector2.new(
                radarX + lookVector.X * directionLength,
                radarY + lookVector.Z * directionLength
            )
            
            radarPlayers[player].name.Position = Vector2.new(radarX, radarY - 15)
            radarPlayers[player].name.Text = player.Name
            radarPlayers[player].name.Visible = distanceFromCenter <= radar.Radius
        elseif radarPlayers[player] then
            radarPlayers[player].dot.Visible = false
            radarPlayers[player].direction.Visible = false
            radarPlayers[player].name.Visible = false
        end
    end
    
    for player, components in pairs(radarPlayers) do
        if not Players:FindFirstChild(player.Name) then
            components.dot.Visible = false
            components.direction.Visible = false
            components.name.Visible = false
            radarPlayers[player] = nil
        end
    end
end

RunService.RenderStepped:Connect(updateRadar)
RunService.RenderStepped:Connect(updatePlayerCount)
RunService.RenderStepped:Connect(updateFOV)

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        createESP(player)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if ESPComponents[player] then
        for _, component in pairs(ESPComponents[player]) do
            if typeof(component) == "table" then
                for _, drawing in pairs(component) do
                    drawing:Remove()
                end
            else
                component:Remove()
            end
        end
        ESPComponents[player] = nil
    end
end)

TabHandles.Q:Section({ Title = "ESP.1" })

Toggle = TabHandles.Q:Toggle({
    Title = "透视开启", 
    Value = false, 
    Callback = function(Value)
        getgenv().ESPEnabled = Value
    end
})

Toggle = TabHandles.Q:Toggle({
    Title = "模型透视", 
    Value = false, 
    Callback = function(Value)
        getgenv().ShowSkeleton = Value
    end
})

Toggle = TabHandles.Q:Toggle({
    Title = "方框透视", 
    Value = false, 
    Callback = function(Value)
        getgenv().ShowBox = Value
    end
})



Toggle = TabHandles.Q:Toggle({
    Title = "射线透视", 
    Value = false, 
    Callback = function(Value)
        getgenv().ShowTracer = Value
    end
})

Toggle = TabHandles.Q:Toggle({
    Title = "名字透视", 
    Value = false, 
    Callback = function(Value)
        getgenv().ShowName = Value
    end
})
-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =
-- ================  ================
getgenv().ESPEnabled = false -- Toggle ESP On/Off
getgenv().ShowBox = false -- Show bounding boxes
getgenv().ShowHealth = false -- Show health
getgenv().ShowName = false -- Show player names
getgenv().ShowDistance = false -- Show distance to players
getgenv().ShowTracer = false -- Show tracers
getgenv().TeamCheck = false -- Exclude teammates

-- Roblox Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Helper function to create ESP components
local function createESP(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = Color3.new(1, 1, 1)
    box.Thickness = 1
    box.Filled = false

    local healthText = Drawing.new("Text")
    healthText.Visible = false
    healthText.Color = Color3.new(0, 1, 0)
    healthText.Size = 16

    local nameText = Drawing.new("Text")
    nameText.Visible = false
    nameText.Color = Color3.new(1, 1, 1)
    nameText.Size = 16

    local distanceText = Drawing.new("Text")
    distanceText.Visible = false
    distanceText.Color = Color3.new(1, 1, 0)
    distanceText.Size = 16

    local tracer = Drawing.new("Line")
    tracer.Visible = false
    tracer.Color = Color3.new(1, 0, 0)
    tracer.Thickness = 1

    -- Update ESP dynamically
    RunService.RenderStepped:Connect(function()
        if not getgenv().ESPEnabled or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") or not player.Character:FindFirstChild("Humanoid") or player == LocalPlayer then
            box.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            tracer.Visible = false
            return
        end

        if getgenv().TeamCheck and player.Team == LocalPlayer.Team then
            box.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            tracer.Visible = false
            return
        end

        local character = player.Character
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")

        if rootPart and humanoid and humanoid.Health > 0 then
            local rootPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            local headPos, _ = Camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 3, 0))
            local legPos, _ = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))

            -- Box
            if getgenv().ShowBox and onScreen then
                box.Size = Vector2.new(1000 / rootPos.Z, headPos.Y - legPos.Y)
                box.Position = Vector2.new(rootPos.X - box.Size.X / 2, rootPos.Y - box.Size.Y / 2)
                box.Visible = true
            else
                box.Visible = false
            end

            -- Health
            if getgenv().ShowHealth and onScreen then
                healthText.Position = Vector2.new(rootPos.X, rootPos.Y - box.Size.Y / 2 - 20)
                healthText.Text = "血量: " .. math.floor(humanoid.Health)
                healthText.Visible = true
            else
                healthText.Visible = false
            end

            -- Name
            if getgenv().ShowName and onScreen then
                nameText.Position = Vector2.new(rootPos.X, rootPos.Y - box.Size.Y / 2 - 40)
                nameText.Text = "名字: " .. player.Name
                nameText.Visible = true
            else
                nameText.Visible = false
            end

            -- Distance
            if getgenv().ShowDistance and onScreen then
                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                distanceText.Position = Vector2.new(rootPos.X, rootPos.Y + box.Size.Y / 2 + 20)
                distanceText.Text = "距离: " .. math.floor(distance) .. " ㎝"
                distanceText.Visible = true
            else
                distanceText.Visible = false
            end

            -- Tracer
            if getgenv().ShowTracer then
                tracer.From = getgenv().TracerStart == "Bottom" and Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y) or Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                tracer.To = Vector2.new(rootPos.X, rootPos.Y)
                tracer.Visible = onScreen
            else
                tracer.Visible = false
            end
        else
            box.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            tracer.Visible = false
        end
    end)
end

-- Apply ESP to all players
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        createESP(player)
    end
end)
-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =
-- ================  ================
TabHandles.Q:Section({ Title = "ESP.2" })

TabHandles.Q:Paragraph({
    Title = "透视配置",
    Desc = "设置",
    Image = "save",
    ImageSize = 20,
    Color = "White"
})

Toggle = TabHandles.Q:Toggle({
    Title = "确定开启esp",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    getgenv().ESPEnabled = Value 
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "身体方框",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    getgenv().ShowBox = Value 
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "血量",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    getgenv().ShowHealth = Value 
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "用户名",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    getgenv().ShowName = Value
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "距离",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    getgenv().ShowDistance = Value 
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "天线",
    Desc = "",
    Locked = false,
    Callback = function(Value)
  getgenv().ShowTracer = Value 
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "团队判断",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    getgenv().TeamCheck = Value 
 end
})

-- ================  ================
-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =    












-- ================  ================
-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =

Button = TabHandles.ER:Button({
    Title = "加入极速传奇",
    Desc = "点击加载",
    Locked = false,
    Callback = function()
local game_id = 3101667897
        local game_url = "https://www.roblox.com/games/"..game_id
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.ER:Button({
    Title = "加入忍者传奇",
    Desc = "点击加载",
    Locked = false,
    Callback = function()
local game_id = 3956818381
        local game_url = "https://www.roblox.com/games/"..game_id
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.ER:Button({
    Title = "加入自然灾害生存游戏",
    Desc = "点击加载",
    Locked = false,
    Callback = function()
local game_id = 189707
        local game_url = "https://www.roblox.com/games/"..game_id
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.ER:Button({
    Title = "加入力量传奇",
    Desc = "点击加载",
    Locked = false,
    Callback = function()
local game_id = 3623096087
        local game_url = "https://www.roblox.com/games/"..game_id
        game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})


-- ================ UI自定义 ================
local Paragraph = TabHandles.SAN:Paragraph({
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

TabHandles.SAN:Colorpicker({
    Title = "颜色1",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(color) print("Selected color: " .. tostring(color)) end
})

TabHandles.SAN:Colorpicker({
    Title = "颜色2",
    Default = Color3.fromRGB(0, 0, 255),
    Transparency = 0,
    Callback = function(color) print("Background color: " .. tostring(color)) end
})

