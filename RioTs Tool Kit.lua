local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("RioTs Toolkit")


local Universal_Scripts = win:Server("Universal Scripts", "")

local IF = Universal_Scripts:Channel("Infinte Yield")

IF:Label("Infinite Yield is a script that gives all things necessary to exploit\nin roblox like God mode, noclip, fling, fly.")
IF:Seperator()
IF:Button("Execute Infinite Yield", function()
DiscordLib:Notification("Infinite Yield", "Infinite Yield has been executed please wait.", "Okay!")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

local UE = Universal_Scripts:Channel("Universal ESP")

UE:Label("Universal ESP gives you the ability to see players names, health,\ndistance and team through walls.")
UE:Seperator()
UE:Button("Execute Universal ESP", function()
DiscordLib:Notification("Universal ESP", "Universal ESP has been executed please wait.", "Okay!")
    pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))() end)
end)

local DEX = Universal_Scripts:Channel("DEX Game Analyzer")

DEX:Label("DEX is a tool to analyze a game's parts for scripters to make scripts.")
DEX:Seperator()
DEX:Button("Execute DEX Game Analyzer", function()
DiscordLib:Notification("DEX Game Analyzer", "DEX Game Analyzer has been executed please wait.", "Okay!")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end)

local Troll_Scripts = win:Server("Troll Scripts", "")

local KFF = Troll_Scripts:Channel("Kawaii Freaky Fling")

KFF:Label("Kawaii Freaky Fling lets you input a players name and teleport to\nthat player repeatedly to fling them.")
KFF:Seperator()
KFF:Button("Execute Kawaii Freaky Fling", function()
DiscordLib:Notification("Kawaii Freaky Fling", "Kawaii Freaky Fling has been executed please wait.", "Okay!")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-FREAKY-FLING/main/kawaii_freaky_fling.lua",true))()
end)

local Invis = Troll_Scripts:Channel("Invisible Player")

Invis:Label("Invisible Player makes you able to go completely invisible to other players.")
Invis:Seperator()
Invis:Button("Execute Invisible Player", function()
DiscordLib:Notification("Invisible Player", "Invisible Player has been executed please wait.", "Okay!")
    local ScriptStarted = false
    local Keybind = "E" --Set to whatever you want, has to be the name of a KeyCode Enum.
    local Transparency = true --Will make you slightly transparent when you are invisible. No reason to disable.
    local NoClip = false --Will make your fake character no clip.
    
    local Player = game:GetService("Players").LocalPlayer
    local RealCharacter = Player.Character or Player.CharacterAdded:Wait()
    
    local IsInvisible = false
    
    RealCharacter.Archivable = true
    local FakeCharacter = RealCharacter:Clone()
    local Part
    Part = Instance.new("Part", workspace)
    Part.Anchored = true
    Part.Size = Vector3.new(200, 1, 200)
    Part.CFrame = CFrame.new(0, -500, 0) --Set this to whatever you want, just far away from the map.
    Part.CanCollide = true
    FakeCharacter.Parent = workspace
    FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
    
    for i, v in pairs(RealCharacter:GetChildren()) do
    if v:IsA("LocalScript") then
        local clone = v:Clone()
        clone.Disabled = true
        clone.Parent = FakeCharacter
    end
    end
    if Transparency then
    for i, v in pairs(FakeCharacter:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Transparency = 0.7
        end
    end
    end
    local CanInvis = true
    function RealCharacterDied()
    CanInvis = false
    RealCharacter:Destroy()
    RealCharacter = Player.Character
    CanInvis = true
    isinvisible = false
    FakeCharacter:Destroy()
    workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
    
    RealCharacter.Archivable = true
    FakeCharacter = RealCharacter:Clone()
    Part:Destroy()
    Part = Instance.new("Part", workspace)
    Part.Anchored = true
    Part.Size = Vector3.new(200, 1, 200)
    Part.CFrame = CFrame.new(9999, 9999, 9999) --Set this to whatever you want, just far away from the map.
    Part.CanCollide = true
    FakeCharacter.Parent = workspace
    FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
    
    for i, v in pairs(RealCharacter:GetChildren()) do
        if v:IsA("LocalScript") then
            local clone = v:Clone()
            clone.Disabled = true
            clone.Parent = FakeCharacter
        end
    end
    if Transparency then
        for i, v in pairs(FakeCharacter:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Transparency = 0.7
            end
        end
    end
    RealCharacter.Humanoid.Died:Connect(function()
    RealCharacter:Destroy()
    FakeCharacter:Destroy()
    end)
    Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
    end
    RealCharacter.Humanoid.Died:Connect(function()
    RealCharacter:Destroy()
    FakeCharacter:Destroy()
    end)
    Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
    local PseudoAnchor
    game:GetService "RunService".RenderStepped:Connect(
    function()
        if PseudoAnchor ~= nil then
            PseudoAnchor.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
        end
        if NoClip then
        FakeCharacter.Humanoid:ChangeState(11)
        end
    end
    )
    
    PseudoAnchor = FakeCharacter.HumanoidRootPart
    local function Invisible()
    if IsInvisible == false then
        local StoredCF = RealCharacter.HumanoidRootPart.CFrame
        RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
        FakeCharacter.HumanoidRootPart.CFrame = StoredCF
        RealCharacter.Humanoid:UnequipTools()
        Player.Character = FakeCharacter
        workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
        PseudoAnchor = RealCharacter.HumanoidRootPart
        for i, v in pairs(FakeCharacter:GetChildren()) do
            if v:IsA("LocalScript") then
                v.Disabled = false
            end
        end
    
        IsInvisible = true
    else
        local StoredCF = FakeCharacter.HumanoidRootPart.CFrame
        FakeCharacter.HumanoidRootPart.CFrame = RealCharacter.HumanoidRootPart.CFrame
    
        RealCharacter.HumanoidRootPart.CFrame = StoredCF
    
        FakeCharacter.Humanoid:UnequipTools()
        Player.Character = RealCharacter
        workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
        PseudoAnchor = FakeCharacter.HumanoidRootPart
        for i, v in pairs(FakeCharacter:GetChildren()) do
            if v:IsA("LocalScript") then
                v.Disabled = true
            end
        end
        IsInvisible = false
    end
    end
    
    game:GetService("UserInputService").InputBegan:Connect(
    function(key, gamep)
        if gamep then
            return
        end
        if key.KeyCode.Name:lower() == Keybind:lower() and CanInvis and RealCharacter and FakeCharacter then
            if RealCharacter:FindFirstChild("HumanoidRootPart") and FakeCharacter:FindFirstChild("HumanoidRootPart") then
                Invisible()
            end
        end
    end
    )
    local Sound = Instance.new("Sound",game:GetService("SoundService"))
    Sound.SoundId = "rbxassetid://232127604"
    Sound:Play()
    game:GetService("StarterGui"):SetCore("SendNotification",{["Title"] = "Invisible Toggle Loaded",["Text"] = "Press "..Keybind.." to become change visibility.",["Duration"] = 20,["Button1"] = "Okay."})
end)

local Freaky_Troll = win:Server("Freaky Troll Scripts", "")

local Jerk_tool = Freaky_Troll:Channel("Jerk Off Tool")

Jerk_tool:Label("Jerk Tool gives you a tool that will do what the name says...")
Jerk_tool:Seperator()
Jerk_tool:Button("Execute Jerk Tool", function()
    DiscordLib:Notification("Jerk Tool", "Jerk Tool has been executed please wait.", "Okay!")

    -- Check the player's character type and load the appropriate script
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local isR6 = character:FindFirstChild("Torso") ~= nil
    local jerkScriptURL = isR6 and "https://pastefy.app/wa3v2Vgm/raw" or "https://pastefy.app/YZoglOyJ/raw"

    -- Execute the Jerk script
    loadstring(game:HttpGet(jerkScriptURL))()
end)

local Freaky_Gui = Freaky_Troll:Channel("Freaky GUI's")

Freaky_Gui:Label("Bang Someone GUI allows you to enter someones name and bang\nthem...")
Freaky_Gui:Seperator()
Freaky_Gui:Button("Execute Bang Someone GUI", function()
    DiscordLib:Notification("Bang Someone GUI", "Bang Someone GUI has been executed please wait.", "Okay!")

    -- Check the player's character type and load the appropriate script
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local isR6 = character:FindFirstChild("Torso") ~= nil
    local jerkScriptURL = isR6 and "https://pastebin.com/raw/aPSHMV6K" or "https://pastebin.com/raw/1ePMTt9n"

    -- Execute the Jerk script
    loadstring(game:HttpGet(jerkScriptURL))()
end)
Freaky_Gui:Seperator()

Freaky_Gui:Label("Get Banged GUI allows you to enter someones name and get\nbanged by them...")
Freaky_Gui:Seperator()
Freaky_Gui:Button("Execute Get Banged GUI", function()
    DiscordLib:Notification("Get Banged GUI", "Get Bang GUI has been executed please wait.", "Okay!")

    -- Check the player's character type and load the appropriate script
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local isR6 = character:FindFirstChild("Torso") ~= nil
    local jerkScriptURL = isR6 and "https://pastebin.com/raw/zHbw7ND1" or "https://pastebin.com/raw/7hvcjDnW"

    -- Execute the Jerk script
    loadstring(game:HttpGet(jerkScriptURL))()
end)

Freaky_Gui:Seperator()

Freaky_Gui:Label("Give Head GUI allows you to enter someones name and give them head...")
Freaky_Gui:Seperator()
Freaky_Gui:Button("Execute Give Head GUI", function()
    DiscordLib:Notification("Give Head GUI", "Give Head GUI has been executed please wait.", "Okay!")

    -- Check the player's character type and load the appropriate script
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local isR6 = character:FindFirstChild("Torso") ~= nil
    local jerkScriptURL = isR6 and "https://pastebin.com/raw/SymCfnAW" or "https://pastebin.com/raw/p8yxRfr4"

    -- Execute the Jerk script
    loadstring(game:HttpGet(jerkScriptURL))()
end)

Freaky_Gui:Seperator()

Freaky_Gui:Label("Receive Head GUI allows you to enter someones name and make \nthem give you head...")
Freaky_Gui:Seperator()
Freaky_Gui:Button("Execute Receive Head GUI", function()
    DiscordLib:Notification("Receive Head GUI", "Receive Head GUI has been executed please wait.", "Okay!")

    -- Check the player's character type and load the appropriate script
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local isR6 = character:FindFirstChild("Torso") ~= nil
    local jerkScriptURL = isR6 and "https://pastebin.com/raw/FPu4e2Qh" or "https://pastebin.com/raw/DyPP2tAF"

    -- Execute the Jerk script
    loadstring(game:HttpGet(jerkScriptURL))()
end)
Freaky_Gui:Seperator()

local Utility_Scripts = win:Server("Utility Scripts", "")

local VCB = Utility_Scripts:Channel("VC Unban")
VCB:Label("This script just unbans your voice chat.")
VCB:Seperator()
VCB:Button("Execute VC Unban", function()
DiscordLib:Notification("VC Unban", "VC Unban has been executed please wait.", "Okay!")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Clipszz/Micup/refs/heads/main/mic%20up%20acks.txt"))()
end)

local Anti_fling = Utility_Scripts:Channel("Anti Fling")
Anti_fling:Label("This script stops you from being flung by other players.")
Anti_fling:Seperator()
Anti_fling:Button("Execute Anti Fling", function()
DiscordLib:Notification("Anti Fling", "Anti Fling has been executed please wait.", "Okay!")
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Linux6699/DaHubRevival/main/AntiFling.lua'))()
end)

local FE_Scripts = win:Server("FE Scripts", "")

local FE_information = FE_Scripts:Channel("FE Information")

FE_information:Label("What is FE?, FE is a client side script any script that is\nFE CANNOT modify another players client.")
FE_information:Label("All scripts in the section are all client side and only YOU can see the\ntools, items, etc nobody else.")



local player = win:Server("Player", "")

local player_modifications = player:Channel("Player Modifications")
player_modifications:Label("Modify your player Speed, Toggle noclip, fly, etc")
player_modifications:Seperator()
local sldr = player_modifications:Slider("Movement Speed", 0, 150, 16, function(sliderValue)
    -- Update the player's movement speed based on the slider value
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = sliderValue
end)
player_modifications:Seperator()
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local localplayer = plr
local flying = false
local torso = nil
local speed = 10
local keys = {a=false, d=false, w=false, s=false}
local e1, e2
local core

local function startFly()
    if flying then return end
    flying = true
    if workspace:FindFirstChild("Core") then
        workspace.Core:Destroy()
    end

    core = Instance.new("Part")
    core.Name = "Core"
    core.Size = Vector3.new(0.05, 0.05, 0.05)
    core.Parent = workspace
    local weld = Instance.new("Weld", core)
    weld.Part0 = core
    weld.Part1 = localplayer.Character.LowerTorso
    weld.C0 = CFrame.new(0, 0, 0)

    torso = core

    local pos = Instance.new("BodyPosition", torso)
    local gyro = Instance.new("BodyGyro", torso)
    pos.Name = "EPIXPOS"
    pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
    pos.position = torso.Position
    gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    gyro.cframe = torso.CFrame

    repeat
        wait()
        localplayer.Character.Humanoid.PlatformStand = true
        local new = gyro.cframe - gyro.cframe.p + pos.position
        if not keys.w and not keys.s and not keys.a and not keys.d then
            speed = 5
        end
        if keys.w then
            new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
        end
        if keys.s then
            new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
        end
        if keys.d then
            new = new * CFrame.new(speed, 0, 0)
        end
        if keys.a then
            new = new * CFrame.new(-speed, 0, 0)
        end
        if speed > 10 then
            speed = 5
        end
        pos.position = new.p
        if keys.w then
            gyro.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(speed * 0), 0, 0)
        elseif keys.s then
            gyro.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(speed * 0), 0, 0)
        else
            gyro.cframe = workspace.CurrentCamera.CoordinateFrame
        end
    until not flying
    if gyro then gyro:Destroy() end
    if pos then pos:Destroy() end
    flying = false
    localplayer.Character.Humanoid.PlatformStand = false
    speed = 10
end

local function stopFly()
    flying = false
    if core then
        core:Destroy()
        core = nil
    end
end

-- Connect the toggle to start/stop fly
player_modifications:Toggle("Fly", false, function(bool)
    if bool then
        startFly()
    else
        stopFly()
    end
end)

-- Key events to control movement while flying
e1 = mouse.KeyDown:connect(function(key)
    if not torso or not torso.Parent then 
        flying = false 
        e1:disconnect() 
        e2:disconnect() 
        return 
    end
    if key == "w" then
        keys.w = true
    elseif key == "s" then
        keys.s = true
    elseif key == "a" then
        keys.a = true
    elseif key == "d" then
        keys.d = true
    end
end)

e2 = mouse.KeyUp:connect(function(key)
    if key == "w" then
        keys.w = false
    elseif key == "s" then
        keys.s = false
    elseif key == "a" then
        keys.a = false
    elseif key == "d" then
        keys.d = false
    end
end)

