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

local Tabs = {
    Main = Window:Section({ Title = "巴掌", Opened = true }),
}

local TabHandles = {
    Q = Tabs.Main:Tab({ Title = "功能", Icon = "layout-grid" }),
    W = Tabs.Main:Tab({ Title = "防技能", Icon = "layout-grid" }),
}

Button = TabHandles.Q:Button({
    Title = "获取计数器手套",
    Desc = "",
    Locked = false,
    Callback = function()
fireclickdetector(game.Workspace.CounterLever.ClickDetector)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,100,0)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
wait(121)
for i,v in pairs(workspace.Maze:GetDescendants()) do
if v:IsA("ClickDetector") then
fireclickdetector(v)
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

Button = TabHandles.Q:Button({
    Title = "复古技能",
    Desc = "",
    Locked = false,
    Callback = function(Value)
RetroSpam = Value
while RetroSpam do
game:GetService("ReplicatedStorage").RetroAbility:FireServer(RetroAbility)
task.wait()
end
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Dropdown = TabHandles.Q:Dropdown({
    Title = "复古技能选择", 
    Values = {"Rocket Launcher","Ban Hammer","Bomb""}, 
    Value = "Alpha", 
    Callback = function(Value) 
RetroAbility = Value
    end
})

Toggle = TabHandles.Q:Toggle({
    Title = "获取炼金术师材料",
    Desc = "",
    Locked = false,
    Callback = function(Value)
AlchemistIngredients = Value
if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
while AlchemistIngredients do
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Mushroom")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Glowing Mushroom")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Fire Flower")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Winter Rose")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dark Root")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dire Flower")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Autumn Sprout")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Elder Wood")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Hazel Lily")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Wild Vine")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Jade Stone")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Lamp Grass")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Plane Flower")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blood Rose")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Red Crystal")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blue Crystal")
task.wait()
end
end
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM：",
            Content = state and "已开启" or "已关启",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "自动加入竞技场",
    Desc = "",
    Locked = false,
    Callback = function(Value)
AutoEnterArena = Value
while AutoEnterArena do
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
    end
task.wait()
end
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "自动光波球",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    if Person == nil then
Person = game.Players.LocalPlayer.Name
end
_G.RojoSpam = Value
while _G.RojoSpam do
game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players[Person].Character.HumanoidRootPart.CFrame})
task.wait()
end
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Button = TabHandles.Q:Button({
    Title = "Rojo技能",
    Desc = "",
    Locked = false,
    Callback = function(Value)
_G.RojoSpam = Value
game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Charge")
wait(6)
game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame})
task.wait()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "音符技能",
    Desc = "",
    Locked = false,
    Callback = function()
    _G.RhythmSpam = Value
while _G.RhythmSpam do
game:GetService("ReplicatedStorage").rhythmevent:FireServer("AoeExplosion",0)
task.wait()
end
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "Null技能",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    NullSpam = Value
while NullSpam do
game:GetService("ReplicatedStorage").NullAbility:FireServer()
task.wait()
end
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.W:Toggle({
    Title = "管理员预警(反管理员)",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    AntiAdmins = Value
while AntiAdmins do
for i,v in pairs(game.Players:GetChildren()) do
                    if v:GetRankInGroup(9950771) >= 2 then
AntiKick = false
                        game.Players.LocalPlayer:Kick("High Rank Player Detected.".." ("..v.Name..")")
                        break
                    end
                end
task.wait()
end
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.W:Toggle({
    Title = "防踢",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    AntiKick = Value
while AntiKick do
for i,v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetDescendants()) do
                    if v.Name == "ErrorPrompt" then
AK:Set(false)
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                    end
                end
task.wait()
end
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.W:Toggle({
    Title = "防击飞",
    Desc = "",
    Locked = false,
    Callback = function(Value)
    AntiRagdoll = Value
if AntiRagdoll then
game.Players.LocalPlayer.Character.Humanoid.Health = 0
game.Players.LocalPlayer.CharacterAdded:Connect(function()
game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Changed:Connect(function()
if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true and AntiRagdoll then
repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true
until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
game.Players.LocalPlayer.Character.Torso.Anchored = false
end
end)
end)
end
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.W:Toggle({
    Title = "反虚空(锦标赛也有效果)",
    Desc = "",
    Locked = false,
    Callback = function(Value)
game.Workspace.dedBarrier.CanCollide = Value
game.Workspace.TAntiVoid.CanCollide = Value
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.W:Toggle({
    Title = "防死亡屏障",
    Desc = "",
    Locked = false,
    Callback = function(Value)
if Value == true then
for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                    if v.ClassName == "Part" and v.Name == "BLOCK" then
                        v.CanTouch = false
                    end
                end
workspace.DEATHBARRIER.CanTouch = false
workspace.DEATHBARRIER2.CanTouch = false
workspace.dedBarrier.CanTouch = false
workspace.ArenaBarrier.CanTouch = false
workspace.AntiDefaultArena.CanTouch = false
else
for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                    if v.ClassName == "Part" and v.Name == "BLOCK" then
                        v.CanTouch = true
                    end
                end
workspace.DEATHBARRIER.CanTouch = true
workspace.DEATHBARRIER2.CanTouch = true
workspace.dedBarrier.CanTouch = true
workspace.ArenaBarrier.CanTouch = true
workspace.AntiDefaultArena.CanTouch = true
end    
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.W:Toggle({
    Title = "反巴西",
    Desc = "",
    Locked = false,
    Callback = function(Value)
if Value == true then
for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                        v.CanTouch = false
                end
else
for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                        v.CanTouch = true
                end
end    
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.W:Toggle({
    Title = "反死亡方块",
    Desc = "",
    Locked = false,
    Callback = function(Value)
if Value == true then
        workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
        else
                workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
        end    
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.W:Toggle({
    Title = "反上帝技能",
    Desc = "",
    Locked = false,
    Callback = function(Value)
AntiTimestop = Value
while AntiTimestop do
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.ClassName == "Part" then
                        v.Anchored = false
                    end
                end
task.wait()
end    
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.W:Toggle({
    Title = "反鱿鱼",
    Desc = "",
    Locked = false,
    Callback = function(Value)
AntiSquid = Value
if AntiSquid == false then
        game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = true
        end
while AntiSquid do
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SquidInk") then
        game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = false
end
task.wait()
end    
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.W:Toggle({
    Title = "反神圣杰克",
    Desc = "",
    Locked = false,
    Callback = function(Value)
game.Players.LocalPlayer.PlayerScripts.HallowJackAbilities.Disabled = Value    
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.W:Toggle({
    Title = "反传送带",
    Desc = "",
    Locked = false,
    Callback = function(Value)
game.Players.LocalPlayer.PlayerScripts.ConveyorVictimized.Disabled = Value    
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.W:Toggle({
    Title = "反板砖",
    Desc = "",
    Locked = false,
    Callback = function(Value)
AntiBrick = Value
while AntiBrick do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Union" then
                        v.CanTouch = false
                    end
                end
task.wait()
end    
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})

Toggle = TabHandles.W:Toggle({
    Title = "反Null",
    Desc = "",
    Locked = false,
    Callback = function(Value)
AntiNull = Value
while AntiNull do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Imp" and v:FindFirstChild("Body") then
shared.gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Body,true)
end
end
task.wait()
end    
-- = 开关显示 =
WindUI:Notify({
            Title = "HB FXM ：",
            Content = state and "(开)" or "(关)",
            Icon = state and "check" or "x",
            IconThemed = true, -- automatic color icon to theme 
            Duration = 5,
        })
 end
})