-- Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Configuration
local Config = {
    ESP = {
        Killer = false,
        Survivor = false,
        Generator = false,
        Gate = false,
        Hook = false,
        Pallet = false,
        Window = false,
        Pumpkin = false,
        ClosestHook = false,
        ShowOnlyClosestHook = false,
        ShowDistance = true,
        MaxDistance = 500
    },
    AutoFeatures = {
        AutoGenerator = false,
        GeneratorMode = "great",
        AutoLeaveGenerator = false,
        LeaveDistance = 15,
        LeaveKeybind = Enum.KeyCode.Q,
        AutoAttack = false,
        AttackRange = 10
    },
    Teleportation = {
        TeleportOffset = 3,
        SafeTeleport = true,
        TeleportDelay = 0.1
    },
    Performance = {
        UpdateRate = 0.5,
        UseDistanceCulling = true,
        MaxESPObjects = isMobile and 50 or 100, -- Lower for mobile
        DisableParticles = false,
        LowerGraphics = false,
        DisableShadows = false,
        ReduceRenderDistance = false
    },
    Mobile = {
        TouchControlsEnabled = isMobile,
        ButtonSize = 80,
        ButtonTransparency = 0.3,
        AutoOptimize = true,
        AggressiveOptimization = false
    }
}

-- Storage
local Highlights = {}
local BillboardGuis = {}
local LastUpdate = 0
local UpdateConnection = nil
local LeaveGeneratorConnection = nil
local AutoAttackConnection = nil
local ClosestHookHighlight = nil
local MobileUI = nil
local FPSCounterEnabled = false
local FPSCounterUI = nil

-- Helper Functions
local function notify(title, content, duration)
    local success = pcall(function()
        Rayfield:Notify({
            Title = title,
            Content = content,
            Duration = duration or 3,
            Image = 4483362458
        })
    end)
    

    if not success then
        warn(string.format("[%s] %s", title, content))
    end
end

local function safeCall(func, ...)
    local success, result = pcall(func, ...)
    if not success then
        return nil
    end
    return result
end

local function validateInstance(instance)
    return instance and typeof(instance) == "Instance" and instance.Parent ~= nil
end

local function isKiller()
    return LocalPlayer.Team and LocalPlayer.Team.Name == "Killer"
end

local function isSurvivor()
    return LocalPlayer.Team and LocalPlayer.Team.Name == "Survivors"
end

-- Performance Optimization Functions
local function applyMobileOptimizations()
    if not isMobile then return end
    
    local lighting = game:GetService("Lighting")
    local workspace = Workspace
    
    safeCall(function()
        -- Aggressive Graphics Reduction for Mobile
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        
        -- Disable expensive effects
        lighting.GlobalShadows = false
        lighting.FogEnd = 100
        lighting.Brightness = 2
        
        -- Reduce post-processing effects
        for _, effect in ipairs(lighting:GetChildren()) do
            if effect:IsA("PostEffect") then
                effect.Enabled = false
            end
        end
        
        -- Disable all particles and trails
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") then
                obj.Enabled = false
            elseif obj:IsA("Trail") then
                obj.Enabled = false
            elseif obj:IsA("Beam") then
                obj.Enabled = false
            elseif obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
                obj.Enabled = false
            end
        end
        
        -- Optimize streaming for mobile
        workspace.StreamingEnabled = true
        workspace.StreamingMinRadius = 32
        workspace.StreamingTargetRadius = 64
        
        -- Reduce terrain quality
        if workspace:FindFirstChild("Terrain") then
            workspace.Terrain.Decoration = false
        end
        
        -- Lower animation quality
        game:GetService("RunService"):Set3dRenderingEnabled(true)
    end)
end

local function applyAggressiveMobileOptimizations()
    if not isMobile then return end
    
    applyMobileOptimizations()
    
    safeCall(function()
        local workspace = Workspace
        
        -- Ultra-low graphics for maximum FPS
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level01
        settings().Rendering.EnableFRM = false
        
        -- Disable textures for performance (makes game look worse but much faster)
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Texture") or obj:IsA("Decal") then
                obj.Transparency = 1
            elseif obj:IsA("SurfaceAppearance") then
                obj.Parent = nil
            end
        end

        -- Disable ambient sounds
        safeCall(function()
            for _, sound in ipairs(workspace:GetDescendants()) do
                if sound:IsA("Sound") and sound.Name ~= "Music" then
                    sound.Volume = 0
                end
            end
        end)
        
        -- Optimize ESP update rate for mobile
        Config.Performance.UpdateRate = 1.0 -- Slower updates
        Config.Performance.MaxESPObjects = 25 -- Even fewer objects
    end)
end

local function applyPerformanceSettings()
    local lighting = game:GetService("Lighting")
    local workspace = Workspace
    
    if Config.Performance.DisableParticles then
        safeCall(function()
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
                    obj.Enabled = false
                end
            end
        end)
    end
    
    if Config.Performance.LowerGraphics then
        safeCall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end)
    end
    
    if Config.Performance.DisableShadows then
        safeCall(function()
            lighting.GlobalShadows = false
            lighting.FogEnd = 100
        end)
    end
    
    if Config.Performance.ReduceRenderDistance then
        safeCall(function()
            workspace.StreamingEnabled = true
            workspace.StreamingMinRadius = 32
            workspace.StreamingTargetRadius = 64
        end)
    end
end

local function resetPerformanceSettings()
    local lighting = game:GetService("Lighting")
    local workspace = Workspace
    
    safeCall(function()
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then
                obj.Enabled = true
            end
        end
        
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
        lighting.GlobalShadows = true
        lighting.FogEnd = 100000
        
        -- Re-enable post effects
        for _, effect in ipairs(lighting:GetChildren()) do
            if effect:IsA("PostEffect") then
                effect.Enabled = true
            end
        end
        
        -- Re-enable textures
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Texture") or obj:IsA("Decal") then
                obj.Transparency = 0
            end
        end
    end)
end


-- Mobile Touch Controls
local function createMobileControls()
    if not isMobile then return end
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MobileControls"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Leave Generator Button
    local leaveButton = Instance.new("TextButton")
    leaveButton.Name = "LeaveGenerator"
    leaveButton.Size = UDim2.new(0, Config.Mobile.ButtonSize, 0, Config.Mobile.ButtonSize)
    leaveButton.Position = UDim2.new(1, -100, 0.5, -40)
    leaveButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    leaveButton.BackgroundTransparency = Config.Mobile.ButtonTransparency
    leaveButton.Text = "LEAVE"
    leaveButton.TextColor3 = Color3.new(1, 1, 1)
    leaveButton.TextScaled = true
    leaveButton.Font = Enum.Font.GothamBold
    leaveButton.Parent = screenGui
    
    local leaveCorner = Instance.new("UICorner")
    leaveCorner.CornerRadius = UDim.new(0, 10)
    leaveCorner.Parent = leaveButton
    
    leaveButton.MouseButton1Click:Connect(function()
        leaveGenerator()
    end)
    
    -- Teleport to Closest Generator Button
    local tpButton = Instance.new("TextButton")
    tpButton.Name = "TeleportGen"
    tpButton.Size = UDim2.new(0, Config.Mobile.ButtonSize, 0, Config.Mobile.ButtonSize)
    tpButton.Position = UDim2.new(1, -100, 0.5, 60)
    tpButton.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    tpButton.BackgroundTransparency = Config.Mobile.ButtonTransparency
    tpButton.Text = "TP GEN"
    tpButton.TextColor3 = Color3.new(1, 1, 1)
    tpButton.TextScaled = true
    tpButton.Font = Enum.Font.GothamBold
    tpButton.Parent = screenGui
    
    local tpCorner = Instance.new("UICorner")
    tpCorner.CornerRadius = UDim.new(0, 10)
    tpCorner.Parent = tpButton
    
    tpButton.MouseButton1Click:Connect(function()
        local generators = getGeneratorsByDistance()
        if #generators > 0 then
            safeTeleport(generators[1].part.CFrame)
            notify("Teleported!", "Moved to closest generator", 2)
        end
    end)
    
    -- Attach to player's PlayerGui
    local success = pcall(function()
        screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end)
    
    if success then
        notify("Mobile Controls", "Touch controls enabled!", 3)
        MobileUI = screenGui
    end
end

-- FPS Counter
local function createFPSCounter()
    if FPSCounterUI then return end
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FPSCounter"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local frame = Instance.new("Frame")
    frame.Name = "FPSFrame"
    frame.Size = UDim2.new(0, 120, 0, 50)
    frame.Position = UDim2.new(0, 10, 0, 10)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.BackgroundTransparency = 0.3
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local fpsLabel = Instance.new("TextLabel")
    fpsLabel.Name = "FPSLabel"
    fpsLabel.Size = UDim2.new(1, 0, 1, 0)
    fpsLabel.BackgroundTransparency = 1
    fpsLabel.Text = "FPS: 0"
    fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    fpsLabel.TextStrokeTransparency = 0
    fpsLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    fpsLabel.Font = Enum.Font.GothamBold
    fpsLabel.TextSize = 18
    fpsLabel.Parent = frame
    -- Make it draggable
    local dragging = false
    local dragInput, mousePos, framePos
    
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            mousePos = input.Position
            framePos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            frame.Position = UDim2.new(
                framePos.X.Scale,
                framePos.X.Offset + delta.X,
                framePos.Y.Scale,
                framePos.Y.Offset + delta.Y
            )
        end
    end)
    
    -- FPS Calculation (updates every 1.5 seconds)
    local lastTime = tick()
    local frameCount = 0
    local fps = 0
    
    RunService.Heartbeat:Connect(function()
        if not FPSCounterEnabled then return end
        
        frameCount = frameCount + 1
        local currentTime = tick()
        local deltaTime = currentTime - lastTime
        
        -- Update every 1.5 seconds instead of 1 second
        if deltaTime >= 1.5 then
            fps = math.floor(frameCount / deltaTime)
            frameCount = 0
            lastTime = currentTime
            
            -- Color based on FPS
            if fps >= 60 then
                fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green
            elseif fps >= 30 then
                fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 0) -- Yellow
            else
                fpsLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red
            end
            
            fpsLabel.Text = string.format("FPS: %d", fps)
        end
    end)
    
    local success = pcall(function()
        screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end)
    
    if success then
        FPSCounterUI = screenGui
        FPSCounterEnabled = true
        notify("FPS Counter", "Enabled - Drag to move!", 3)
    end
end

local function removeFPSCounter()
    if FPSCounterUI then
        FPSCounterUI:Destroy()
        FPSCounterUI = nil
        FPSCounterEnabled = false
    end
end

-- Teleportation Helper Functions
local function getCharacterRootPart()
    if not LocalPlayer.Character then return nil end
    return LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
end

local function isNearGenerator()
    local hrp = getCharacterRootPart()
    if not hrp then return false, nil end
    
    local map = Workspace:FindFirstChild("Map")
    if not map then return false, nil end
    
    local nearestGen = nil
    local nearestDist = math.huge

    
    for _, obj in ipairs(map:GetDescendants()) do
        if obj:IsA("Model") and obj.Name == "Generator" then
            local genPart = obj:FindFirstChildWhichIsA("BasePart")
            if genPart then
                local distance = (genPart.Position - hrp.Position).Magnitude
                if distance < nearestDist then
                    nearestDist = distance
                    nearestGen = obj
                end
            end
        end
    end
    
    if nearestGen and nearestDist <= Config.AutoFeatures.LeaveDistance then
        return true, nearestGen, nearestDist
    end
    
    return false, nil, nil
end

function leaveGenerator()
    local hrp = getCharacterRootPart()
    if not hrp then return false end
    
    local isNear, nearestGen, distance = isNearGenerator()
    if not isNear then
        notify("Not Near", "You're not near any generator", 2)
        return false
    end
    
    local genPart = nearestGen:FindFirstChildWhichIsA("BasePart")
    if genPart then
        local direction = (hrp.Position - genPart.Position).Unit
        local escapeDistance = Config.AutoFeatures.LeaveDistance + 15
        local escapePosition = hrp.Position + (direction * escapeDistance)
        local escapeCFrame = CFrame.new(escapePosition, escapePosition + hrp.CFrame.LookVector)
        
        if safeTeleport(escapeCFrame, Vector3.new(0, 2, 0)) then
            notify("Escaped!", string.format("Moved %.0f studs away", escapeDistance), 2)
            return true
        end
    end
    
    return false
end

local function startAutoLeaveGenerator()
    if LeaveGeneratorConnection then return end
    
    if not isMobile then
        LeaveGeneratorConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            
            if input.KeyCode == Config.AutoFeatures.LeaveKeybind then
                leaveGenerator()
            end
        end)
        
        notify("Auto Leave Enabled", string.format("Press %s to leave generator", Config.AutoFeatures.LeaveKeybind.Name), 3)
    else
        notify("Mobile Mode", "Use the LEAVE button to escape generators", 3)
    end
end

local function stopAutoLeaveGenerator()
    if LeaveGeneratorConnection then
        LeaveGeneratorConnection:Disconnect()
        LeaveGeneratorConnection = nil
    end
    notify("Auto Leave Disabled", "Keybind disabled", 2)
end

-- Auto Attack Functions
local function findClosestSurvivor()
    if not isKiller() then return nil, nil end
    
    local hrp = getCharacterRootPart()
    if not hrp then return nil, nil end
    
    local closestPlayer = nil
    local closestDist = math.huge
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Team and player.Team.Name == "Survivors" and player.Character then
            local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
            if targetHRP then
                local dist = (targetHRP.Position - hrp.Position).Magnitude
                if dist < closestDist and dist <= Config.AutoFeatures.AttackRange then
                    closestDist = dist
                    closestPlayer = player
                end
            end
        end
    end
    
    return closestPlayer, closestDist
end


local function performAutoAttack()
    if not isKiller() then return end
    
    local target, distance = findClosestSurvivor()
    if not target then return end
    
    safeCall(function()
        local remotes = ReplicatedStorage:FindFirstChild("Remotes")
        if remotes then
            local attacks = remotes:FindFirstChild("Attacks")
            if attacks then
                local basicAttack = attacks:FindFirstChild("BasicAttack")
                if basicAttack then
                    basicAttack:FireServer(false)
                end
            end
        end
    end)
end

local function startAutoAttack()
    if AutoAttackConnection then return end
    
    if not isKiller() then
        notify("Error", "You must be the Killer to use Auto Attack!", 3)
        return
    end
    
    AutoAttackConnection = RunService.Heartbeat:Connect(function()
        if Config.AutoFeatures.AutoAttack then
            performAutoAttack()
        end
    end)
    
    notify("Auto Attack Enabled", string.format("Range: %d studs", Config.AutoFeatures.AttackRange), 3)
end

local function stopAutoAttack()
    if AutoAttackConnection then
        AutoAttackConnection:Disconnect()
        AutoAttackConnection = nil
    end
    notify("Auto Attack Disabled", "Auto attack stopped", 2)
end

local function getAllGenerators()
    local generators = {}
    local map = Workspace:FindFirstChild("Map")
    if not map then return generators end
    
    for _, obj in ipairs(map:GetDescendants()) do
        if obj:IsA("Model") and obj.Name == "Generator" then
            local genPart = obj:FindFirstChildWhichIsA("BasePart")
            if genPart then
                table.insert(generators, {
                    model = obj,
                    part = genPart,
                    position = genPart.Position
                })
            end
        end
    end
    
    return generators
end

function getGeneratorsByDistance()
    local hrp = getCharacterRootPart()
    if not hrp then return {} end
    
    local generators = getAllGenerators()
    
    for _, gen in ipairs(generators) do
        gen.distance = (gen.position - hrp.Position).Magnitude
    end
    
    table.sort(generators, function(a, b)
        return a.distance < b.distance
    end)
    
    return generators
end

function safeTeleport(targetCFrame, offset)
    local hrp = getCharacterRootPart()
    if not hrp then 
        notify("Error", "Character not found", 3)
        return false
    end
    
    offset = offset or Vector3.new(0, Config.Teleportation.TeleportOffset, 0)
    
    if Config.Teleportation.SafeTeleport then
        safeCall(function()
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    end
    
    hrp.CFrame = targetCFrame + offset
    
    if Config.Teleportation.SafeTeleport then
        task.delay(0.5, function()
            safeCall(function()
                for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                        part.CanCollide = true
                    end
                end
            end)
        end)
    end
    
    return true
end


-- ESP Functions
local function createHighlight(obj, color)
    if not validateInstance(obj) then return end
    if obj:FindFirstChild("H") then return end
    
    safeCall(function()
        local h = Instance.new("Highlight")
        h.Name = "H"
        h.Adornee = obj
        h.FillColor = color
        h.OutlineColor = color
        h.FillTransparency = 0.5
        h.OutlineTransparency = 0
        h.Parent = obj
        Highlights[obj] = h
    end)
end

local function removeHighlight(obj)
    if Highlights[obj] then
        safeCall(function()
            if validateInstance(Highlights[obj]) then
                Highlights[obj]:Destroy()
            end
        end)
        Highlights[obj] = nil
    end
    
    local existingH = obj:FindFirstChild("H")
    if existingH then
        existingH:Destroy()
    end
end

local function createLabel(obj, text, color)
    if not validateInstance(obj) then return end
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    
    local rootPart = obj:IsA("Model") and obj:FindFirstChildWhichIsA("BasePart") or (obj:IsA("BasePart") and obj or nil)
    if not rootPart then return end
    
    local playerRoot = LocalPlayer.Character.HumanoidRootPart
    local distance = (playerRoot.Position - rootPart.Position).Magnitude
    
    if Config.Performance.UseDistanceCulling and distance > Config.ESP.MaxDistance then
        if BillboardGuis[obj] then
            safeCall(function()
                if validateInstance(BillboardGuis[obj]) then
                    BillboardGuis[obj]:Destroy()
                end
            end)
            BillboardGuis[obj] = nil
        end
        return
    end
    
    if BillboardGuis[obj] and validateInstance(BillboardGuis[obj]) then
        local textLabel = BillboardGuis[obj]:FindFirstChild("TextLabel")
        if textLabel and Config.ESP.ShowDistance then
            textLabel.Text = string.format("%s\n%.0fm", text, distance)
        elseif textLabel then
            textLabel.Text = text
        end
        return
    end
    
    safeCall(function()
        local billboard = Instance.new("BillboardGui")
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.AlwaysOnTop = true
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.Adornee = rootPart
        billboard.Parent = obj
        
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = color
        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
        textLabel.TextStrokeTransparency = 0
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextScaled = true
        textLabel.Text = Config.ESP.ShowDistance and string.format("%s\n%.0fm", text, distance) or text
        textLabel.Parent = billboard
        
        BillboardGuis[obj] = billboard
    end)
end

local function removeLabel(obj)
    if BillboardGuis[obj] then
        safeCall(function()
            if validateInstance(BillboardGuis[obj]) then
                BillboardGuis[obj]:Destroy()
            end
        end)
        BillboardGuis[obj] = nil
    end
end

local function clearAllESP()
    for obj, h in pairs(Highlights) do
        removeHighlight(obj)
    end
    for obj, gui in pairs(BillboardGuis) do
        removeLabel(obj)
    end
    Highlights = {}
    BillboardGuis = {}
end

-- Update ESP Functions
local function updatePlayerESP()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Team then
            local teamName = player.Team.Name
            
            if teamName == "Killer" and Config.ESP.Killer then
                createHighlight(player.Character, Color3.fromRGB(255, 0, 0))
                createLabel(player.Character, player.Name .. "\n[KILLER]", Color3.fromRGB(255, 0, 0))
            elseif teamName == "Survivors" and Config.ESP.Survivor then
                createHighlight(player.Character, Color3.fromRGB(0, 255, 0))
                createLabel(player.Character, player.Name .. "\n[SURVIVOR]", Color3.fromRGB(0, 255, 0))
            else
                removeHighlight(player.Character)
                removeLabel(player.Character)
            end
        end
    end
end

local function updateGeneratorESP()
    if not Config.ESP.Generator then return end
    
    safeCall(function()
        local map = Workspace:FindFirstChild("Map")
        if not map then return end
        
        for _, obj in ipairs(map:GetDescendants()) do
            if obj:IsA("Model") and obj.Name == "Generator" then
                createHighlight(obj, Color3.fromRGB(203, 132, 66))
                createLabel(obj, "Generator", Color3.fromRGB(203, 132, 66))
            end
        end
    end)
end

local function updateGateESP()
    if not Config.ESP.Gate then return end
    
    safeCall(function()
        local map = Workspace:FindFirstChild("Map")
        if not map then return end
        
        for _, obj in ipairs(map:GetDescendants()) do
            if obj:IsA("Model") and obj.Name == "Gate" then
                createHighlight(obj, Color3.fromRGB(255, 255, 255))
                createLabel(obj, "Gate", Color3.fromRGB(255, 255, 255))
            end
        end
    end)
end

local function updateHookESP()
    if not Config.ESP.Hook then return end
    
    safeCall(function()
        local map = Workspace:FindFirstChild("Map")
        if not map then return end
        
        if Config.ESP.ShowOnlyClosestHook then
            local hrp = getCharacterRootPart()
            if not hrp then return end
            
            local closestHook = nil
            local closestDist = math.huge
            
            for _, obj in ipairs(map:GetDescendants()) do
                if obj:IsA("Model") and obj.Name == "Hook" then
                    local hookPart = obj:FindFirstChildWhichIsA("BasePart")
                    if hookPart then
                        local dist = (hookPart.Position - hrp.Position).Magnitude
                        if dist < closestDist then
                            closestDist = dist
                            closestHook = obj
                        end
                    end
                end
            end
            
            for _, obj in ipairs(map:GetDescendants()) do
                if obj:IsA("Model") and obj.Name == "Hook" then
                    removeHighlight(obj)
                    removeLabel(obj)
                end
            end
            
            if closestHook then
                if closestHook:FindFirstChild("Model") then
                    for _, part in ipairs(closestHook.Model:GetDescendants()) do
                        if part:IsA("MeshPart") then
                            createHighlight(part, Color3.fromRGB(255, 255, 0))
                        end
                    end
                end
                createLabel(closestHook, "CLOSEST HOOK", Color3.fromRGB(255, 255, 0))
            end
        else
            for _, obj in ipairs(map:GetDescendants()) do
                if obj:IsA("Model") and obj.Name == "Hook" then
                    if obj:FindFirstChild("Model") then
                        for _, part in ipairs(obj.Model:GetDescendants()) do
                            if part:IsA("MeshPart") then
                                createHighlight(part, Color3.fromRGB(255, 0, 0))
                            end
                        end
                    end
                    createLabel(obj, "Hook", Color3.fromRGB(255, 0, 0))
                end
            end
        end
    end)
end


local function updatePalletESP()
    if not Config.ESP.Pallet then return end
    
    safeCall(function()
        local map = Workspace:FindFirstChild("Map")
        if not map then return end
        
        for _, obj in ipairs(map:GetDescendants()) do
            if obj:IsA("Model") and obj.Name == "Palletwrong" then
                createHighlight(obj, Color3.fromRGB(255, 255, 0))
                createLabel(obj, "Pallet", Color3.fromRGB(255, 255, 0))
            end
        end
    end)
end

local function updateWindowESP()
    if not Config.ESP.Window then return end
    
    safeCall(function()
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("Model") and obj.Name == "Window" then
                createHighlight(obj, Color3.fromRGB(173, 216, 230))
                createLabel(obj, "Window", Color3.fromRGB(173, 216, 230))
            end
        end
    end)
end

local function updatePumpkinESP()
    if not Config.ESP.Pumpkin then return end
    
    safeCall(function()
        local map = Workspace:FindFirstChild("Map")
        if not map then return end
        
        local pumpkins = map:FindFirstChild("Pumpkins")
        if not pumpkins then return end
        
        for _, obj in ipairs(pumpkins:GetDescendants()) do
            if obj:IsA("Model") and obj.Name:find("Pumpkin") then
                createHighlight(obj, Color3.fromRGB(255, 140, 0))
                createLabel(obj, "Pumpkin", Color3.fromRGB(255, 140, 0))
            end
        end
    end)
end

local function updateAllESP()
    local currentTime = tick()
    if currentTime - LastUpdate < Config.Performance.UpdateRate then return end
    LastUpdate = currentTime
    
    local espCount = 0
    local maxObjects = Config.Performance.MaxESPObjects
    
    for obj, h in pairs(Highlights) do
        if not validateInstance(obj) or not validateInstance(h) then
            Highlights[obj] = nil
        else
            espCount = espCount + 1
        end
    end
    
    for obj, gui in pairs(BillboardGuis) do
        if not validateInstance(obj) or not validateInstance(gui) then
            BillboardGuis[obj] = nil
        end
    end
    
    if espCount >= maxObjects then
        return
    end
    
    updatePlayerESP()
    updateGeneratorESP()
    updateGateESP()
    updateHookESP()
    updatePalletESP()
    updateWindowESP()
    updatePumpkinESP()
end

local function startESP()
    if UpdateConnection then return end
    UpdateConnection = RunService.Heartbeat:Connect(updateAllESP)
    notify("ESP Started", "All ESP features activated", 2)
end

local function stopESP()
    if UpdateConnection then
        UpdateConnection:Disconnect()
        UpdateConnection = nil
    end
    clearAllESP()
    notify("ESP Stopped", "All ESP disabled", 2)
end
                
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
-- ================ 1.5.弹窗窗口显示 ================
        WindUI:Popup({
            Title = "👑尊贵的"..game.Players.LocalPlayer.DisplayName.."用户",
            Icon = "info",
            Content = "欢迎使用HB FXM暴力区脚本",
            Buttons = {
                {
                    Title = "取消",
                    Callback = function() end,
                    Variant = "Tertiary",
                },
                {
                    Title = "启动",
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
        Title = "HB FXM暴力区脚本",
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
            Title = "打开暴力区",
            Icon = "sword",
            CornerRadius = UDim.new(0, 16),
            StrokeThickness = 2,
            Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
            Draggable = true
        })

-- ================ 标题 ================

Window:Tag({
    Title = "v1.1",
    Color = Color3.fromHex("#30ff6a")
})



Window:Tag({
        Title = "HB FXM", -- 标签汉化
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
    Title = "暴力机区通知",
    Content = "加载成功请放心使用",
    Duration = 3, -- 3 seconds
    Icon = "bird",
})

-- ================ 选择 ================
local Tabs = {
    Main = Window:Section({ Title = "暴力区功能", Opened = true }),
}

local TabHandles = {
    Q = Tabs.Main:Tab({ Title = "透视/杀手", Icon = "cctv" }),
    W = Tabs.Main:Tab({ Title = "自动功能", Icon = "swords" }),
    E = Tabs.gn:Tab({ Title = "杀手力量", Icon = "sword" }),
    R = Tabs.gn:Tab({ Title = "传送/瞬移", Icon = "layout-grid" }),
    T = Tabs.gn:Tab({ Title = "设置", Icon = "bolt" }),
}


Toggle = TabHandles.Q:Toggle({
    Title = "杀手级静电除尘器透视（红色）",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.ESP.Killer = Value
        if Value then
            startESP()
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Team and player.Team.Name == "Killer" then
                    removeHighlight(player.Character)
                    removeLabel(player.Character)
                end
            end
        end
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "幸存者透视（绿色）",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.ESP.Survivor = Value
        if Value then
            startESP()
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Team and player.Team.Name == "Survivors" then
                    removeHighlight(player.Character)
                    removeLabel(player.Character)
                end
            end
        end
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "发电机透视（橙色）",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.ESP.Generator = Value
        if Value then
            startESP()
        else
            local map = Workspace:FindFirstChild("Map")
            if map then
                for _, obj in ipairs(map:GetDescendants()) do
                    if obj:IsA("Model") and obj.Name == "Generator" then
                        removeHighlight(obj)
                        removeLabel(obj)
                    end
                end
            end
        end
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "门电除尘器透视（白色）",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.ESP.Gate = Value
        if Value then
            startESP()
        end
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "挂钩静电除尘器透视（红色）",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.ESP.Hook = Value
        if Value then
            startESP()
        else
            local map = Workspace:FindFirstChild("Map")
            if map then
                for _, obj in ipairs(map:GetDescendants()) do
                    if obj:IsA("Model") and obj.Name == "Hook" then
                        removeHighlight(obj)
                        removeLabel(obj)
                    end
                end
            end
        end
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "仅显示最近的钩",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.ESP.ShowOnlyClosestHook = Value
        
        local map = Workspace:FindFirstChild("Map")
        if map then
            for _, obj in ipairs(map:GetDescendants()) do
                if obj:IsA("Model") and obj.Name == "Hook" then
                    removeHighlight(obj)
                    removeLabel(obj)
                end
            end
        end
        
        if Config.ESP.Hook then
            updateHookESP()
        end
        
        notify("Hook ESP", Value and "Showing only closest hook" or "Showing all hooks", 2)
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "托盘静电除尘器透视（黄色）",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.ESP.Pallet = Value
        if Value then
            startESP()
        end
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "窗户静电除尘器透视（浅蓝色）",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.ESP.Window = Value
        if Value then
            startESP()
        end
 end
})

Toggle = TabHandles.Q:Toggle({
    Title = "南瓜电除尘器透视（橙色）",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.ESP.Pumpkin = Value
        if Value then
            startESP()
        end
 end
})

Section = TabHandles.Q:Section({ Title = "设置透视" })

Toggle = TabHandles.Q:Toggle({
    Title = "显示距离",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.ESP.ShowDistance = Value
 end
})

Slider = TabHandles.Q:Slider({
    Title = "最大距离",
    Value = {
        Min = 0,
        Max = 1000,
        Default = 500,
    },
    Increment = 1,
    Callback = function(value)
        Config.ESP.MaxDistance = Value
    end
})

Slider = TabHandles.Q:Slider({
    Title = "更新率（秒）",
    Value = {
        Min = 0.1,
        Max = 2,
        Default = 0.5,
    },
    Increment = 1,
    Callback = function(value)
        Config.Performance.UpdateRate = Value
    end
})

Slider = TabHandles.Q:Slider({
    Title = "最大透视对象",
    Value = {
        Min = 25,
        Max = 500,
        Default = 50,
    },
    Increment = 1,
    Callback = function(value)
        Config.Performance.MaxESPObjects = Value
    end
})

Toggle = TabHandles.W:Toggle({
    Title = "自动完成发电机",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.AutoFeatures.AutoGenerator = Value
        if Value then
            notify("Auto Generator", "Enabled - Generators will auto-complete", 3)
        else
            notify("Auto Generator", "Disabled", 2)
        end
 end
})

Dropdown = TabHandles.W:Dropdown({
    Title = "发电机模式", 
    Values = {"最大（快）”、“正常（慢）}, 
    Value = "请选择", 
    Callback = function(Option) 
        if Option == "Great (Fast)" then
            Config.AutoFeatures.GeneratorMode = "great"
        else
            Config.AutoFeatures.GeneratorMode = "normal"
        end
end
})

Section = TabHandles.W:Section({ Title = "快速逃生" })

Toggle = TabHandles.W:Toggle({
    Title = "启用快速休假生成器",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.AutoFeatures.AutoLeaveGenerator = Value
        if Value then
            startAutoLeaveGenerator()
        else
            stopAutoLeaveGenerator()
        end
 end
})

Dropdown = TabHandles.W:Dropdown({
    Title = "离开生成器钥匙绑定", 
    Values = {"Q", "E", "F", "G", "X", "Z", "V", "B"}, 
    Value = "请选择", 
    Callback = function(Option) 
            local keyMap = {
                ["Q"] = Enum.KeyCode.Q,
                ["E"] = Enum.KeyCode.E,
                ["F"] = Enum.KeyCode.F,
                ["G"] = Enum.KeyCode.G,
                ["X"] = Enum.KeyCode.X,
                ["Z"] = Enum.KeyCode.Z,
                ["V"] = Enum.KeyCode.V,
                ["B"] = Enum.KeyCode.B
            }
            
            Config.AutoFeatures.LeaveKeybind = keyMap[Option]
            
            if Config.AutoFeatures.AutoLeaveGenerator then
                stopAutoLeaveGenerator()
                startAutoLeaveGenerator()
            end
            
            notify("Keybind Changed", "Leave generator key set to: " .. Option, 2)
        end
end
})

Slider = TabHandles.W:Slider({
    Title = "检测范围（螺栓）",
    Value = {
        Min = 5,
        Max = 30,
        Default = 15,
    },
    Increment = 1,
    Callback = function(value)
        Config.AutoFeatures.LeaveDistance = Value
    end
})

Button = TabHandles.W:Button({
    Title = "立即离开发电机",
    Desc = "",
    Locked = false,
    Callback = function()
        leaveGenerator()
            
WindUI:Notify({
    Title = "通知",
    Content = "离开发动机成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Section = TabHandles.QI:Section({ Title = "手动动作" })

Button = TabHandles.:Button({
    Title = "完成所有发电机（即时）",
    Desc = "",
    Locked = false,
    Callback = function()
        local map = Workspace:FindFirstChild("Map")
        if not map then
            notify("Error", "Map not found", 3)
            return
        end
        
        local completed = 0
        
        safeCall(function()
            local remotes = ReplicatedStorage:FindFirstChild("Remotes")
            if not remotes then return end
            
            local genRemotes = remotes:FindFirstChild("Generator")
            if not genRemotes then return end
            
            local repairEvent = genRemotes:FindFirstChild("RepairEvent")
            local skillCheckEvent = genRemotes:FindFirstChild("SkillCheckResultEvent")
            
            if not repairEvent or not skillCheckEvent then return end
            
            for _, obj in ipairs(map:GetDescendants()) do
                if obj:IsA("Model") and obj.Name == "Generator" then
                    for _, point in ipairs(obj:GetChildren()) do
                        if point.Name:find("GeneratorPoint") then
                            pcall(function()
                                for i = 1, 10 do
                                    repairEvent:FireServer(point, true)
                                    skillCheckEvent:FireServer("success", 1, obj, point)
                                end
                                completed = completed + 1
                            end)
                        end
                    end
                end
            end
        end)
        
        if completed > 0 then
            notify("Complete!", string.format("Completed %d generator(s)", completed), 4)
        else
            notify("Failed", "Could not find generators", 3)
        end
            
WindUI:Notify({
    Title = "通知",
    Content = "完成发动机成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Section = TabHandles.E:Section({ Title = "杀手力量" })

Toggle = TabHandles.E:Toggle({
    Title = "附近的汽车袭击幸存者",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.AutoFeatures.AutoAttack = Value
        if Value then
            startAutoAttack()
        else
            stopAutoAttack()
        end
 end
})

Slider = TabHandles.E:Slider({
    Title = "自动攻击范围（钉）",
    Value = {
        Min = 5,
        Max = 20,
        Default = 10,
    },
    Increment = 1,
    Callback = function(value)
        Config.AutoFeatures.AttackRange = Value
    end
})

Button = TabHandles.E:Button({
    Title = "激活杀手级力量",
    Desc = "",
    Locked = false,
    Callback = function()
        safeCall(function()
            local remotes = ReplicatedStorage:FindFirstChild("Remotes")
            if remotes then
                local killerRemotes = remotes:FindFirstChild("Killers")
                if killerRemotes then
                    local killerFolder = killerRemotes:FindFirstChild("Killer")
                    if killerFolder then
                        local activatePower = killerFolder:FindFirstChild("ActivatePower")
                        if activatePower then
                            activatePower:FireServer()
                            notify("Power Activated", "Killer power triggered", 2)
                        end
                    end
                end
            end
        end)
            
WindUI:Notify({
    Title = "通知",
    Content = "激活成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.E:Button({
    Title = "基础攻击（杀手）",
    Desc = "",
    Locked = false,
    Callback = function()
        safeCall(function()
            local remotes = ReplicatedStorage:FindFirstChild("Remotes")
            if remotes then
                local attacks = remotes:FindFirstChild("Attacks")
                if attacks then
                    local basicAttack = attacks:FindFirstChild("BasicAttack")
                    if basicAttack then
                        basicAttack:FireServer(false)
                        notify("Attack", "Basic attack executed", 2)
                    end
                end
            end
        end)
            
WindUI:Notify({
    Title = "通知",
    Content = "加强成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.R:Button({
    Title = "传送到最近的发生器",
    Desc = "",
    Locked = false,
    Callback = function()
        local generators = getGeneratorsByDistance()
        
        if #generators == 0 then
            notify("Not Found", "No generators found on the map", 3)
            return
        end
        
        local closest = generators[1]
        if safeTeleport(closest.part.CFrame) then
            notify("Teleported!", string.format("Teleported to closest generator (%.0fm)", closest.distance), 3)
        end
            
WindUI:Notify({
    Title = "通知",
    Content = "传送到最近的发生器成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.R:Button({
    Title = "传送到法拉第生成器",
    Desc = "",
    Locked = false,
    Callback = function()
        local generators = getGeneratorsByDistance()
        
        if #generators == 0 then
            notify("Not Found", "No generators found on the map", 3)
            return
        end
        
        local farthest = generators[#generators]
        if safeTeleport(farthest.part.CFrame) then
            notify("Teleported!", string.format("Teleported to farthest generator (%.0fm)", farthest.distance), 3)
        end
            
WindUI:Notify({
    Title = "通知",
    Content = "传送到法拉第生成器成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.R:Button({
    Title = "通过所有发电机进行远程传输",
    Desc = "",
    Locked = false,
    Callback = function()
        local generators = getGeneratorsByDistance()
        
        if #generators == 0 then
            notify("Not Found", "No generators found on the map", 3)
            return
        end
        
        notify("Starting", string.format("Teleporting through %d generators...", #generators), 3)
        
        task.spawn(function()
            for i, gen in ipairs(generators) do
                if not getCharacterRootPart() then break end
                
                safeTeleport(gen.part.CFrame)
                notify("Generator " .. i, string.format("At generator %d/%d (%.0fm)", i, #generators, gen.distance), 2)
                
                task.wait(Config.Teleportation.TeleportDelay)
            end
            
            notify("Complete!", "Visited all generators", 3)
        end)
            
WindUI:Notify({
    Title = "通知",
    Content = "发电机进行远程传输成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.R:Button({
    Title = "显示生成器列表（控制台）",
    Desc = "",
    Locked = false,
    Callback = function()
        local generators = getGeneratorsByDistance()
        
        if #generators == 0 then
            notify("Not Found", "No generators found", 3)
            print("No generators found on the map")
            return
        end
        
        print("\n=== GENERATOR LIST ===")
        for i, gen in ipairs(generators) do
            print(string.format("%d. Generator at %.0fm - Position: %s", 
                i, gen.distance, tostring(gen.position)))
        end
        print("======================\n")
        
        notify("List Printed", string.format("Found %d generators - Check console (F9)", #generators), 3)
            
WindUI:Notify({
    Title = "通知",
    Content = "显示生成器成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Section = TabHandles.R:Section({ Title = "其他传送" })

Button = TabHandles.R:Button({
    Title = "传送到最近的门",
    Desc = "",
    Locked = false,
    Callback = function()
        local hrp = getCharacterRootPart()
        if not hrp then
            notify("Error", "Character not found", 3)
            return
        end
        
        local map = Workspace:FindFirstChild("Map")
        if not map then
            notify("Error", "Map not found", 3)
            return
        end
        
        local nearestGate = nil
        local nearestDist = math.huge
        
        for _, obj in ipairs(map:GetDescendants()) do
            if obj:IsA("Model") and obj.Name == "Gate" then
                local gatePart = obj:FindFirstChildWhichIsA("BasePart")
                if gatePart then
                    local dist = (gatePart.Position - hrp.Position).Magnitude
                    if dist < nearestDist then
                        nearestGate = gatePart
                        nearestDist = dist
                    end
                end
            end
        end
        
        if nearestGate then
            safeTeleport(nearestGate.CFrame)
            notify("Teleported", string.format("Teleported to gate (%.0fm)", nearestDist), 3)
        else
            notify("Not Found", "No gates found", 3)
        end
            
WindUI:Notify({
    Title = "通知",
    Content = "传送成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.R:Button({
    Title = "逃生游戏（仅限幸存者）",
    Desc = "",
    Locked = false,
    Callback = function()
        if not isSurvivor() then
            notify("Error", "You must be a Survivor to use this!", 3)
            return
        end
        
        local hrp = getCharacterRootPart()
        if not hrp then
            notify("Error", "Character not found", 3)
            return
        end
        
        local map = Workspace:FindFirstChild("Map")
        if not map then
            notify("Error", "Map not found", 3)
            return
        end
        
        local gate = nil
        for _, obj in ipairs(map:GetDescendants()) do
            if obj:IsA("Model") and obj.Name == "Gate" then
                gate = obj
                break
            end
        end
        
        if not gate then
            notify("Error", "No gates found on map", 3)
            return
        end
        
        local escapeZone = gate:FindFirstChild("Escape") or gate:FindFirstChildWhichIsA("BasePart")
        
        if escapeZone then
            safeTeleport(escapeZone.CFrame, Vector3.new(0, 5, 0))
            
            task.wait(0.5)
            
            safeCall(function()
                local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                if remotes then
                    local gateRemote = remotes:FindFirstChild("Gate")
                    if gateRemote then
                        local escapeEvent = gateRemote:FindFirstChild("Escape")
                        if escapeEvent then
                            escapeEvent:FireServer()
                        end
                    end
                end
            end)
            
            notify("Escape!", "Teleported to exit gate - Walk through to escape!", 4)
        else
            notify("Error", "Could not find escape zone", 3)
        end
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Section = TabHandles.R:Section({ Title = "远程传输设置" })

Slider = TabHandles.R:Slider({
    Title = "传送高度偏差",
    Value = {
        Min = 0,
        Max = 10,
        Default = 3,
    },
    Increment = 1,
    Callback = function(value)
        Config.Teleportation.TeleportOffset = Value
    end
})

Slider = TabHandles.R:Slider({
    Title = "多远程传输延迟（秒）",
    Value = {
        Min = 0.1,
        Max = 5,
        Default = 0.1,
    },
    Increment = 1,
    Callback = function(value)
        Config.Teleportation.TeleportDelay = Value
    end
})

Toggle = TabHandles.R:Toggle({
    Title = "安全传送（禁用碰撞）",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.Teleportation.SafeTeleport = Value
 end
})

Section = TabHandles.T:Section({ Title = "性能选项" })

Toggle = TabHandles.T:Toggle({
    Title = "禁用粒子和效果",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.Performance.DisableParticles = Value
        applyPerformanceSettings()
        notify("Performance", Value and "Particles disabled" or "Particles enabled", 2)
 end
})

Toggle = TabHandles.T:Toggle({
    Title = "图形质量较低",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.Performance.LowerGraphics = Value
        applyPerformanceSettings()
        notify("Performance", Value and "Graphics lowered" or "Graphics reset", 2)
 end
})

Toggle = TabHandles.T:Toggle({
    Title = "禁用阴影",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.Performance.DisableShadows = Value
        applyPerformanceSettings()
        notify("Performance", Value and "Shadows disabled" or "Shadows enabled", 2)
 end
})

Toggle = TabHandles.T:Toggle({
    Title = "缩短渲染距离",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.Performance.ReduceRenderDistance = Value
        applyPerformanceSettings()
        notify("Performance", Value and "Render distance reduced" or "Render distance normal", 2)
 end
})

Toggle = TabHandles.T:Toggle({
    Title = "使用距离剔除（透视）",
    Desc = "",
    Locked = false,
    Callback = function(Value)
        Config.Performance.UseDistanceCulling = Value
        notify("Performance", Value and "Distance culling enabled" or "Distance culling disabled", 2)
 end
})

Button = TabHandles.T:Button({
    Title = "应用所有性能提升",
    Desc = "",
    Locked = false,
    Callback = function()
        Config.Performance.DisableParticles = true
        Config.Performance.LowerGraphics = true
        Config.Performance.DisableShadows = true
        Config.Performance.ReduceRenderDistance = true
        Config.Performance.UseDistanceCulling = true
        applyPerformanceSettings()
        notify("Performance", "All performance boosts applied!", 3)
            
WindUI:Notify({
    Title = "通知",
    Content = "应用所有性能提升成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

Button = TabHandles.T:Button({
    Title = "重置性能设置",
    Desc = "",
    Locked = false,
    Callback = function()
        Config.Performance.DisableParticles = false
        Config.Performance.LowerGraphics = false
        Config.Performance.DisableShadows = false
        Config.Performance.ReduceRenderDistance = false
        resetPerformanceSettings()
        notify("Performance", "Settings reset to default", 2)
            
WindUI:Notify({
    Title = "通知",
    Content = "加载成功",
    Duration = 1, -- 3 seconds
    Icon = "layout-grid",
})                        
            
 end
})

