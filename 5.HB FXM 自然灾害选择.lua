addRainbowTitleToLocalPlayer(LP, "HBFXM自然灾害")
-- ================  ================
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- ================  ================
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
        
        
        
-- ================  ================       
-- ================  ================
local Window = WindUI:CreateWindow({
        Title = " 越 HB<font color='#00FF00'>1.5</font>",
        Icon = "rbxassetid://4483362748",
        IconTransparency = 0.5,
        IconThemed = true,
        Author = "作者:HB",
        Folder = "CloudHub",
        Size = UDim2.fromOffset(400, 300),
        Transparent = true,
        Theme = "Light",
        User = {
            Enabled = true,
            Callback = function() print("clicked") end,
            Anonymous = false
        },
        SideBarWidth = 200,
        ScrollBarEnabled = true,
        Background = "rbxassetid://96291371536118"
    })
    

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
        Title = "自然灾害",
        Color = Color3.fromHex("#000000")
    })
-- ================  ================    
-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =    
    
    
    
    
    
    
    
    
-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =-- =  =    
-- ================  ================
game:GetService("StarterGui"):SetCore("SendNotification",{ 
    Title = "HB FXM 保护中...", 
    Text = "请避免使用链接抓包脚本", 
    Duration = 1
})

spawn(function()
    while true do
        wait(1.5) 
        
        pcall(function()
            getgenv().rconsoletitle = nil
            getgenv().rconsoleprint = nil
            getgenv().rconsolewarn = nil
            getgenv().rconsoleinfo = nil
            getgenv().rconsolerr = nil
            getgenv().clonefunction = function(...) while true do end return end
            
            for _, child in pairs(game.CoreGui:GetChildren()) do
                if string.lower(child.Name) == 'devconsolemaster' then
                    game.Players.LocalPlayer:Kick("bro don't do that")
                    game:Shutdown()
                    while true do end
                    child:Destroy()
                end
            end
        end)
    end
end)

spawn(function()
    pcall(function()
    hookfunction(print, function(...)
        game.Players.LocalPlayer:Kick("bro don't do that")
        game:Shutdown()
        while true do end
        return
    end)
    hookfunction(warn, function(...)
        game.Players.LocalPlayer:Kick("bro don't do that")
        game:Shutdown()
        while true do end
        return
    end)
    hookfunction(error, function(...)
        game.Players.LocalPlayer:Kick("bro don't do that")
        game:Shutdown()
        while true do end
        return
    end)

    
hookfunction(print, function(a)
    if string.find(a:lower(), "http") then
        game.Players.LocalPlayer:Kick("bro don't do that")
        game:Shutdown()
        while true do end
    end
end)
hookfunction(warn, function(a)
    if string.find(a:lower(), "http") then
        game.Players.LocalPlayer:Kick("bro don't do that")
        game:Shutdown()
        while true do end
    end
end)
hookfunction(error, function(a)
    if string.find(a:lower(), "http") then
        game.Players.LocalPlayer:Kick("bro don't do that")
        game:Shutdown()
        while true do end
    end
end)
        
     local oldwrite
        oldwrite = hookfunction(writefile, function(file, content)
            if(string.find(string.lower(content), 'http') or string.find(string.lower(content), '//') or string.find(string.lower(content), 'https://discord.com/api/webhooks/')) then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return
            end
        
            return oldwrite(file, content)
        end)
        local oldappend
        oldappend = hookfunction(appendfile, function(file, content)
            if(string.find(string.lower(content), 'http') or string.find(string.lower(content), '//') or string.find(string.lower(content), 'https://discord.com/api/webhooks/')) then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return
            end
            return oldappend(file, content)
        end)
        game.DescendantAdded:Connect(function(c)
            if c and c:IsA('TextLabel') or c:IsA('TextButton') or c:IsA('Message') then
                if string.find(string.lower(c.Text), 'http') then
                    game.Players.LocalPlayer:Kick("bro don't do that")
                    game:Shutdown()
                    while true do end
                    c:Destroy()
                end
            end
        end)
        getgenv().rconsoletitle = nil
        getgenv().rconsoleprint = nil
        getgenv().rconsolewarn = nil
        getgenv().rconsoleinfo = nil
        getgenv().rconsolerr = nil
        getgenv().clonefunction = function(...) while true do end return end
        game.CoreGui.ChildAdded:Connect(function(c)
            if(string.lower(c.Name) == 'devconsolemaster') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                c:Destroy()
            end
        end)
        local oldNamecall
        oldNamecall = hookmetamethod(game, '__namecall', newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if(string.lower(method) == 'rconsoleprint') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return 
            end
            if(string.lower(method) == 'rconsoleinfo') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return 
            end
            if(string.lower(method) == 'rconsolewarn') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return 
            end
            if(string.lower(method) == 'rconsoleerr') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return
            end
            if(string.lower(method) == 'warn') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return
            end
            if(string.lower(method) == 'error') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return
            end
            if(string.lower(method) == 'rendernametag') then
                game.Players.LocalPlayer:Kick("bro don't do that")
                game:Shutdown()
                while true do end
                return 
            end
            return oldNamecall(self, ...)
        end))
        end)
    end)
-- ================  ================    

local Tabs = {
    Main = Window:Section({ Title = "自然灾害", Opened = true }),
}

local TabHandles = {
    Q = Tabs.Main:Tab({ Title = "功能", Icon = "layout-grid" }),
}

Button = TabHandles.Q:Button({
    Title = "HB FXM通用脚本",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/HB-ksdb/-4/main/%E4%B8%BB%E8%84%9A%E6%9C%AC.txt",true))()
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})
TabHandles.Q:Divider()
local nextdis
Toggle = TabHandles.Q:Toggle({
    Title = "预测灾害",
    Desc = "点击加载",
    Locked = false,
    Callback = function(val)
		nextdis = val

		while wait(1) and nextdis do
			local SurvivalTag = plr.Character:FindFirstChild("SurvivalTag")
			if SurvivalTag then
				if SurvivalTag.Value == "Blizzard" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：暴风雪"
				elseif SurvivalTag.Value == "Sandstorm" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：沙尘暴"
				elseif SurvivalTag.Value == "Tornado" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：龙卷风"
				elseif SurvivalTag.Value == "Volcanic Eruption" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：火山"
				elseif SurvivalTag.Value == "Flash Flood" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：洪水"
				elseif SurvivalTag.Value == "Deadly Virus" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：病毒"
				elseif SurvivalTag.Value == "Tsunami" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：海啸"
				elseif SurvivalTag.Value == "Acid Rain" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：酸雨"
				elseif SurvivalTag.Value == "Fire" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：火焰"
				elseif SurvivalTag.Value == "Meteor Shower" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：流星雨"
				elseif SurvivalTag.Value == "Earthquake" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：地震"
				elseif SurvivalTag.Value == "Thunder Storm" and nextdis then
					Message.Visible = true
					Message.Text = "下一个灾难是：暴风雨"
				else
					Message.Visible = false
				end
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
    Title = "指南针（可以用下面的地方显示不了地图）",
    Desc = "要使用的话就必须买指南针",
    Locked = false,
    Callback = function()
    
local p = game.Players.LocalPlayer
local r, c, h = game.ReplicatedStorage.Remotes.Compass, p.Backpack:WaitForChild("Compass"), p.Character:WaitForChild("Humanoid")
h:EquipTool(c)
task.wait()
r:FireServer("Vote Map", 3)
r:FireServer("Vote Map", 4)
task.wait()
h:UnequipTools()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.Q:Button({
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

Button = TabHandles.Q:Button({
    Title = "黑洞",
    Desc = "点击加载",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Super-ring-Parts-V6-28581"))()
        
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 3, -- 3 seconds
    Icon = "layout-grid",
})        
        
    end
})

Button = TabHandles.Q:Button({
    Title = "物理磁铁",
    Desc = "可以把下面的东西吸上来可以踩",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/6669178/main/%E5%8D%95%E4%B8%80%E7%89%A9%E4%BD%93%E9%A3%9E%E8%A1%8C%E8%BD%BD%E8%87%AA%E5%B7%B1%E6%9C%80%E7%BB%88%E4%BC%98%E5%8C%96%E7%89%88"))()       
        
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                                
    end
})

Button = TabHandles.Q:Button({
    Title = "无敌少侠",
    Desc = "用了它，你就会变成城市超人",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invinicible-Flight-R15-45414"))()
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.Q:Button({
    Title = "防止摔跤伤害",
    Desc = "就算掉下去了，也毫发无伤，掉到水里面也会死的",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/Fall-injury/main/防止摔落伤害"))()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "在水上行走",
    Desc = "点击加载",
    Locked = false,
    Callback = function(bool)
 if bool == false then do game.Workspace.WaterLevel.CanCollide = false
                            game.Workspace.WaterLevel.Size = Vector3.new(10, 1, 10)
                        end
                    end
                    if bool == true then do game.Workspace.WaterLevel.CanCollide = true
                            game.Workspace.WaterLevel.Size = Vector3.new(5000, 1, 5000)
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

Toggle = TabHandles.Q:Toggle({
    Title = "游戏岛悬崖碰撞",
    Desc = "点击加载",
    Locked = false,
    Callback = function(bool)
for i, v in pairs (game.workspace:GetDescendants())do
                                if v.Name == 'LowerRocks' then
                                    v.CanCollide = bool
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
    Title = "移除灾难界面(暴风雪和沙尘暴)",
    Desc = "",
    Locked = false,
    Callback = function()
game.Players.LocalPlayer.PlayerGui.BlizzardGui:destroy()
		game.Players.LocalPlayer.PlayerGui.SandStormGui:destroy()
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})