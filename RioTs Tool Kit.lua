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


local FE_Scripts = win:Server("FE Scripts", "")

local FE = FE_Scripts:Channel("FE Information")

FE:Label("This section is still in development...")
FE:Seperator()
