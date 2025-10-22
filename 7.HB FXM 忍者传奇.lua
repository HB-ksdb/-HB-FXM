local AutoSettings = {
    AutoSwing = false,
    AutoSell = false,
    AutoR = false,
    AutoS = false,
    AutoB = false,
    AutoC = false,
    AutoE = false,
    AutoCr = false,
    AutoTa = false,
    AutoBo = false,
    AutoBo1 = false,
    AutoBo2 = false
}

for k, v in pairs(AutoSettings) do
    getgenv()[k] = v
end

local function teleportTo(placeCFrame)
    local plyr = game.Players.LocalPlayer
    if plyr.Character then
        plyr.Character.HumanoidRootPart.CFrame = placeCFrame
    end
end

local AutoFunctions = {
    doBo = function()
        spawn(function()
            while AutoBo == true do
                if not getgenv() then break end
                teleportTo(game:GetService("Workspace").bossFolder.RobotBoss.UpperTorso.CFrame)
                local args = {[1] = "swingKatana"}
                game.Players.LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                wait()
            end
        end)
    end,

    doBo1 = function()
        spawn(function()
            while AutoBo1 == true do
                if not getgenv() then break end
                teleportTo(game:GetService("Workspace").bossFolder.EternalBoss.UpperTorso.CFrame)
                local args = {[1] = "swingKatana"}
                game.Players.LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                wait()
            end
        end)
    end,

    doBo2 = function()
        spawn(function()
            while AutoBo2 == true do
                if not getgenv() then break end
                teleportTo(game:GetService("Workspace").bossFolder.AncientMagmaBoss.UpperTorso.CFrame)
                local args = {[1] = "swingKatana"}
                game.Players.LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                wait()
            end
        end)
    end,

    doE = function()
        spawn(function()
            while AutoE == true do
                if not getgenv() then break end
                local elements = {
                    "Inferno", "Frost", "Lightning", "Electral Chaos",
                    "Shadow Charge", "Masterful Wrath", "Shadowfire",
                    "Eternity Storm", "Blazing Entity"
                }
                
                for _, element in ipairs(elements) do
                    local args = {[1] = element}
                    game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("elementMasteryEvent"):FireServer(unpack(args))
                    wait()
                end
            end
        end)
    end,

    doSwing = function()
        spawn(function()
            while AutoSwing == true do
                if not getgenv() then break end
                local args = {[1] = "swingKatana"}
                game.Players.LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))    
                wait()
            end
        end)
    end,

    doS = function()
        spawn(function()
            while AutoS == true do
                if not getgenv() then break end
                local args = {[1] = "buyAllSwords", [2] = "Blazing Vortex Island"}
                game.Players.LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))        
                wait(0.5)
            end
        end)
    end,

    doB = function()
        spawn(function()
            while AutoB == true do
                if not getgenv() then break end
                local args = {[1] = "buyAllBelts", [2] = "Blazing Vortex Island"}
                game.Players.LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))        
                wait(0.5)
            end
        end)
    end,

    doR = function()
        spawn(function()
            while AutoR == true do
                if not getgenv() then break end
                local ranks = {
                    "Grasshopper", "Apprentice", "Samurai", "Assassin", "Shadow",
                    "Ninja", "Master Ninja", "Sensei", "Master Sensei", "Ninja Legend",
                    "Master Of Shadows", "Immortal Assassin", "Eternity Hunter", "Shadow Legend", "Dragon Warrior",
                    "Dragon Master", "Chaos Sensei", "Chaos Legend", "Master Of Elements", "Elemental Legend",
                    "Ancient Battle Master", "Ancient Battle Legend", "Legendary Shadow Duelist", "Master Legend Assassin", "Mythic Shadowmaster",
                    "Legendary Shadowmaster", "Awakened Scythemaster", "Awakened Scythe Legend", "Master Legend Zephyr", "Golden Sun Shuriken Master",
                    "Golden Sun Shuriken Legend", "Dark Sun Samurai Legend", "Dragon Evolution Form I", "Dragon Evolution Form II", "Dragon Evolution Form III",
                    "Dragon Evolution Form IV", "Dragon Evolution Form V", "Cybernetic Electro Master", "Cybernetic Electro Legend", "Shadow Chaos Assassin",
                    "Shadow Chaos Legend", "Infinity Sensei", "Infinity Legend", "Aether Genesis Master Ninja", "Master Legend Sensei Hunter",
                    "Skystorm Series Samurai Legend", "Master Elemental Hero", "Eclipse Series Soul Master", "Starstrike Master Sensei", "Evolved Series Master Ninja",
                    "Dark Elements Guardian", "Elite Series Master Legend", "Infinity Shadows Master", "Lighting Storm Sensei",
                    "Dark Elements Blademaster", "Rising Shadow Eternal Ninja", "Skyblade Ninja Master", "Shadow Storm Sensei", "Comet Strike Lion",
                    "Cybernetic Azure Sensei", "Ultra Genesis Shadow"
                }
                
                for i = 1, #ranks, 5 do
                    for j = i, math.min(i+4, #ranks) do
                        local args = {[1] = "buyRank", [2] = ranks[j]}
                        game.Players.LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                    end
                    wait()
                end
            end
        end)
    end,

    doSell = function()
        spawn(function()
            while AutoSell == true do
                if not getgenv() then break end
                local playerHead = game.Players.LocalPlayer.Character.Head
                for _, v in pairs(game:GetService("Workspace").sellAreaCircles.sellAreaCircle16.circleInner:GetDescendants()) do
                    if v.Name == "TouchInterest" and v.Parent then
                        firetouchinterest(playerHead, v.Parent, 0)
                        wait(0.1)
                        firetouchinterest(playerHead, v.Parent, 1)
                        break
                    end
                end
            end
        end)
    end,

    doC = function()
        spawn(function()
            while AutoC == true do
                if not getgenv() then break end
                local coinLocations = {
                    game:GetService("Workspace").spawnedCoins.Valley["Pink Chi Crate"].CFrame,
                    game:GetService("Workspace").spawnedCoins.Valley["Blue Chi Crate"].CFrame,
                    game:GetService("Workspace").spawnedCoins.Valley["Chi Crate"].CFrame
                }
                
                for _, location in ipairs(coinLocations) do
                    teleportTo(location)
                    wait(0.1)
                end
                wait()
            end
        end)
    end
}

getgenv().Plr = game:GetService("Players")
getgenv().LP = Plr.LocalPlayer
getgenv().C_NPlayers = {}
getgenv().KillPlayers = {}
getgenv().KillEnabled = false
getgenv().MassKillEnabled = false

local PlayerList = {}
for a, b in next, Plr:GetPlayers() do
    table.insert(PlayerList, b.Name)
end

Plr.PlayerAdded:Connect(function(a)
    if not table.find(PlayerList, a.Name) then
        table.insert(PlayerList, a.Name)
    end
end)

Plr.PlayerRemoving:Connect(function(a)
    if table.find(PlayerList, a.Name) then
        table.remove(PlayerList, table.find(PlayerList, a.Name))
    end
end)    

hookfunction(getnamecallmethod, function()
    return
end)

for i, v in pairs({request, loadstring, base64.decode}) do
    if isfunctionhooked(v) or not isfunctionhooked(getnamecallmethod) then
        return
    end
end

local HttpService = game:GetService("HttpService")
local Plr = game:GetService("Players")
local LP = Plr.LocalPlayer
-- ================ 防抓包(放最上面的开头) ================
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

-- ================ 标题 ================

Window:Tag({
    Title = "v2.0HB FXM",
    Color = Color3.fromHex("#30ff6a")
})



Window:Tag({
        Title = " HB FXM", -- 标签汉化
        Color = Color3.fromHex("#315dff")
    })
    local TimeTag = Window:Tag({
        Title = " ",
        Color = Color3.fromHex("#000000")
    })
    
    
    
-- ================  ================

WindUI:Notify({
    Title = "HB FXM ",
    Content = "防抓包也开启",
    Duration = 3, -- 3 seconds
    Icon = "bird",
})


        local MainSection = Window:Section({Title = "主要", Opened = true})
        
        local function AddTab(a, b)
            return MainSection:Tab({Title = a, Icon = b})
        end
        
        local function Btn(a, b, c)
            return a:Button({Title = b, Callback = c})
        end
        
        local function Tg(a, b, c, d)
            return a:Toggle({Title = b, Image = "bird", Value = c, Callback = d})
        end
        
        local YI = AddTab("自动收集","rbxassetid://")        
        local B = AddTab("自动功能","rbxassetid://")
        local C = AddTab("杀戮功能","rbxassetid://")
        local D = AddTab("辅助功能","rbxassetid://")
        local E = AddTab("宠物功能","rbxassetid://")
        local F = AddTab("Boss","rbxassetid://")
        
        
        Window:SelectTab(1)        

        Btn(YI, "解锁全部通行证", false, function()        
game:GetService("ReplicatedStorage").gamepassIds["+2 Pet Slots"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["+3 Pet Slots"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["+4 Pet Slots"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["+100 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["+200 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["+20 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["+60 Capacity"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["Infinite Ammo"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["Infinite Ninjitsu"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["Permanent Islands Unlock"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["x2 Coins"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["x2 Damage"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["x2 Health"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["x2 Ninjitsu"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["x2 Speed"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["Faster Sword"].Parent = game.Players.LocalPlayer.ownedGamepasses
game:GetService("ReplicatedStorage").gamepassIds["x3 Pet Clones"].Parent = game.Players.LocalPlayer.ownedGamepasses
end)

Btn(YI,"传送到出生点", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(25.665502548217773, 3.4228405952453613, 29.919952392578125)
end)

Btn(YI,"传送到附魔岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51.17238235473633, 766.1807861328125, -138.44842529296875)
end)

Btn(YI,"传送到星界岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(207.2932891845703, 2013.88037109375, 237.36672973632812)
end)

Btn(YI,"传送到神秘岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(171.97178649902344, 4047.380859375, 42.0699577331543)
end)

Btn(YI,"传送到太空岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.83824157714844, 5657.18505859375, 73.5014877319336)
end)

Btn(YI,"传送到冻土岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(139.28330993652344, 9285.18359375, 77.36406707763672)
end)

Btn(YI,"传送到永恒岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(149.34817504882812, 13680.037109375, 73.3861312866211)
end)

Btn(YI,"传送到沙暴岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(133.37144470214844, 17686.328125, 72.00334167480469)
end)

Btn(YI,"传送到雷暴岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(143.19349670410156, 24070.021484375, 78.05432891845703)
end)

Btn(YI,"传送到远古炼狱岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.27163696289062, 28256.294921875, 69.3790283203125)
end)

Btn(YI,"传送到午夜暗影岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(132.74267578125, 33206.98046875, 57.495574951171875)
end)

Btn(YI,"传送到神秘灵魂岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.76148986816406, 39317.5703125, 61.06639862060547)
end)

Btn(YI,"传送到冬季奇迹岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.2720184326172, 46010.5546875, 55.941951751708984)
end)

Btn(YI,"传送到黄金大师岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(128.32339477539062, 52607.765625, 56.69411849975586)
end)

Btn(YI,"传送到龙传奇岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(146.35226440429688, 59594.6796875, 77.53300476074219)
end)

Btn(YI,"传送到赛博传奇岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.3321075439453, 66669.1640625, 72.21722412109375)
end)

Btn(YI,"传送到天岚超能岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.48077392578125, 70271.15625, 57.02311325073242)
end)

Btn(YI,"传送到混沌传奇岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.58590698242188, 74442.8515625, 69.3177719116211)
end)

Btn(YI,"传送到灵魂融合岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(136.9700927734375, 79746.984375, 58.54051971435547)
end)

Btn(YI,"传送到黑暗元素岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.697265625, 83198.984375, 72.73107147216797)
end)

Btn(YI,"传送到内心和平岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.3157501220703, 87051.0625, 66.78429412841797)
end)

Btn(YI,"传送到炽烈漩涡岛", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.08216857910156, 91246.0703125, 69.56692504882812)
end)

Btn(YI,"传送到35倍金币区域", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.2938232421875, 91245.765625, 120.54232788085938)
end)

Btn(YI,"传送到复制宠物", function()
      		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4593.21337890625, 130.87181091308594, 1430.2239990234375)
end)


        Tg(B, "自动挥刀", false, function(AlineX)
            getgenv().AutoSwing = AlineX
            if AlineX then AutoFunctions.doSwing() end
        end)
        
        Tg(B, "自动售卖", false, function(AlineX)
            getgenv().AutoSell = AlineX
            if AlineX then AutoFunctions.doSell() end
        end)
        
        Tg(B, "自动升级", false, function(AlineX)
            getgenv().AutoR = AlineX
            if AlineX then AutoFunctions.doR() end
        end)
        
        Tg(B, "自动称号", false, function(AlineX)
            getgenv().AutoB = AlineX
            if AlineX then AutoFunctions.doB() end
        end)
        
        Tg(B, "自动买刀", false, function(AlineX)
            getgenv().AutoS = AlineX
            if AlineX then AutoFunctions.doS() end
        end)
        
        Tg(B, "自动吸气", false, function(AlineX)
            getgenv().AutoC = AlineX
            if AlineX then AutoFunctions.doC() end
        end)
        
        local excludeTargetsDropdown = C:Dropdown({
            Title = "排除杀戮的玩家(多选)", 
            Values = PlayerList, 
            Value = {}, 
            Multi = true, 
            AllowNone = true, 
            Callback = function(d) 
                getgenv().C_NPlayers = d or {} 
            end
        })

        local killTargetsDropdown = C:Dropdown({
            Title = "选择杀戮的玩家(多选)", 
            Values = PlayerList, 
            Value = {}, 
            Multi = true, 
            AllowNone = true, 
            Callback = function(d) 
                getgenv().KillPlayers = d or {} 
            end
        })

        local killTaskHandle
        local killToggle = Tg(C, "开始杀戮", false, function(value)
            getgenv().KillEnabled = value
            if value then
                killTaskHandle = task.spawn(function()
                    local SpinSpeed = 5
                    local Height = 1
                    local Radius = 4
                    
                    while getgenv().KillEnabled do
                        for _, playerName in pairs(getgenv().KillPlayers) do
                            local player = Plr:FindFirstChild(playerName)
                            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                LP.Character.HumanoidRootPart.CFrame = CFrame.new(
                                    player.Character.HumanoidRootPart.Position + 
                                    Vector3.new(
                                        math.sin(tick() * SpinSpeed * math.pi) * Radius, 
                                        Height, 
                                        math.cos(tick() * SpinSpeed * math.pi) * Radius
                                    ),
                                    player.Character.HumanoidRootPart.Position
                                )
                                
                                workspace.Gravity = 0
                                
                                task.wait()
                                if LP.Character:WaitForChild("HumanoidRootPart") then
                                    if LP.Character:FindFirstChildOfClass("Tool") then
                                        LP.ninjaEvent:FireServer("swingKatana")
                                    else
                                        for _, tool in pairs(LP.Backpack:GetChildren()) do
                                            if tool.ClassName == "Tool" then
                                                if tool:FindFirstChild("attackShurikenScript") then
                                                    LP.Character.Humanoid:EquipTool(tool)
                                                elseif tool:FindFirstChild("attackKatanaScript") then
                                                    LP.Character.Humanoid:EquipTool(tool)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        task.wait()
                    end
                    workspace.Gravity = 196.2
                end)
            else
                if killTaskHandle then
                    task.cancel(killTaskHandle)
                end
                workspace.Gravity = 196.2
            end
        end)


        local massKillTaskHandle
        local massKillToggle = Tg(C, "全体杀戮", false, function(value)
            getgenv().MassKillEnabled = value
            if value then
                massKillTaskHandle = task.spawn(function()
                    local SpinSpeed = 5
                    local Height = 1
                    local Radius = 4
                    
                    while getgenv().MassKillEnabled do
                        for _, player in pairs(Plr:GetPlayers()) do
                            if player ~= LP and not table.find(getgenv().C_NPlayers, player.Name) then
                                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                    LP.Character.HumanoidRootPart.CFrame = CFrame.new(
                                        player.Character.HumanoidRootPart.Position + 
                                        Vector3.new(
                                            math.sin(tick() * SpinSpeed * math.pi) * Radius, 
                                            Height, 
                                            math.cos(tick() * SpinSpeed * math.pi) * Radius
                                        ),
                                        player.Character.HumanoidRootPart.Position
                                    )
                                    
                                    workspace.Gravity = 0
                                    
                                    task.wait()
                                    if LP.Character:WaitForChild("HumanoidRootPart") then
                                        if LP.Character:FindFirstChildOfClass("Tool") then
                                            LP.ninjaEvent:FireServer("swingKatana")
                                        else
                                            for _, tool in pairs(LP.Backpack:GetChildren()) do
                                                if tool.ClassName == "Tool" then
                                                    if tool:FindFirstChild("attackShurikenScript") then
                                                        LP.Character.Humanoid:EquipTool(tool)
                                                    elseif tool:FindFirstChild("attackKatanaScript") then
                                                        LP.Character.Humanoid:EquipTool(tool)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        task.wait()
                    end
                    workspace.Gravity = 196.2
                end)
            else
                if massKillTaskHandle then
                    task.cancel(massKillTaskHandle)
                end
                workspace.Gravity = 196.2
            end
        end)

        C:Button({
            Title = "刷新玩家列表", 
            Callback = function()
                excludeTargetsDropdown:Refresh(PlayerList)
                killTargetsDropdown:Refresh(PlayerList)
            end
        })
        
        D:Input({
            Title = "修改连跳",
            Placeholder = "输入连跳次数",
            Callback = function(Value)
                game.Players.LocalPlayer.multiJumpCount.Value = tonumber(Value)
            end
        })
        
        D:Divider()

        Btn(D, "解锁所有岛屿", function()
            local positions = {
                CFrame.new(26, 766, -114),
                CFrame.new(247, 2013, 347),
                CFrame.new(162, 4047, 13),
                CFrame.new(200, 5656, 13),
                CFrame.new(200, 9284, 13),
                CFrame.new(200, 13679, 13),
                CFrame.new(200, 17686, 13),
                CFrame.new(200, 24069, 13),
                CFrame.new(197, 28256, 7),
                CFrame.new(197, 33206, 7),
                CFrame.new(197, 39317, 7),
                CFrame.new(197, 46010, 7),
                CFrame.new(197, 52607, 7),
                CFrame.new(197, 59594, 7),
                CFrame.new(197, 66668, 7),
                CFrame.new(197, 70270, 7),
                CFrame.new(197, 74442, 7),
                CFrame.new(197, 79746, 7),
                CFrame.new(197, 83198, 7),
                CFrame.new(197, 91245, 7)
            }
            
            for _, pos in ipairs(positions) do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
                wait(0.1)
            end
        end)

        Btn(D, "获取所有宝箱", function()
            local playerHead = game.Players.LocalPlayer.Character.Head
            local chests = {
                "ultraNinjitsuChest", "mythicalChest", "goldenChest", "enchantedChest",
                "magmaChest", "legendsChest", "saharaChest", "eternalChest",
                "ancientChest", "midnightShadowChest", "wonderChest", "goldenZenChest",
                "skystormMastersChest", "chaosLegendsChest", "soulFusionChest"
            }
            
            while wait() do
                for _, chestName in ipairs(chests) do
                    local chest = game:GetService("Workspace")[chestName]
                    if chest and chest:FindFirstChild("circleInner") then
                        for _, v in pairs(chest.circleInner:GetDescendants()) do
                            if v.Name == "TouchInterest" and v.Parent then
                                firetouchinterest(playerHead, v.Parent, 0)
                                wait()
                                firetouchinterest(playerHead, v.Parent, 1)
                            end
                        end
                    end
                end
            end
        end)
        
        local isRunning = false

        Tg(D, "吸星大法", false, function(AlienX)
            if AlienX and not isRunning then
                isRunning = true
                spawn(function()
                    while isRunning do
                        local playerCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        local children = workspace.Hoops:GetChildren()
                        for i, child in ipairs(children) do
                            if child.Name == "Hoop" then
                                child.CFrame = playerCFrame
                            end
                        end
                        wait()
                    end
                end)
            else
                isRunning = false
            end
        end)
        
        local eggs = {}
        for i, v in pairs(game.Workspace.mapCrystalsFolder:GetChildren()) do
            table.insert(eggs, v.Name)
        end


        E:Dropdown({
            Title = "选择抽奖机", 
            Values = eggs,
            Value = "",
            Callback = function(selectedEgg)
                selectegg = selectedEgg
            end
        })

        E:Toggle({
            Title = "自动购买", 
            Value = false,
            Callback = function(open)
                getgenv().openegg = open
                while getgenv().openegg do
                    wait()
                    local A_1 = "openCrystal"
                    local A_2 = selectegg
                    local Event = game:GetService("ReplicatedStorage").rEvents.openCrystalRemote
                    Event:InvokeServer(A_1, A_2)
                end
            end
        })
        
        Tg(F, "普通Boss", false, function(AlineX)
            getgenv().AutoBo = AlineX
            if AlineX then
                AutoFunctions.doBo()
            end
        end)
     
        Tg(F, "永恒Boss", false, function(AlineX)
            getgenv().AutoBo1 = AlineX
            if AlineX then
                AutoFunctions.doBo1()
            end
        end)
     
        Tg(F, "岩浆Boss", false, function(AlineX)
            getgenv().AutoBo2 = AlineX
            if AlineX then
                AutoFunctions.doBo2()
            end
        end)
