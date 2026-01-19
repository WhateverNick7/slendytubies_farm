-- by Stonifam
-- took Anti-kick and Anti-AFK from Infinite Yield

local queueteleport = queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)
local ReplicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
local Player = cloneref(game:GetService("Players")).LocalPlayer

Player.OnTeleport:Connect(function()
    if queueteleport then
        queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/WhateverNick7/slendytubies_farm/main/main.luau'))()")
    end
end)

local oldhmmi
local oldhmmnc
if hookfunction then
    hookfunction(Player.Kick, function() end)
end
oldhmmi = hookmetamethod(game, "__index", function(self, method)
    if self == Player and method:lower() == "kick" then
        return error("Expected ':' not '.' calling member function Kick", 2)
    end
    return oldhmmi(self, method)
end)
oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...)
    if self == Player and getnamecallmethod():lower() == "kick" then
        return
    end
    return oldhmmnc(self, ...)
end)

for _, conn in pairs(getconnections(Player.Idled)) do
    if conn["Disable"] then
        conn["Disable"](conn)
    elseif conn["Disconnect"] then
        conn["Disconnect"](conn)
    end
end

local function get_char()
    return Player.Character
end
local function get_root()
    local char = get_char()
    if char then
        return char:WaitForChild('Humanoid').RootPart
    end
end

while true do
    if not get_char() then
        ReplicatedStorage.Remotes.sendCharacterSpawnRequest:FireServer("Player")
        Player.CharacterAdded:Wait()
        task.wait(1)
    end
    for _,custard:Model in ipairs(workspace.game.gameCustard:GetChildren()) do
        if custard and custard.Touch and custard:IsDescendantOf(workspace) then
            get_root().CFrame = CFrame.new(custard.Touch.Position + Vector3.new(0,math.pi,0))
            repeat task.wait() until not custard or (custard and custard:IsDescendantOf(nil))
            task.wait(0.3)
        end
    end
    task.wait()
end

