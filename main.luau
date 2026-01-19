---@diagnostic disable: undefined-global
-- by Stonifam
-- took Anti-AFK from Infinite Yield

cloneref = cloneref or function(...) return ... end
workspace = cloneref(workspace)
local Player = cloneref(game:GetService("Players")).LocalPlayer
local CoreGui = cloneref(game:GetService('CoreGui'))
local TweenService = cloneref(game:GetService('TweenService'))
queueteleport = queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)
ReplicatedStorage = cloneref(game:GetService('ReplicatedStorage'))

Player.OnTeleport:Connect(function()
    if queueteleport then
        queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/WhateverNick7/slendytubies_farm/main/main.luau'))()")
    end
end)

if getconnections then
    for _, conn in pairs(getconnections(Player.Idled)) do
        if conn["Disable"] then
            conn["Disable"](conn)
        elseif conn["Disconnect"] then
            conn["Disconnect"](conn)
        end
    end
end

local function random_string()
    local length = math.random(10,20)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end

local function Create(class:string, parent:Instance?):Instance
    local a = Instance.new(class)
    a.Name = random_string()
    a.Parent = parent
    return a
end

local parent

if get_hidden_gui or gethui then
    local hiddenUI = get_hidden_gui or gethui
    parent = hiddenUI()
elseif CoreGui and CoreGui:FindFirstChild("RobloxGui") then
    parent = CoreGui.RobloxGui
elseif CoreGui then
    parent = CoreGui
else
    parent = Player:WaitForChild('PlayerGui')
end

gui = Create("ScreenGui", parent)
gui.IgnoreGuiInset = true
gui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

canvas = Create("CanvasGroup", gui)
canvas.BorderSizePixel = 0
canvas.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
canvas.AnchorPoint = Vector2.new(0.5, 0.5)
canvas.Size = UDim2.new(0.2, 0, 0.3, 0)
canvas.Position = UDim2.new(0.5, 0, 0.5, 0)
canvas.BorderColor3 = Color3.fromRGB(0, 0, 0)

title = Create("Frame", canvas)
title.BorderSizePixel = 0
title.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
title.Size = UDim2.new(1, 0, 0.2, 0)
title.BorderColor3 = Color3.fromRGB(0, 0, 0)

title_text = Create("TextLabel", title)
title_text.TextWrapped = true
title_text.BorderSizePixel = 0
title_text.TextSize = 14
title_text.TextScaled = true
title_text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title_text.FontFace = Font.new('rbxasset://fonts/families/SourceSansPro.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
title_text.TextColor3 = Color3.fromRGB(251, 142, 240)
title_text.BackgroundTransparency = 1
title_text.AnchorPoint = Vector2.new(0.5, 0.5)
title_text.Size = UDim2.new(0.8, 0, 1, 0)
title_text.BorderColor3 = Color3.fromRGB(0, 0, 0)
title_text.Text = 'slendytubies autofarm'
title_text.Position = UDim2.new(0.5, 0, 0.5, 0)

Create("UICorner", canvas)

credit = Create("TextLabel", canvas)
credit.TextWrapped = true
credit.BorderSizePixel = 0
credit.TextSize = 14
credit.TextXAlignment = Enum.TextXAlignment.Left
credit.TextYAlignment = Enum.TextYAlignment.Bottom
credit.TextScaled = true
credit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
credit.FontFace = Font.new('rbxasset://fonts/families/SourceSansPro.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
credit.TextColor3 = Color3.fromRGB(255, 255, 255)
credit.BackgroundTransparency = 1
credit.AnchorPoint = Vector2.new(0, 1)
credit.Size = UDim2.new(0.30627, 0, 0.1, 0)
credit.BorderColor3 = Color3.fromRGB(0, 0, 0)
credit.Text = 'by Stonifam'
credit.Position = UDim2.new(0.02, 0, 0.98, 0)

toggle_button = Create("TextButton", canvas) :: TextButton
toggle_button.TextWrapped = true
toggle_button.BorderSizePixel = 0
toggle_button.TextSize = 14
toggle_button.TextScaled = true
toggle_button.TextColor3 = Color3.fromRGB(251, 251, 251)
toggle_button.BackgroundColor3 = Color3.fromRGB(41, 41, 41)
toggle_button.FontFace = Font.new('rbxasset://fonts/families/SourceSansPro.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
toggle_button.AnchorPoint = Vector2.new(0.5, 0.5)
toggle_button.Size = UDim2.new(0.94699, 0, 0.18381, 0)
toggle_button.BorderColor3 = Color3.fromRGB(0, 0, 0)
toggle_button.Text = 'Toggle Autofarm'
toggle_button.Position = UDim2.new(0.5, 0, 0.34103, 0)

Create("UICorner", toggle_button)
Create("UITextSizeConstraint", toggle_button).MaxTextSize = 30

limit_textbox = Create("TextBox", canvas) :: TextBox
limit_textbox.CursorPosition = -1
limit_textbox.BorderSizePixel = 0
limit_textbox.TextWrapped = true
limit_textbox.TextSize = 14
limit_textbox.TextColor3 = Color3.fromRGB(251, 251, 251)
limit_textbox.TextScaled = true
limit_textbox.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
limit_textbox.FontFace = Font.new('rbxasset://fonts/families/Arial.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
limit_textbox.AnchorPoint = Vector2.new(0.5, 0.5)
limit_textbox.PlaceholderText = 'in seconds'
limit_textbox.Size = UDim2.new(0.41371, 0, 0.184, 0)
limit_textbox.Position = UDim2.new(0.76665, 0, 0.6, 0)
limit_textbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
limit_textbox.Text = '1'

Create("UITextSizeConstraint", limit_textbox).MaxTextSize = 30

Create("UICorner", limit_textbox)

limit_label = Create("TextLabel", canvas)
limit_label.TextWrapped = true
limit_label.BorderSizePixel = 0
limit_label.TextSize = 14
limit_label.TextXAlignment = Enum.TextXAlignment.Left
limit_label.TextScaled = true
limit_label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
limit_label.FontFace = Font.new('rbxasset://fonts/families/Arial.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
limit_label.TextColor3 = Color3.fromRGB(251, 251, 251)
limit_label.BackgroundTransparency = 1
limit_label.AnchorPoint = Vector2.new(0.5, 0.5)
limit_label.Size = UDim2.new(0.49451, 0, 0.24839, 0)
limit_label.BorderColor3 = Color3.fromRGB(0, 0, 0)
limit_label.Text = 'Teleport delay'
limit_label.Position = UDim2.new(0.27405, 0, 0.6, 0)

Create("UITextSizeConstraint", limit_label).MaxTextSize = 30

status_label = Create("TextLabel", canvas)
status_label.TextWrapped = true
status_label.BorderSizePixel = 0
status_label.TextSize = 14
status_label.TextScaled = true
status_label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
status_label.FontFace = Font.new('rbxasset://fonts/families/Arial.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
status_label.TextColor3 = Color3.fromRGB(251, 251, 251)
status_label.BackgroundTransparency = 1
status_label.AnchorPoint = Vector2.new(0.5, 0.5)
status_label.Size = UDim2.new(0.3745, 0, 0.18574, 0)
status_label.BorderColor3 = Color3.fromRGB(0, 0, 0)
status_label.Text = 'Idle'
status_label.Position = UDim2.new(0.78386, 0, 0.88674, 0)

Create("UITextSizeConstraint", status_label).MaxTextSize = 30

world = Create("ViewportFrame", canvas)
world.Interactable = false
world.BorderSizePixel = 0
world.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
world.AnchorPoint = Vector2.new(0.5, 1)
world.Ambient = Color3.fromRGB(209, 209, 209)
world.Size = UDim2.new(0.185, 0, 0.266, 0)
world.Position = UDim2.new(0.5, 0, 0.99, 0)
world.BorderColor3 = Color3.fromRGB(0, 0, 0)
world.BackgroundTransparency = 1

fumo = cloneref(game:GetService('InsertService')):CreateMeshPartAsync('rbxassetid://8222669660', Enum.CollisionFidelity.Default, Enum.RenderFidelity.Automatic)
fumo.Parent = world
fumo.TextureID = "rbxassetid://8222670302"
fumo.CFrame = CFrame.new(Vector3.new(0, 0.6, -7), Vector3.new(0, 0, 1))
fumo.Size = Vector3.new(4.94755, 6.35305, 4.26022)
fumo.Rotation = Vector3.new(180, 0, 180)
fumo.CastShadow = false

do -- drag gui by @AceFace101
    local UIS = cloneref(game:GetService('UserInputService'))
    local dragToggle = nil
    local dragInput = nil
    local dragStart = nil
    local startPos
    local function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(canvas, TweenInfo.new(0.15), {Position = Position}):Play()
    end
    UIS.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
            dragToggle = true
            dragStart = input.Position
            startPos = canvas.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)
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

local toggle = false

local limit = 1

local function can_convert(number:number?):number?
    local a,b = pcall(function()
        return tonumber(number)
    end)
    return a and b
end

limit_textbox.FocusLost:Connect(function()
    local input = can_convert(limit_textbox.Text)
    if not input then
        limit = 1
        limit_textbox.Text = '1'
    else
        limit = input
    end
end)

toggle_button.Activated:Connect(function()
    toggle = not toggle
    status_label.Text = toggle and 'Working' or 'Idle'
    status_label.TextColor3 = toggle and Color3.new(0,1,0) or Color3.new(251, 251, 251)

    if toggle then
        while toggle do
            if not get_char() then
                ReplicatedStorage.Remotes.sendCharacterSpawnRequest:FireServer("Player")
                Player.CharacterAdded:Wait()
                task.wait(1)
            end
            for _,custard:Model in ipairs(workspace.game.gameCustard:GetChildren()) do
                if not toggle then return end
                if custard and custard.Touch and custard:IsDescendantOf(workspace) and get_root() then
                    local root = get_root()
                    root.Anchored = false
                    root.CFrame = CFrame.new(custard.Touch.Position + Vector3.new(0,-3,0)) * CFrame.Angles(math.pi * 0.5, 0, 0)
                    root.Anchored = true
                    repeat task.wait() until not custard or (custard and custard:IsDescendantOf(nil))
                    task.wait(limit)
                    root.Anchored = false
                end
            end
            task.wait()
        end
    end
end)

bpm = 142

task.spawn(function()
    while task.wait() do
        fumo.CFrame = fumo.CFrame * CFrame.Angles(0,0.03*1,0)
    end
end)

OG_Size = fumo.Size
OG_Position = fumo.Position
task.spawn(function()
    while true do
        TweenService:Create(fumo, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, true), {Size = OG_Size + Vector3.new(3,-4,3)}):Play()
        TweenService:Create(fumo, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, true), {Position = OG_Position + Vector3.new(0,-2,0)}):Play()
        task.wait(60 / bpm)
    end
end)
