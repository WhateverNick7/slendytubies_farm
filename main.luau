---@diagnostic disable: undefined-global
-- by Stonifam
-- took Anti-AFK from Infinite Yield

queueteleport = queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)
ReplicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
Players = cloneref(game:GetService('Players'))
local Player = Players.LocalPlayer

Player.OnTeleport:Connect(function()
    if queueteleport then
        queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/WhateverNick7/slendytubies_farm/main/main.luau'))()")
    end
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
            task.wait(1)
        end
    end
    task.wait()
end
