-- ============================================================
-- SERVICES
-- ============================================================
local Players       = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService  = game:GetService("TweenService")
local RunService    = game:GetService("RunService")
local VirtualUser   = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")

-- ============================================================
-- WIND UI LOAD
-- ============================================================
local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
))()

-- ============================================================
-- PLAYER / CHARACTER SETUP
-- ============================================================
local LocalPlayer = Players.LocalPlayer
local Character   = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid    = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Keep references fresh on respawn
LocalPlayer.CharacterAdded:Connect(function(newChar)
    Character       = newChar
    Humanoid        = newChar:WaitForChild("Humanoid")
    HumanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
end)

-- ============================================================
-- REMOTES
-- ============================================================
local Gameplay      = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gameplay")
local CoinCollected = Gameplay:WaitForChild("CoinCollected")
local RoundStart    = Gameplay:WaitForChild("RoundStart")
local RoundEndFade  = Gameplay:WaitForChild("RoundEndFade")

-- ============================================================
-- STATE FLAGS
-- ============================================================
local farmType      = "SnowToken"
local farmSpeed     = 20
local farmEnabled   = false
local killAllEnabled = false
local espEnabled    = false

-- ============================================================
-- ANTI-AFK
-- ============================================================
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

task.spawn(function()
    while true do
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        task.wait(60)
    end
end)

-- ============================================================
-- COIN AUTOFARM
-- ============================================================
local function getNearestCoin()
    local nearest, minDist = nil, math.huge
    for _, obj in pairs(workspace:GetChildren()) do
        local container = obj:FindFirstChild("CoinContainer")
        if container then
            for _, coin in pairs(container:GetChildren()) do
                if coin:GetAttribute("CoinType") == farmType then
                    local dist = (coin.Position - HumanoidRootPart.Position).Magnitude
                    if dist < minDist then
                        minDist = dist
                        nearest = coin
                    end
                end
            end
        end
    end
    return nearest, minDist
end

task.spawn(function()
    while true do
        if farmEnabled and Character and HumanoidRootPart then
            local coin, dist = getNearestCoin()
            if coin then
                local tween = TweenService:Create(
                    HumanoidRootPart,
                    TweenInfo.new(dist / farmSpeed, Enum.EasingStyle.Linear),
                    { CFrame = coin.CFrame }
                )
                tween:Play()
                task.wait()
                if not coin:FindFirstChild("TouchInterest") then
                    tween:Cancel()
                end
            end
        end
        task.wait(0.1)
    end
end)

-- ============================================================
-- KILL ALL (Murderer)
-- ============================================================
task.spawn(function()
    while true do
        if killAllEnabled and Character then
            local knife = LocalPlayer.Backpack:FindFirstChild("Knife")
                       or Character:FindFirstChild("Knife")
            if knife then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local targetHumanoid = player.Character:FindFirstChild("Humanoid")
                        if targetHumanoid then
                            ReplicatedStorage.Remotes.Gameplay.KnifeHit:FireServer(targetHumanoid, "Knife")
                        end
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)

-- ============================================================
-- ESP
-- ============================================================
local INNOCENT_COLOR = Color3.fromRGB(0, 255, 0)
local MURDERER_COLOR = Color3.fromRGB(255, 0, 0)
local SHERIFF_COLOR  = Color3.fromRGB(0, 0, 255)

local function addEspToPlayer(player)
    local char = player.Character
    if not char or player == LocalPlayer then return end
    if char:FindFirstChild("EspHighlight") then return end

    local highlight = Instance.new("Highlight")
    highlight.Name             = "EspHighlight"
    highlight.Parent           = char
    highlight.FillColor        = INNOCENT_COLOR
    highlight.FillTransparency = 0.5

    local root = char:WaitForChild("HumanoidRootPart")

    local bill = Instance.new("BillboardGui")
    bill.Name        = "EspBill"
    bill.Parent      = root
    bill.AlwaysOnTop = true
    bill.Size        = UDim2.new(0, 77, 0, 17)
    bill.MaxDistance = 600

    local label = Instance.new("TextLabel")
    label.Name                 = "EspText"
    label.Parent               = bill
    label.Text                 = player.Name
    label.Size                 = UDim2.new(1, 0, 1, 0)
    label.TextScaled           = true
    label.TextColor3           = Color3.new(0, 0, 0)
    label.BackgroundTransparency = 0.5
    label.BackgroundColor3     = INNOCENT_COLOR

    local stroke = Instance.new("UIStroke")
    stroke.Parent          = label
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Thickness       = 2

    local corner = Instance.new("UICorner")
    corner.Parent       = label
    corner.CornerRadius = UDim.new(0, 9)
end

local function updateEspColors()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            local highlight = char:FindFirstChild("EspHighlight")
            local root      = char:FindFirstChild("HumanoidRootPart")
            if highlight and root then
                local bill  = root:FindFirstChild("EspBill")
                local label = bill and bill:FindFirstChild("EspText")
                local color = INNOCENT_COLOR
                if player.Backpack:FindFirstChild("Knife") or char:FindFirstChild("Knife") then
                    color = MURDERER_COLOR
                elseif player.Backpack:FindFirstChild("Gun") or char:FindFirstChild("Gun") then
                    color = SHERIFF_COLOR
                end
                highlight.FillColor = color
                if label then
                    label.BackgroundColor3 = color
                end
            end
        end
    end
end

local espConnection
local function startEsp()
    for _, player in pairs(Players:GetPlayers()) do
        addEspToPlayer(player)
    end
    espConnection = RunService.Heartbeat:Connect(updateEspColors)
end

local function stopEsp()
    if espConnection then
        espConnection:Disconnect()
        espConnection = nil
    end
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            local h = player.Character:FindFirstChild("EspHighlight")
            if h then h:Destroy() end
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local b = root:FindFirstChild("EspBill")
                if b then b:Destroy() end
            end
        end
    end
end

-- ============================================================
-- WIND UI — THEMES
-- ============================================================
WindUI:AddTheme({
    Name        = "Halloween",
    Accent      = Color3.fromHex("#271700"),
    Dialog      = Color3.fromHex("#3f2400"),
    Outline     = Color3.fromHex("#FFFFFF"),
    Text        = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Background  = Color3.fromHex("#3f2400"),
    Button      = Color3.fromHex("#52525b"),
    Icon        = Color3.fromHex("#ff9100"),
})

WindUI:AddTheme({
    Name        = "Crimson",
    Accent      = Color3.fromHex("#271700"),
    Dialog      = Color3.fromHex("#2b0000"),
    Outline     = Color3.fromHex("#FFFFFF"),
    Text        = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Background  = Color3.fromHex("#2b0000"),
    Button      = Color3.fromHex("#52525b"),
    Icon        = Color3.fromHex("#b82500"),
})

WindUI:AddTheme({
    Name        = "Ocean",
    Accent      = Color3.fromHex("#271700"),
    Dialog      = Color3.fromHex("#002c41"),
    Outline     = Color3.fromHex("#FFFFFF"),
    Text        = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Background  = Color3.fromHex("#002c41"),
    Button      = Color3.fromHex("#52525b"),
    Icon        = Color3.fromHex("#0077ff"),
})

WindUI:AddTheme({
    Name        = "Dark",
    Accent      = Color3.fromHex("#18181b"),
    Dialog      = Color3.fromHex("#161616"),
    Outline     = Color3.fromHex("#FFFFFF"),
    Text        = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Background  = Color3.fromHex("#101010"),
    Button      = Color3.fromHex("#52525b"),
    Icon        = Color3.fromHex("#a1a1aa"),
})

WindUI:SetTheme("Dark")

-- ============================================================
-- WIND UI — WINDOW
-- ============================================================
local Window = WindUI:CreateWindow({
    Title                      = "MagicHub V2",
    Icon                       = "crown",
    Author                     = "by Magic On Discord",
    Folder                     = "MagicScriptHub",
    Size                       = UDim2.fromOffset(580, 460),
    MinSize                    = Vector2.new(560, 350),
    MaxSize                    = Vector2.new(850, 560),
    Transparent                = true,
    Theme                      = "Dark",
    Resizable                  = true,
    SideBarWidth               = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar              = false,
    ScrollBarEnabled           = true,
    User                       = { Enabled = true, Anonymous = false, Callback = function() end },
})

Window:EditOpenButton({
    Title           = "Open Button",
    Icon            = "monitor",
    CornerRadius    = UDim.new(0, 16),
    StrokeThickness = 2,
    Color           = ColorSequence.new(Color3.fromHex("#d5b4ff"), Color3.fromHex("#7b2cbf")),
    OnlyMobile      = false,
    Enabled         = true,
    Draggable       = true,
})

Window:Tag({ Title = "V 1", Color = Color3.fromHex("#a855f7"), Radius = 8 })
Window:ToggleTransparency(true)

Window:CreateTopbarButton("DarkMode", "moon", function()
    WindUI:SetTheme("Dark")
end, 990)

Window:CreateTopbarButton("Event", "candy", function() end, 990)

-- ============================================================
-- SECTION: MAIN > PLAYER TAB
-- ============================================================
local MainSection = Window:Section({ Title = "Main", Icon = "monitor", Opened = false })
local PlayerTab   = MainSection:Tab({ Title = "Player", Icon = "gamepad-2", Locked = false })

PlayerTab:Paragraph({
    Title         = "Thank you for using!",
    Desc          = "We are really thankful for the people who support us <3 -xqcFerr",
    ImageSize     = 30,
    ThumbnailSize = 80,
    Locked        = false,
    Buttons       = {},
})

PlayerTab:Button({
    Title    = "Copy Discord",
    Desc     = "Copies our Discord join link",
    Callback = function()
        setclipboard("https://discord.gg/9dUFqm24za")
    end,
})

PlayerTab:Button({
    Title    = "Pls Copy It",
    Desc     = "Copies Guns.lol",
    Callback = function()
        setclipboard("https://guns.lol/magic_master0")
    end,
})

PlayerTab:Divider()

PlayerTab:Slider({
    Title    = "Player Speed!",
    Step     = 1,
    Value    = { Min = 20, Max = 500, Default = 20 },
    Callback = function(val)
        if Character and Character:FindFirstChild("Humanoid") then
            Character.Humanoid.WalkSpeed = val
        end
    end,
})

PlayerTab:Slider({
    Title    = "Jump Power!",
    Step     = 1,
    Value    = { Min = 50, Max = 1000, Default = 70 },
    Callback = function(val)
        if Character and Character:FindFirstChild("Humanoid") then
            Character.Humanoid.JumpPower = val
        end
    end,
})

-- ============================================================
-- SECTION: FARMS > AUTOFARM TAB
-- ============================================================
local FarmsSection = Window:Section({ Title = "Farms", Icon = "bitcoin", Opened = false })
local AutofarmTab  = FarmsSection:Tab({ Title = "Autofarm Settings", Icon = "settings", Locked = false })

AutofarmTab:Paragraph({ Title = "Instructions!", Desc = "We suggest doing only 22 below", Locked = false })
AutofarmTab:Divider()

AutofarmTab:Dropdown({
    Title    = "Farm Method",
    Values   = { "Egg", "Coin", "Candy", "SnowToken" },
    Value    = "SnowToken",
    Callback = function(val)
        farmType = val
    end,
})

AutofarmTab:Slider({
    Title    = "Auto Set Speed",
    Step     = 1,
    Value    = { Min = 5, Max = 25, Default = 20 },
    Callback = function(val)
        farmSpeed = val
    end,
})

AutofarmTab:Divider()

AutofarmTab:Toggle({
    Title    = "Enable Autofarm",
    Desc     = "Automatically farms the selected coin type.",
    Icon     = "check",
    Type     = "Checkbox",
    Default  = false,
    Callback = function(enabled)
        farmEnabled = enabled
        if enabled then
            WindUI:Notify({
                Title   = "Autofarm Enabled",
                Content = "Farming will start when the round begins (or now if in round): " .. farmType,
                Duration = 3,
                Icon    = "check",
            })
        else
            WindUI:Notify({
                Title    = "Autofarm Disabled",
                Content  = "Autofarm stopped.",
                Duration = 3,
                Icon     = "x",
            })
        end
    end,
})

-- ============================================================
-- SECTION: OPTIMIZATION
-- ============================================================
local OptSection = Window:Section({ Title = "Optimization", Icon = "hard-drive", Opened = false })
local OptTab     = OptSection:Tab({ Title = "Low Optimization Mode", Icon = "turtle", Locked = false })

OptTab:Paragraph({
    Title  = "Information!",
    Desc   = "This mode disables shadows and lowers Roblox graphics.",
    Locked = false,
})
OptTab:Divider()

OptTab:Button({
    Title    = "Enable Low Mode",
    Desc     = "Disables shadows for all parts in the workspace",
    Locked   = false,
    Callback = function()
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                obj.CastShadow = false
            end
        end
    end,
})

-- ============================================================
-- SECTION: ESP
-- ============================================================
local EspSection = Window:Section({ Title = "ESP", Icon = "eye", Opened = false })
local EspTab     = EspSection:Tab({ Title = "Main", Icon = "pin", Locked = false })

EspTab:Paragraph({
    Title  = "ESP",
    Desc   = "Green = Innocent, Red = Murderer, Blue = Sheriff",
    Locked = false,
})

EspTab:Button({
    Title    = "Toggle ESP",
    Desc     = "Is still on dev but works great!",
    Locked   = false,
    Callback = function()
        espEnabled = not espEnabled
        if espEnabled then
            startEsp()
        else
            stopEsp()
        end
    end,
})

-- ============================================================
-- SECTION: MURDERER
-- ============================================================
local MurSection = Window:Section({ Title = "Murderer Section", Icon = "axe", Opened = false })
local MurTab     = MurSection:Tab({ Title = "Murderer Tools", Icon = "axe", Locked = false })

MurTab:Paragraph({
    Title  = "Coming Soon!",
    Desc   = "Murderer Section is still in beta, expect bugs",
    Locked = false,
})

MurTab:Toggle({
    Title    = "Kill All",
    Desc     = "Automatically kills everyone if you have a knife",
    Icon     = "check",
    Type     = "Checkbox",
    Default  = false,
    Callback = function(enabled)
        killAllEnabled = enabled
        if enabled then
            WindUI:Notify({ Title = "Kill All Enabled", Content = "Will kill all if you are murderer.", Duration = 3, Icon = "check" })
        else
            WindUI:Notify({ Title = "Kill All Disabled", Content = "Stopped.", Duration = 3, Icon = "x" })
        end
    end,
})

-- ============================================================
-- SECTION: SHERIFF
-- ============================================================
local SherSection = Window:Section({ Title = "Sheriff Section", Icon = "siren", Opened = false })
local SherTab     = SherSection:Tab({ Title = "Sheriff Tools", Icon = "siren", Locked = false })

SherTab:Paragraph({
    Title  = "Coming Soon!",
    Desc   = "Sheriff features coming in next update",
    Locked = false,
})

-- ============================================================
-- SECTION: ITEM SPAWNER
-- ============================================================
local SpawnSection = Window:Section({ Title = "Item Spawner", Icon = "gem", Opened = false })
local SpawnTab     = SpawnSection:Tab({ Title = "Main Spawner", Icon = "terminal", Locked = false })

SpawnTab:Paragraph({
    Title  = "Select item!",
    Desc   = "XenoGun, XenoKnife, Gingerscope, Harvester, Icepiercer, SunsetKnife, SunsetGun...",
    Locked = false,
})
SpawnTab:Divider()

local itemInput = SpawnTab:Input({
    Title       = "Item Name",
    Desc        = "Example: XenoKnife",
    InputIcon   = "sword",
    Type        = "Input",
    Placeholder = "Enter text...",
    Callback    = function() end,
})

SpawnTab:Divider()

SpawnTab:Button({
    Title    = "Spawn Item",
    Desc     = "Need to be typed above first!",
    Locked   = false,
    Callback = function()
        local itemName = itemInput.Value
        if itemName and itemName ~= "" then
            local RS            = game:GetService("ReplicatedStorage")
            local boxController = RS:WaitForChild("Remotes"):WaitForChild("Shop"):WaitForChild("BoxController")
            boxController:Fire("KnifeBox4", itemName)
            WindUI:Notify({ Title = "Success", Content = "Weapon Spawned!", Duration = 3, Icon = "check" })
            itemInput:Clear()
        else
            WindUI:Notify({ Title = "Error", Content = "Please enter an item name.", Duration = 3, Icon = "x" })
        end
    end,
})

-- ============================================================
-- SETTINGS TAB (root-level)
-- ============================================================
Window:Divider()
local SettingsTab = Window:Tab({ Title = "Settings", Icon = "settings", Locked = false })

SettingsTab:Keybind({
    Title    = "Keybind",
    Desc     = "Keybind to open/close UI",
    Value    = "G",
    Callback = function() end,
})

SettingsTab:Divider()

SettingsTab:Button({
    Title    = "Copy Job Id!",
    Desc     = "Copy your Job Id so someone can join you!",
    Locked   = false,
    Callback = function()
        setclipboard(game.JobId)
        WindUI:Notify({ Title = "Copied!", Content = "Job Id copied to clipboard.", Duration = 3, Icon = "check" })
    end,
})

local jobIdInput = SettingsTab:Input({
    Title       = "Join With Job Id!",
    Desc        = "Joins with someone else's Job Id!",
    Value       = nil,
    InputIcon   = "bird",
    Type        = "Input",
    Placeholder = "Enter Job Id...",
    Callback    = function() end,
})

SettingsTab:Button({
    Title    = "Join!",
    Desc     = "Join the Job Id added above!",
    Locked   = false,
    Callback = function()
        local id = jobIdInput.Value
        if id and id ~= "" then
            TeleportService:TeleportToPlaceInstance(142823291, id, LocalPlayer)
        else
            WindUI:Notify({ Title = "Error", Content = "Please enter a Job Id.", Duration = 3, Icon = "x" })
        end
    end,
})

SettingsTab:Divider()

SettingsTab:Button({
    Title    = "Rejoin!",
    Desc     = "Rejoin your current server in case of bugs!",
    Locked   = false,
    Callback = function()
        TeleportService:TeleportToPlaceInstance(142823291, game.JobId, LocalPlayer)
    end,
})

-- ============================================================
-- THEMES TAB (root-level)
-- ============================================================
local ThemesTab = Window:Tab({ Title = "Themes", Icon = "paintbrush", Locked = false })

ThemesTab:Dropdown({
    Title    = "Select Theme",
    Desc     = "Select Gui Theme",
    Values   = { "Halloween", "Crimson", "Ocean", "Dark" },
    Value    = "Dark",
    Callback = function(theme)
        WindUI:SetTheme(theme)
    end,
})

ThemesTab:Toggle({
    Title    = "Gui Transparency",
    Desc     = "Enable/Disable Gui Transparency",
    Icon     = "search",
    Type     = "Checkbox",
    Value    = true,
    Callback = function(enabled)
        Window:ToggleTransparency(enabled)
    end,
})
