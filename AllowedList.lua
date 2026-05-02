--[[
    Magic Hub — Titan TD Clean Script
    GuiKey system added | AntiBan tab | GraveyardV2 removed | continue fixed
]]

-- ============================================================
-- SERVICES & LOCALS
-- ============================================================
local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService        = game:GetService("RunService")
local TweenService      = game:GetService("TweenService")
local Lighting          = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
-- PlayerGui is fetched lazily inside functions (safer on mobile executors)
local function getPlayerGui()
    return LocalPlayer:FindFirstChildOfClass("PlayerGui")
        or LocalPlayer:WaitForChild("PlayerGui", 10)
end
-- CoreGui is always accessible from executors; used for GuiKey overlay
local CoreGui = game:GetService("CoreGui")

-- ============================================================
-- KEY SYSTEM CONFIG  (thay đổi key tại đây)
-- ============================================================
local VALID_KEYS = {
    "MAGIC-2024",
    "MAGICMASTER-KEY",
}

local KEY_FILE_PATH  = "MagicScript/KeySystem.lua"
local KEY_FOLDER     = "MagicScript"

-- ============================================================
-- KEY FILE HELPERS
-- ============================================================
local function isValidKey(key)
    if not key or key == "" then return false end
    for _, k in ipairs(VALID_KEYS) do
        if key == k then return true end
    end
    return false
end

local function saveKey(key)
    local ok = pcall(function()
        if not isfolder(KEY_FOLDER) then makefolder(KEY_FOLDER) end
        writefile(KEY_FILE_PATH, key)
    end)
    return ok
end

local function loadSavedKey()
    local ok, key = pcall(function()
        if not isfile(KEY_FILE_PATH) then return nil end
        return readfile(KEY_FILE_PATH)
    end)
    return (ok and key) or nil
end

local function clearSavedKey()
    pcall(function()
        if isfile(KEY_FILE_PATH) then delfile(KEY_FILE_PATH) end
    end)
end

-- ============================================================
-- MAIN SCRIPT (runs after key is verified)
-- ============================================================
local mainScriptLoaded = false

local function RunMainScript()
    if mainScriptLoaded then return end
    mainScriptLoaded = true

    -- ========================================================
    -- GLOBAL STATE INITIALIZATION
    -- ========================================================
    local env = getgenv()

    if not env.MainTabConfig then
        env.MainTabConfig = {
            AutoSkip               = false,
            AutoSpeed2x            = false,
            AutoSpeed3x            = false,
            AutoPlayAgain          = false,
            AutoReturn             = false,
            AutoDifficulty         = false,
            AutoJoinMap            = false,
            SelectedDifficulty     = nil,
            SelectedDifficultyName = nil,
            SelectedMap            = nil,
            SelectedMapName        = nil,
        }
    end

    if not env.AutoFarmConfig then
        env.AutoFarmConfig = {
            GraveyardV1Active  = false,
            DojoActive         = false,
            AutoWinV1Active    = false,
            AutoWinV2Active    = false,
            WinterActive       = false,
            SpaceV1Active      = false,
            SpaceV2Active      = false,
            IsRunning          = false,
            CurrentStrategy    = nil,
            FirstRunComplete   = false,
            MatchCount         = 0,
        }
    end

    if not env.AntiBanConfig then
        env.AntiBanConfig = {
            PlacementOffset     = 1.5,
            MatchesBeforeReturn = 100,
            AutoReturnEnabled   = false,
            AntiAFKEnabled      = false,
            AFKLoaded           = false,
        }
    end

    if not env.PerformanceConfig then
        env.PerformanceConfig = {
            RenderStopped       = false,
            BlackScreenEnabled  = false,
            BlackScreenGui      = nil,
        }
    end

    if not env.LowGraphicsConfig then
        env.LowGraphicsConfig = {
            Enabled          = false,
            OriginalSettings = nil,
            RemovedObjects   = {},
        }
    end

    if not env.GlobalTracking then
        env.GlobalTracking = {
            enabled    = false,
            unitIDs    = {},
            connection = nil,
        }
    end

    if not env.MainTabToggles  then env.MainTabToggles  = {} end
    if not env.AntiBanToggles  then env.AntiBanToggles  = {} end
    if not env.MagicHubLocked  then env.MagicHubLocked  = false end

    -- ========================================================
    -- LOAD WIND UI LIBRARY
    -- ========================================================
    print("[MAGIC HUB] Starting Magic Hub...")
    local WindUI = loadstring(game:HttpGet(
        "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
    ))()

    -- ========================================================
    -- CREATE HUB WINDOW
    -- ========================================================
    local Hub = WindUI:CreateWindow({
        Title    = "Magic Hub",
        Icon     = "crown",
        Author   = "by Magic_Master",
        Folder   = "MagicScript",
        Size     = UDim2.fromOffset(580, 460),
        MinSize  = Vector2.new(560, 350),
        MaxSize  = Vector2.new(850, 560),
        Transparent  = true,
        Theme        = "Dark",
        Resizable    = true,
        SideBarWidth = 200,
        BackgroundImageTransparency = 0.42,
        HideSearchBar = true,
        User = { Enabled = true, Anonymous = true },
        OpenButton = {
            Title           = "Magic Hub",
            CornerRadius    = UDim.new(1, 0),
            StrokeThickness = 3,
            Enabled         = true,
            Draggable       = true,
            OnlyMobile      = false,
            Color           = ColorSequence.new(
                Color3.fromHex("#8013E8"),
                Color3.fromHex("#150F26")
            ),
        },
    })

    env.MagicHubWindow = Hub
    env.MagicHubLoaded = true
    env.WindUI         = WindUI

    Hub:SetToggleKey(Enum.KeyCode.LeftShift)
    Hub:Tag({ Title = "V 1", Color = Color3.fromHex("#8013E8"), Radius = 10 })
    print("[MAGIC HUB] Press Left Shift to toggle UI. Script ready!")

    -- ========================================================
    -- TABS
    -- ========================================================
    local MainTab     = Hub:Tab({ Title = "Main",      Icon = "plus"              })
    local AutoFarmTab = Hub:Tab({ Title = "Auto Farm", Icon = "book-text"         })
    local MiscTab     = Hub:Tab({ Title = "Misc",      Icon = "wrench"            })
    local AntiBanTab  = Hub:Tab({ Title = "AntiBan",   Icon = "shield-cog-corner" })
    local SettingsTab = Hub:Tab({ Title = "Settings",  Icon = "settings"          })

    print("[MAGIC HUB] All tabs created")

    -- ========================================================
    -- HELPER FUNCTIONS
    -- ========================================================
    local function isGameActive()
        local ok, result = pcall(function()
            local gameGui = getPlayerGui():FindFirstChild("GameGui")
            if not gameGui then return true end
            local gameEnd = gameGui.Screen.Middle:FindFirstChild("GameEnd")
            if gameEnd then return not gameEnd.Visible end
            return true
        end)
        return ok and result
    end

    local function isGameEnded()
        local ok, result = pcall(function()
            local gameGui = PlayerGui:FindFirstChild("GameGui")
            if not gameGui then return false end
            local gameEnd = gameGui.Screen.Middle:FindFirstChild("GameEnd")
            return gameEnd and gameEnd.Visible == true
        end)
        return ok and result
    end

    local function getCash()
        local ok, result = pcall(function()
            local gameGui = PlayerGui:FindFirstChild("GameGui")
            if not gameGui then return 0 end
            local curr = gameGui:FindFirstChild("CurrencyDisplay", true)
            if not curr then return 0 end
            local seeds = curr:FindFirstChild("SeedsDisplay")
            if seeds then
                local title = seeds:FindFirstChild("Title")
                if title then
                    local n = title.Text:match("(%d+)")
                    return tonumber(n) or 0
                end
            end
            return 0
        end)
        return (ok and result) or 0
    end

    local function getMyUnits()
        local units = {}
        pcall(function()
            local map = workspace:FindFirstChild("Map")
            if not map then return end
            local entities = map:FindFirstChild("Entities")
            if not entities then return end
            for _, v in ipairs(entities:GetChildren()) do
                if v:IsA("Model") and v:GetAttribute("Owner") == LocalPlayer.UserId then
                    table.insert(units, v)
                end
            end
        end)
        return units
    end

    local function placeUnit(unitId, cf, rotation)
        local ok = pcall(function()
            local rf    = ReplicatedStorage:WaitForChild("RemoteFunctions", 5)
            if not rf then return end
            local place = rf:WaitForChild("PlaceUnit", 5)
            if not place then return end
            local offset = Vector3.new(
                (math.random() - 0.5) * 2 * (env.AntiBanConfig.PlacementOffset or 1.5),
                0,
                (math.random() - 0.5) * 2 * (env.AntiBanConfig.PlacementOffset or 1.5)
            )
            place:InvokeServer(unitId, cf + offset, rotation)
        end)
        return ok
    end

    local function upgradeUnit(unit, targetLevel, costTable, label)
        if not unit then return end
        local rf = ReplicatedStorage:WaitForChild("RemoteFunctions", 5)
        if not rf then return end
        local upgradeRemote = rf:WaitForChild("UpgradeUnit", 5)
        if not upgradeRemote then return end
        for lvl = 1, targetLevel do
            while isGameActive() do
                local cost = costTable and costTable[lvl] or 0
                while getCash() < cost do
                    if not isGameActive() then return end
                    task.wait(0.2)
                end
                local ok = pcall(function()
                    upgradeRemote:InvokeServer(unit)
                end)
                if ok then
                    print(("[UPGRADE] %s -> Lvl %d"):format(label or "Unit", lvl + 1))
                    task.wait(0.3)
                    break
                end
                task.wait(0.1)
            end
            if not isGameActive() then return end
        end
    end

    local function sellUnit(unit)
        if not unit then return end
        pcall(function()
            local rf   = ReplicatedStorage:WaitForChild("RemoteFunctions", 5)
            if not rf then return end
            local sell = rf:WaitForChild("SellUnit", 5)
            if sell then sell:InvokeServer(unit) end
        end)
    end

    local function joinMap(mapId, mapName, attempts)
        attempts = attempts or 10
        for i = 1, attempts do
            local ok = pcall(function()
                local rf = ReplicatedStorage:WaitForChild("RemoteFunctions", 5)
                if rf then
                    local joinRemote = rf:FindFirstChild("LobbySetMap_8")
                    if joinRemote then
                        joinRemote:InvokeServer(mapId)
                    end
                end
            end)
            if ok then
                task.wait(1)
                local map = workspace:FindFirstChild("Map")
                if map then
                    print(("[MAP] Entered %s"):format(mapName))
                    return true
                end
            end
            task.wait(2)
        end
        return false
    end

    local function goToLobby()
        pcall(function()
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118.89, 78, 779.65)
        end)
    end

    -- ========================================================
    -- MAIN TAB
    -- ========================================================
    task.spawn(function()
        task.wait(0.5)
        print("[MAIN TAB] Loading content...")

        MainTab:Section({ Title = "Game Automation", TextSize = 16, TextTransparency = 0.3 })
        MainTab:Space()

        local autoSkipToggle = MainTab:Toggle({
            Flag    = "AutoSkip",
            Title   = "Auto Skip Wave",
            Desc    = "Automatically skips to the next wave when possible.",
            Default = env.MainTabConfig.AutoSkip,
            Callback = function(val) env.MainTabConfig.AutoSkip = val end,
        })
        env.MainTabToggles.AutoSkip = autoSkipToggle
        MainTab:Space()

        local autoSpeed3xToggle

        local autoSpeed2xToggle = MainTab:Toggle({
            Flag    = "AutoSpeed2x",
            Title   = "Auto x2 Speed",
            Desc    = "Keeps the game running at 2x speed.",
            Default = env.MainTabConfig.AutoSpeed2x,
            Callback = function(val)
                env.MainTabConfig.AutoSpeed2x = val
                if val then
                    if env.MainTabConfig.AutoSpeed3x then
                        env.MainTabConfig.AutoSpeed3x = false
                        if autoSpeed3xToggle then autoSpeed3xToggle:Set(false) end
                    end
                    task.spawn(function()
                        while env.MainTabConfig.AutoSpeed2x do
                            pcall(function()
                                local noInset = PlayerGui:FindFirstChild("GameGuiNoInset")
                                if not noInset then return end
                                local waveControls = noInset.Screen.Top:FindFirstChild("WaveControls")
                                if not waveControls then return end
                                local tickBtn = waveControls:FindFirstChild("TickSpeed")
                                if not tickBtn then return end
                                local speedLabel = tickBtn:FindFirstChild("TextLabel")
                                    or tickBtn:FindFirstChildOfClass("TextLabel")
                                local currentText = speedLabel and speedLabel.Text or ""
                                if currentText:find("1x") or currentText:find("x1") then
                                    tickBtn.MouseButton1Click:Fire()
                                    task.wait(0.15)
                                elseif currentText:find("3x") or currentText:find("x3") then
                                    tickBtn.MouseButton1Click:Fire()
                                    task.wait(0.15)
                                    tickBtn.MouseButton1Click:Fire()
                                    task.wait(0.15)
                                end
                            end)
                            task.wait(1)
                        end
                    end)
                end
            end,
        })
        env.MainTabToggles.AutoSpeed2x = autoSpeed2xToggle
        MainTab:Space()

        autoSpeed3xToggle = MainTab:Toggle({
            Flag    = "AutoSpeed3x",
            Title   = "Auto x3 Speed",
            Desc    = "Keeps the game running at 3x speed.",
            Default = env.MainTabConfig.AutoSpeed3x,
            Callback = function(val)
                env.MainTabConfig.AutoSpeed3x = val
                if val then
                    if env.MainTabConfig.AutoSpeed2x then
                        env.MainTabConfig.AutoSpeed2x = false
                        if autoSpeed2xToggle then autoSpeed2xToggle:Set(false) end
                    end
                    task.spawn(function()
                        while env.MainTabConfig.AutoSpeed3x do
                            pcall(function()
                                local noInset = PlayerGui:FindFirstChild("GameGuiNoInset")
                                if not noInset then return end
                                local waveControls = noInset.Screen.Top:FindFirstChild("WaveControls")
                                if not waveControls then return end
                                local tickBtn = waveControls:FindFirstChild("TickSpeed")
                                if not tickBtn then return end
                                local speedLabel = tickBtn:FindFirstChild("TextLabel")
                                    or tickBtn:FindFirstChildOfClass("TextLabel")
                                local currentText = speedLabel and speedLabel.Text or ""
                                if currentText:find("1x") or currentText:find("x1") then
                                    tickBtn.MouseButton1Click:Fire()
                                    task.wait(0.15)
                                    tickBtn.MouseButton1Click:Fire()
                                    task.wait(0.15)
                                elseif currentText:find("2x") or currentText:find("x2") then
                                    tickBtn.MouseButton1Click:Fire()
                                    task.wait(0.15)
                                end
                            end)
                            task.wait(1)
                        end
                    end)
                end
            end,
        })
        env.MainTabToggles.AutoSpeed3x = autoSpeed3xToggle
        MainTab:Space()

        local autoPlayAgainToggle = MainTab:Toggle({
            Flag    = "AutoPlayAgain",
            Title   = "Auto Play Again",
            Desc    = "Automatically clicks Play Again when a game ends.",
            Default = env.MainTabConfig.AutoPlayAgain,
            Callback = function(val) env.MainTabConfig.AutoPlayAgain = val end,
        })
        env.MainTabToggles.AutoPlayAgain = autoPlayAgainToggle
        MainTab:Space()

        task.spawn(function()
            local lastGameEndState = false
            while true do
                task.wait(0.5)
                if env.MainTabConfig.AutoPlayAgain then
                    pcall(function()
                        local gameGui = PlayerGui:FindFirstChild("GameGui")
                        if not gameGui then return end
                        local gameEnd = gameGui.Screen.Middle:FindFirstChild("GameEnd")
                        if not gameEnd then return end
                        if gameEnd.Visible and not lastGameEndState then
                            lastGameEndState = true
                            task.wait(1.5)
                            for _, btn in ipairs(gameEnd:GetDescendants()) do
                                local isBtn = btn:IsA("TextButton") or btn:IsA("ImageButton")
                                if isBtn then
                                    local name = btn.Name:lower()
                                    local text = (btn:IsA("TextButton") and btn.Text:lower()) or ""
                                    if name:find("play") or name:find("again") or name:find("retry")
                                       or text:find("play") or text:find("again") or text:find("retry") then
                                        btn.MouseButton1Click:Fire()
                                        print("[AUTO PLAY AGAIN] Clicked: " .. btn.Name)
                                        break
                                    end
                                end
                            end
                        elseif not gameEnd.Visible then
                            lastGameEndState = false
                        end
                    end)
                else
                    lastGameEndState = false
                end
            end
        end)

        MainTab:Toggle({
            Flag    = "AutoReturn",
            Title   = "Auto Return",
            Desc    = "Automatically returns to lobby after a match.",
            Default = env.MainTabConfig.AutoReturn,
            Callback = function(val) env.MainTabConfig.AutoReturn = val end,
        })

        MainTab:Space({ Columns = 2 })
        MainTab:Section({ Title = "Auto Select Difficulty", TextSize = 16, TextTransparency = 0.3 })
        MainTab:Space()

        local difficultyMap = {
            Easy       = "dif_easy",
            Normal     = "dif_normal",
            Hard       = "dif_hard",
            Insane     = "dif_insane",
            Impossible = "dif_impossible",
            Apocalypse = "dif_apocalypse",
        }

        local difficultyToggle = MainTab:Toggle({
            Flag    = "AutoDifficulty",
            Title   = "Auto Difficulty",
            Desc    = "Automatically selects a difficulty each match.",
            Default = env.MainTabConfig.AutoDifficulty,
            Callback = function(val)
                env.MainTabConfig.AutoDifficulty = val
                if val and env.MainTabConfig.SelectedDifficulty then
                    task.spawn(function()
                        local alreadyDone = false
                        while env.MainTabConfig.AutoDifficulty do
                            if not alreadyDone then
                                pcall(function()
                                    local rf = ReplicatedStorage:WaitForChild("RemoteFunctions", 5)
                                    if rf then
                                        local setDiff = rf:FindFirstChild("LobbySetDifficulty_8")
                                        if setDiff then
                                            setDiff:InvokeServer(env.MainTabConfig.SelectedDifficulty)
                                            alreadyDone = true
                                        end
                                    end
                                end)
                            end
                            task.wait(1)
                        end
                    end)
                end
            end,
        })
        env.MainTabToggles.AutoDifficulty = difficultyToggle

        MainTab:Dropdown({
            Flag   = "SelectedDifficulty",
            Title  = "Difficulty",
            Values = {
                { Title = "Easy" }, { Title = "Normal" }, { Title = "Hard" },
                { Title = "Insane" }, { Title = "Impossible" }, { Title = "Apocalypse" },
            },
            Callback = function(selected)
                env.MainTabConfig.SelectedDifficultyName = selected.Title
                env.MainTabConfig.SelectedDifficulty = difficultyMap[selected.Title]
            end,
        })
        MainTab:Space()

        MainTab:Space({ Columns = 2 })
        MainTab:Section({ Title = "Auto Select Map", TextSize = 16, TextTransparency = 0.3 })
        MainTab:Space()

        local mapIdMap = {
            Garden              = "map_farm",
            Jungle              = "map_jungle",
            ["Tropical Island"] = "map_island",
            ["Toxic Facility"]  = "map_toxic",
            ["Back Garden"]     = "map_back_garden",
            Dojo                = "map_dojo",
            Graveyard           = "map_graveyard",
            Space               = "map_space",
        }

        local autoJoinMapToggle = MainTab:Toggle({
            Flag    = "AutoJoinMap",
            Title   = "Auto Join Map",
            Desc    = "Automatically selects and joins the chosen map.",
            Default = env.MainTabConfig.AutoJoinMap,
            Callback = function(val)
                env.MainTabConfig.AutoJoinMap = val
                if val and env.MainTabConfig.SelectedMap then
                    task.spawn(function()
                        local alreadyDone = false
                        while env.MainTabConfig.AutoJoinMap do
                            if not alreadyDone then
                                pcall(function()
                                    local rf = ReplicatedStorage:WaitForChild("RemoteFunctions", 5)
                                    if rf then
                                        local setMap = rf:FindFirstChild("LobbySetMap_8")
                                        if setMap then
                                            setMap:InvokeServer(env.MainTabConfig.SelectedMap)
                                            alreadyDone = true
                                        end
                                    end
                                end)
                            end
                            task.wait(1)
                        end
                    end)
                end
            end,
        })
        env.MainTabToggles.AutoJoinMap = autoJoinMapToggle

        MainTab:Dropdown({
            Flag   = "SelectedMap",
            Title  = "Map",
            Values = {
                { Title = "Garden" }, { Title = "Jungle" }, { Title = "Tropical Island" },
                { Title = "Toxic Facility" }, { Title = "Back Garden" },
                { Title = "Dojo" }, { Title = "Graveyard" }, { Title = "Space" },
            },
            Callback = function(selected)
                env.MainTabConfig.SelectedMapName = selected.Title
                env.MainTabConfig.SelectedMap = mapIdMap[selected.Title]
            end,
        })
        print("[MAIN TAB] Content loaded!")
    end)

    -- ========================================================
    -- AUTO FARM TAB  (GraveyardV2 removed)
    -- ========================================================
    task.spawn(function()
        task.wait(0.8)
        print("[AUTO FARM TAB] Loading content...")

        AutoFarmTab:Section({ Title = "Auto Farm Strategies", TextSize = 16, TextTransparency = 0.3 })
        AutoFarmTab:Space()

        local farmToggles = {}

        local function stopAllFarms(exceptKey)
            for _, key in ipairs({
                "GraveyardV1Active",
                "DojoActive", "AutoWinV1Active", "AutoWinV2Active",
                "WinterActive", "SpaceV1Active", "SpaceV2Active",
            }) do
                if key ~= exceptKey then
                    env.AutoFarmConfig[key] = false
                    if farmToggles[key] then farmToggles[key]:Set(false) end
                end
            end
            env.AutoFarmConfig.IsRunning        = false
            env.AutoFarmConfig.CurrentStrategy  = nil
            env.AutoFarmConfig.FirstRunComplete = false
        end

        local function lockHub()   env.MagicHubLocked = true  end
        local function unlockHub()
            env.MagicHubLocked = false
            print("[MAGIC HUB] All farms stopped - script unlocked")
        end

        -- Graveyard V1
        local gv1Toggle = AutoFarmTab:Toggle({
            Flag    = "GraveyardV1",
            Title   = "Graveyard V1",
            Desc    = "Simple auto farm on Graveyard map.",
            Default = env.AutoFarmConfig.GraveyardV1Active,
            Callback = function(val)
                if val then
                    if env.AutoFarmConfig.DojoActive or env.AutoFarmConfig.AutoWinV1Active then return end
                    stopAllFarms("GraveyardV1Active")
                    env.AutoFarmConfig.GraveyardV1Active = true
                    lockHub()
                    task.spawn(function()
                        local success = joinMap("map_graveyard", "Graveyard", 10)
                        if success then
                            WindUI:Notify({ Title = "Setup Complete", Content = "Successfully entered Graveyard map!", Duration = 3 })
                        else
                            WindUI:Notify({ Title = "Setup Failed", Content = "Could not enter Graveyard after 10 attempts.", Duration = 5 })
                        end
                    end)
                else
                    env.AutoFarmConfig.GraveyardV1Active = false
                    env.AutoFarmConfig.IsRunning = false
                    if not env.AutoFarmConfig.DojoActive and not env.AutoFarmConfig.AutoWinV1Active then
                        unlockHub()
                    end
                    WindUI:Notify({ Title = "Graveyard V1 Stopped", Content = "Auto farm disabled", Duration = 2 })
                end
            end,
        })
        farmToggles["GraveyardV1Active"] = gv1Toggle
        AutoFarmTab:Space()

        -- Dojo (Rafflesia)
        local dojoToggle = AutoFarmTab:Toggle({
            Flag    = "DojoFarm",
            Title   = "Dojo Farm (Rafflesia)",
            Desc    = "Auto farm on the Dojo map using Rafflesia unit.",
            Default = env.AutoFarmConfig.DojoActive,
            Callback = function(val)
                if val then
                    if env.AutoFarmConfig.GraveyardV1Active then return end
                    stopAllFarms("DojoActive")
                    env.AutoFarmConfig.DojoActive = true
                    env.AutoFarmConfig.IsRunning  = true
                    lockHub()
                    task.spawn(function()
                        local success = joinMap("map_dojo", "Dojo", 10)
                        if success then
                            WindUI:Notify({ Title = "Setup Complete", Content = "Successfully entered Dojo map!", Duration = 3 })
                        else
                            WindUI:Notify({ Title = "Setup Failed", Content = "Could not enter Dojo after 10 attempts.", Duration = 5 })
                        end
                    end)
                    task.spawn(function()
                        local spots = {
                            CFrame.new(-59.76, 5.3, 80.12), CFrame.new(-62.10, 5.3, 84.55),
                            CFrame.new(-55.30, 5.3, 82.44), CFrame.new(-57.88, 5.3, 87.13),
                            CFrame.new(-64.45, 5.3, 89.22),
                        }
                        while env.AutoFarmConfig.DojoActive do
                            if isGameActive() then
                                for _, cf in ipairs(spots) do
                                    if not isGameActive() or not env.AutoFarmConfig.DojoActive then break end
                                    while getCash() < 500 and isGameActive() do task.wait(0.2) end
                                    placeUnit("unit_rafflesia", cf, 0)
                                    task.wait(0.3)
                                end
                                while isGameActive() and env.AutoFarmConfig.DojoActive do task.wait(1) end
                                if not env.AutoFarmConfig.DojoActive then break end
                                task.wait(3)
                            else
                                task.wait(0.5)
                            end
                        end
                    end)
                else
                    env.AutoFarmConfig.DojoActive         = false
                    env.AutoFarmConfig.IsRunning          = false
                    env.AutoFarmConfig.CurrentStrategy    = nil
                    env.AutoFarmConfig.FirstRunComplete   = false
                    if not env.AutoFarmConfig.GraveyardV1Active then unlockHub() end
                    WindUI:Notify({ Title = "Dojo Stopped", Content = "Auto farm has been disabled", Duration = 2 })
                end
            end,
        })
        farmToggles["DojoActive"] = dojoToggle
        AutoFarmTab:Space()

        -- Auto Win V1 (Tomato Plant x18)
        local autoWinV1Toggle = AutoFarmTab:Toggle({
            Flag    = "AutoWinV1",
            Title   = "Auto Win V1 (Tomato Plant)",
            Desc    = "Places 18 Rainbow Tomato Plants on the Garden map.",
            Default = env.AutoFarmConfig.AutoWinV1Active,
            Callback = function(val)
                if val then
                    if env.AutoFarmConfig.GraveyardV1Active or env.AutoFarmConfig.DojoActive then return end
                    stopAllFarms("AutoWinV1Active")
                    env.AutoFarmConfig.AutoWinV1Active = true
                    env.AutoFarmConfig.IsRunning       = true
                    lockHub()
                    task.spawn(function()
                        local success = joinMap("map_farm", "Garden", 10)
                        if success then
                            WindUI:Notify({ Title = "Setup Complete", Content = "Successfully entered Garden map!", Duration = 3 })
                        else
                            WindUI:Notify({ Title = "Setup Failed", Content = "Could not enter Garden after 10 attempts.", Duration = 5 })
                        end
                    end)
                    task.spawn(function()
                        local positions = {
                            CFrame.new(-326.82, 61.68, -105.29, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-326.57, 61.68, -110.16, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-340.45, 61.68, -102.64, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-341.37, 61.68, -108.40, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-330.57, 61.68, -107.22, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-331.07, 61.68, -112.38, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-325.50, 61.68, -114.87, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-340.13, 61.68, -112.31, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-330.98, 61.68, -115.97, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-345.53, 61.68, -105.18, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-341.29, 61.68, -116.78, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-345.55, 61.68, -111.36, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-327.55, 61.68, -118.89, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-339.94, 61.68, -120.88, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-345.09, 61.68, -118.66, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-331.59, 61.68, -121.99, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-340.29, 61.68, -124.86, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                            CFrame.new(-329.32, 61.68, -125.80, -1, 0, -8.74e-08, 0, 1, 0, 8.74e-08, 0, -1),
                        }
                        local upgradeCosts = { 125, 175, 350, 500 }
                        local unitIDs = env.GlobalTracking.unitIDs
                        while env.AutoFarmConfig.AutoWinV1Active do
                            if isGameActive() then
                                table.clear(unitIDs)
                                for i, cf in ipairs(positions) do
                                    if not isGameActive() or not env.AutoFarmConfig.AutoWinV1Active then break end
                                    print(("[AUTO WIN V1] Planting Tomato %d/18..."):format(i))
                                    while getCash() < 100 and isGameActive() do task.wait(0.2) end
                                    local placed = false
                                    for _ = 1, 10 do
                                        if placeUnit("unit_tomato_plant", cf, 180) then
                                            placed = true
                                            break
                                        end
                                        task.wait(0.05)
                                    end
                                    if placed then
                                        task.wait(0.15)
                                        local myUnits = getMyUnits()
                                        while #myUnits < i and isGameActive() do task.wait(0.2) myUnits = getMyUnits() end
                                        unitIDs[i] = myUnits[i]
                                    end
                                end
                                for lvl, cost in ipairs(upgradeCosts) do
                                    local myUnits = getMyUnits()
                                    for _, unit in ipairs(myUnits) do
                                        if not isGameActive() or not env.AutoFarmConfig.AutoWinV1Active then break end
                                        while getCash() < cost and isGameActive() do task.wait(0.2) end
                                        upgradeUnit(unit, 1, { cost }, "Tomato Plant")
                                    end
                                end
                                print("[AUTO WIN V1] Setup complete — idling until game ends")
                                while isGameActive() and env.AutoFarmConfig.AutoWinV1Active do task.wait(1) end
                                if not env.AutoFarmConfig.AutoWinV1Active then break end
                                task.wait(3)
                            else
                                task.wait(0.5)
                            end
                        end
                    end)
                else
                    env.AutoFarmConfig.AutoWinV1Active  = false
                    env.AutoFarmConfig.IsRunning        = false
                    env.AutoFarmConfig.CurrentStrategy  = nil
                    env.AutoFarmConfig.FirstRunComplete = false
                    if not env.AutoFarmConfig.GraveyardV1Active and not env.AutoFarmConfig.DojoActive then
                        unlockHub()
                    end
                    WindUI:Notify({ Title = "Auto Win V1 Stopped", Content = "Auto farm has been disabled", Duration = 2 })
                end
            end,
        })
        farmToggles["AutoWinV1Active"] = autoWinV1Toggle
        AutoFarmTab:Space()

        -- Auto Win V2 (Regen Flower)
        local autoWinV2Toggle = AutoFarmTab:Toggle({
            Flag    = "AutoWinV2",
            Title   = "Auto Win V2 (Regen Flower)",
            Desc    = "Plants Regen Flowers on Garden map for AFK wins.",
            Default = env.AutoFarmConfig.AutoWinV2Active,
            Callback = function(val)
                if val then
                    if env.AutoFarmConfig.GraveyardV1Active or env.AutoFarmConfig.DojoActive then return end
                    stopAllFarms("AutoWinV2Active")
                    env.AutoFarmConfig.AutoWinV2Active = true
                    env.AutoFarmConfig.IsRunning       = true
                    lockHub()
                    task.spawn(function()
                        local success = joinMap("map_farm", "Garden", 10)
                        if success then
                            WindUI:Notify({ Title = "Setup Complete", Content = "Successfully entered Garden map!", Duration = 3 })
                        else
                            WindUI:Notify({ Title = "Setup Failed", Content = "Could not enter Garden after 10 attempts.", Duration = 5 })
                        end
                    end)
                    task.spawn(function()
                        local spots = {
                            CFrame.new(-328.0, 61.68, -106.0), CFrame.new(-332.0, 61.68, -106.0),
                            CFrame.new(-336.0, 61.68, -106.0), CFrame.new(-340.0, 61.68, -106.0),
                            CFrame.new(-328.0, 61.68, -112.0), CFrame.new(-332.0, 61.68, -112.0),
                            CFrame.new(-336.0, 61.68, -112.0), CFrame.new(-340.0, 61.68, -112.0),
                            CFrame.new(-328.0, 61.68, -118.0), CFrame.new(-332.0, 61.68, -118.0),
                        }
                        while env.AutoFarmConfig.AutoWinV2Active do
                            if isGameActive() then
                                for i, cf in ipairs(spots) do
                                    if not isGameActive() or not env.AutoFarmConfig.AutoWinV2Active then break end
                                    while getCash() < 200 and isGameActive() do task.wait(0.2) end
                                    placeUnit("unit_regen_flower", cf, 0)
                                    task.wait(0.3)
                                    print(("[AUTO WIN V2] Placed Regen Flower %d/%d"):format(i, #spots))
                                end
                                while isGameActive() and env.AutoFarmConfig.AutoWinV2Active do task.wait(1) end
                                if not env.AutoFarmConfig.AutoWinV2Active then break end
                                task.wait(3)
                            else
                                task.wait(0.5)
                            end
                        end
                    end)
                else
                    env.AutoFarmConfig.AutoWinV2Active  = false
                    env.AutoFarmConfig.IsRunning        = false
                    env.AutoFarmConfig.CurrentStrategy  = nil
                    env.AutoFarmConfig.FirstRunComplete = false
                    if not env.AutoFarmConfig.GraveyardV1Active and not env.AutoFarmConfig.DojoActive then
                        unlockHub()
                    end
                    WindUI:Notify({ Title = "Auto Win V2 Stopped", Content = "Auto farm has been disabled", Duration = 2 })
                end
            end,
        })
        farmToggles["AutoWinV2Active"] = autoWinV2Toggle
        AutoFarmTab:Space()

        -- Winter Farm (Rafflesia)
        local winterToggle = AutoFarmTab:Toggle({
            Flag    = "WinterFarm",
            Title   = "Winter Farm (Rafflesia)",
            Desc    = "Auto farm on Winter/Christmas map using Rafflesia.",
            Default = env.AutoFarmConfig.WinterActive,
            Callback = function(val)
                if val then
                    stopAllFarms("WinterActive")
                    env.AutoFarmConfig.WinterActive = true
                    lockHub()
                    task.spawn(function()
                        local success = joinMap("map_christmas", "Winter", 10)
                        if success then
                            WindUI:Notify({ Title = "Setup Complete", Content = "Successfully entered Winter map!", Duration = 3 })
                        else
                            WindUI:Notify({ Title = "Setup Failed", Content = "Could not enter Winter after 10 attempts.", Duration = 5 })
                        end
                    end)
                    task.spawn(function()
                        local spots = {
                            CFrame.new(-10.0, 5.3, 80.0), CFrame.new(-14.0, 5.3, 80.0),
                            CFrame.new(-18.0, 5.3, 80.0), CFrame.new(-10.0, 5.3, 86.0),
                            CFrame.new(-14.0, 5.3, 86.0),
                        }
                        while env.AutoFarmConfig.WinterActive do
                            if isGameActive() then
                                for _, cf in ipairs(spots) do
                                    if not isGameActive() or not env.AutoFarmConfig.WinterActive then break end
                                    while getCash() < 500 and isGameActive() do task.wait(0.2) end
                                    placeUnit("unit_rafflesia", cf, 0)
                                    task.wait(0.3)
                                end
                                while isGameActive() and env.AutoFarmConfig.WinterActive do task.wait(1) end
                                if not env.AutoFarmConfig.WinterActive then break end
                                task.wait(3)
                            else
                                task.wait(0.5)
                            end
                        end
                    end)
                else
                    env.AutoFarmConfig.WinterActive = false
                    unlockHub()
                    WindUI:Notify({ Title = "Winter Farm Stopped", Content = "Auto farm disabled", Duration = 2 })
                end
            end,
        })
        farmToggles["WinterActive"] = winterToggle
        AutoFarmTab:Space()

        -- Space V1 (Regen Flower)
        local spaceV1Toggle = AutoFarmTab:Toggle({
            Flag    = "SpaceV1",
            Title   = "Space V1 (Regen Flower)",
            Desc    = "Auto farm on Space map using Regen Flowers.",
            Default = env.AutoFarmConfig.SpaceV1Active,
            Callback = function(val)
                if val then
                    stopAllFarms("SpaceV1Active")
                    env.AutoFarmConfig.SpaceV1Active = true
                    lockHub()
                    task.spawn(function()
                        local success = joinMap("map_space", "Space", 10)
                        if success then
                            WindUI:Notify({ Title = "Setup Complete", Content = "Successfully entered Space map!", Duration = 3 })
                        else
                            WindUI:Notify({ Title = "Setup Failed", Content = "Could not enter Space after 10 attempts.", Duration = 5 })
                        end
                    end)
                    task.spawn(function()
                        local spots = {
                            CFrame.new(50.0, 12.0, -80.0), CFrame.new(54.0, 12.0, -80.0),
                            CFrame.new(58.0, 12.0, -80.0), CFrame.new(50.0, 12.0, -86.0),
                            CFrame.new(54.0, 12.0, -86.0),
                        }
                        while env.AutoFarmConfig.SpaceV1Active do
                            if isGameActive() then
                                for _, cf in ipairs(spots) do
                                    if not isGameActive() or not env.AutoFarmConfig.SpaceV1Active then break end
                                    while getCash() < 200 and isGameActive() do task.wait(0.2) end
                                    placeUnit("unit_regen_flower", cf, 0)
                                    task.wait(0.3)
                                end
                                while isGameActive() and env.AutoFarmConfig.SpaceV1Active do task.wait(1) end
                                if not env.AutoFarmConfig.SpaceV1Active then break end
                                task.wait(3)
                            else
                                task.wait(0.5)
                            end
                        end
                    end)
                else
                    env.AutoFarmConfig.SpaceV1Active = false
                    unlockHub()
                    WindUI:Notify({ Title = "Space V1 Stopped", Content = "Auto farm disabled", Duration = 2 })
                end
            end,
        })
        farmToggles["SpaceV1Active"] = spaceV1Toggle
        AutoFarmTab:Space()

        -- Space V2 (Rafflesia)
        local spaceV2Toggle = AutoFarmTab:Toggle({
            Flag    = "SpaceV2",
            Title   = "Space V2 (Rafflesia)",
            Desc    = "Auto farm on Space map using Rafflesia units.",
            Default = env.AutoFarmConfig.SpaceV2Active,
            Callback = function(val)
                if val then
                    stopAllFarms("SpaceV2Active")
                    env.AutoFarmConfig.SpaceV2Active = true
                    lockHub()
                    task.spawn(function()
                        local success = joinMap("map_space", "Space", 10)
                        if success then
                            WindUI:Notify({ Title = "Setup Complete", Content = "Successfully entered Space map!", Duration = 3 })
                        else
                            WindUI:Notify({ Title = "Setup Failed", Content = "Could not enter Space after 10 attempts.", Duration = 5 })
                        end
                    end)
                    task.spawn(function()
                        local spots = {
                            CFrame.new(50.0, 12.0, -80.0), CFrame.new(54.0, 12.0, -80.0),
                            CFrame.new(58.0, 12.0, -80.0), CFrame.new(50.0, 12.0, -86.0),
                            CFrame.new(54.0, 12.0, -86.0),
                        }
                        while env.AutoFarmConfig.SpaceV2Active do
                            if isGameActive() then
                                for _, cf in ipairs(spots) do
                                    if not isGameActive() or not env.AutoFarmConfig.SpaceV2Active then break end
                                    while getCash() < 500 and isGameActive() do task.wait(0.2) end
                                    placeUnit("unit_rafflesia", cf, 0)
                                    task.wait(0.3)
                                end
                                while isGameActive() and env.AutoFarmConfig.SpaceV2Active do task.wait(1) end
                                if not env.AutoFarmConfig.SpaceV2Active then break end
                                task.wait(3)
                            else
                                task.wait(0.5)
                            end
                        end
                    end)
                else
                    env.AutoFarmConfig.SpaceV2Active = false
                    unlockHub()
                    WindUI:Notify({ Title = "Space V2 Stopped", Content = "Auto farm disabled", Duration = 2 })
                end
            end,
        })
        farmToggles["SpaceV2Active"] = spaceV2Toggle
        print("[AUTO FARM TAB] Content loaded!")
    end)

    -- ========================================================
    -- MISC TAB
    -- ========================================================
    task.spawn(function()
        task.wait(1.0)
        print("[MISC TAB] Loading content...")

        MiscTab:Section({ Title = "Misc Features", TextSize = 16, TextTransparency = 0.3 })
        MiscTab:Space()

        local eggRunning = false
        local eggToggle = MiscTab:Toggle({
            Flag    = "EggCollector",
            Title   = "Easter Eggs Auto Collector",
            Desc    = "Automatically collects Easter Eggs around the map.",
            Default = false,
            Callback = function(val)
                eggRunning = val
                if val then
                    WindUI:Notify({ Title = "Egg Collector Started", Content = "Scanning for Easter Eggs...", Duration = 2 })
                    task.spawn(function()
                        while eggRunning do
                            pcall(function()
                                local map = workspace:FindFirstChild("Map")
                                if not map then return end
                                for _, obj in ipairs(map:GetDescendants()) do
                                    if not eggRunning then break end
                                    if obj.Name:lower():find("egg") or obj.Name:lower():find("easter") then
                                        local pp = obj:FindFirstChildOfClass("ProximityPrompt")
                                        if pp then pp:FireServer() task.wait(0.1) end
                                        local rf2 = obj:FindFirstChild("CollectEgg") or obj:FindFirstChild("FireInteractionEvent")
                                        if rf2 and rf2:IsA("RemoteEvent") then rf2:FireServer() task.wait(0.1) end
                                    end
                                end
                            end)
                            task.wait(2)
                        end
                    end)
                else
                    WindUI:Notify({ Title = "Egg Collector Stopped", Content = "Auto collection disabled", Duration = 2 })
                end
            end,
        })
        env.EggCollectorToggle = eggToggle
        MiscTab:Space()

        MiscTab:Button({
            Title = "Auto Obby",
            Desc  = "Automatically activates the ARG Obby portal.",
            Callback = function()
                pcall(function()
                    local map = workspace:FindFirstChild("Map")
                    if not map then WindUI:Notify({ Title = "Auto Obby Failed", Content = "Map not found.", Duration = 2 }) return end
                    local arObby = map:FindFirstChild("ARGObby")
                    if not arObby then WindUI:Notify({ Title = "Auto Obby Failed", Content = "ARGObby not found in Map.", Duration = 2 }) return end
                    for _, desc in ipairs(arObby:GetDescendants()) do
                        if desc.Name == "FireInteractionEvent" and desc:IsA("RemoteEvent") then
                            desc:FireServer()
                            WindUI:Notify({ Title = "Auto Obby", Content = "Obby activated via: " .. desc:GetFullName(), Duration = 1 })
                            return
                        end
                    end
                    WindUI:Notify({ Title = "Auto Obby Failed", Content = "Interaction remote not found.", Duration = 2 })
                end)
            end,
        })
        MiscTab:Space()

        local ralphRunning = false
        local function getSeedCount()
            local ok, result = pcall(function()
                local gameGui = PlayerGui:FindFirstChild("GameGui")
                if not gameGui then return 0 end
                local currDisplay = gameGui:FindFirstChild("CurrencyDisplay", true)
                if not currDisplay then return 0 end
                local seedsDisplay = currDisplay:FindFirstChild("SeedsDisplay")
                if not seedsDisplay then return 0 end
                local title = seedsDisplay:FindFirstChild("Title")
                if title and title:IsA("TextLabel") then return tonumber(title.Text:match("(%d+)")) or 0 end
                return 0
            end)
            return (ok and result) or 0
        end

        MiscTab:Toggle({
            Flag    = "RalphAutoDonate",
            Title   = "Auto Donate Ralph",
            Desc    = "Automatically donates 50 seeds to Ralph the Beggar.",
            Default = false,
            Callback = function(val)
                ralphRunning = val
                if val then
                    local seeds = getSeedCount()
                    if seeds < 50 then
                        WindUI:Notify({ Title = "Not Enough Seeds", Content = ("You need at least 50 seeds! Current: %d"):format(seeds), Duration = 3 })
                        return
                    end
                    WindUI:Notify({ Title = "Ralph Donate Started", Content = ("Auto donating 50 seeds... Current: %d"):format(seeds), Duration = 3 })
                    task.spawn(function()
                        while ralphRunning do
                            local currentSeeds = getSeedCount()
                            if currentSeeds < 50 then
                                WindUI:Notify({ Title = "Ralph Donate Stopped", Content = ("Not enough seeds! (%d)"):format(currentSeeds), Duration = 4 })
                                break
                            end
                            pcall(function()
                                local map = workspace:FindFirstChild("Map")
                                if not map then return end
                                local beggarItems = map:FindFirstChild("BeggarItems")
                                if not beggarItems then return end
                                local beggar = beggarItems:FindFirstChild("Beggar")
                                if not beggar then return end
                                local hrp = beggar:FindFirstChild("HumanoidRootPart")
                                if not hrp then return end
                                local interact = hrp:FindFirstChild("Interact")
                                if not interact then return end
                                local pp = interact:FindFirstChildOfClass("ProximityPrompt")
                                if pp then pp:FireServer() end
                            end)
                            task.wait(0.1)
                        end
                    end)
                else
                    ralphRunning = false
                    WindUI:Notify({ Title = "Ralph Donate Stopped", Content = "Auto donation disabled", Duration = 2 })
                end
            end,
        })
        print("[MISC TAB] Content loaded!")
    end)

    -- ========================================================
    -- ANTI BAN TAB
    -- ========================================================
    task.spawn(function()
        task.wait(1.1)
        print("[ANTI BAN TAB] Loading content...")

        AntiBanTab:Section({ Title = "Anti Ban Settings", TextSize = 16, TextTransparency = 0.3 })
        AntiBanTab:Space()

        AntiBanTab:Input({
            Flag        = "PlacementOffset",
            Title       = "Placement Offset",
            Desc        = "Random offset applied to unit placement (reduces detection).",
            Type        = "Input",
            Placeholder = "1.5",
            Callback    = function(val)
                local n = tonumber(val)
                if n then env.AntiBanConfig.PlacementOffset = n end
            end,
        })
        AntiBanTab:Space()

        AntiBanTab:Input({
            Flag        = "MatchesBeforeReturn",
            Title       = "Matches Before Return",
            Desc        = "Number of matches to play before returning to menu.",
            Type        = "Input",
            Placeholder = "100",
            Callback    = function(val)
                local n = tonumber(val)
                if n then env.AntiBanConfig.MatchesBeforeReturn = n end
            end,
        })
        AntiBanTab:Space()

        local autoReturnToggle = AntiBanTab:Toggle({
            Flag    = "AntiBanAutoReturn",
            Title   = "Enable Auto Return",
            Desc    = "Returns to menu after N matches.",
            Default = env.AntiBanConfig.AutoReturnEnabled,
            Callback = function(val)
                env.AntiBanConfig.AutoReturnEnabled = val
                WindUI:Notify({
                    Title   = val and "Auto Return ON" or "Auto Return OFF",
                    Content = val and ("Will return after " .. env.AntiBanConfig.MatchesBeforeReturn .. " matches") or "Auto return disabled",
                    Duration = 3,
                })
            end,
        })
        env.AntiBanToggles.AutoReturn = autoReturnToggle
        AntiBanTab:Space()

        local antiAfkToggle = AntiBanTab:Toggle({
            Flag    = "AntiAFK",
            Title   = "Enable Anti-AFK",
            Desc    = "Loads external Anti-AFK script to prevent disconnection.",
            Default = env.AntiBanConfig.AntiAFKEnabled,
            Callback = function(val)
                env.AntiBanConfig.AntiAFKEnabled = val
                if val and not env.AntiBanConfig.AFKLoaded then
                    task.spawn(function()
                        pcall(function()
                            loadstring(game:HttpGet(
                                "https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"
                            ))()
                        end)
                        env.AntiBanConfig.AFKLoaded = true
                    end)
                end
                WindUI:Notify({
                    Title   = val and "Anti-AFK ON" or "Anti-AFK OFF",
                    Content = val and "Anti-AFK protection enabled" or "Anti-AFK disabled",
                    Duration = 2,
                })
            end,
        })
        env.AntiBanToggles.AntiAFK = antiAfkToggle

        task.spawn(function()
            while true do
                task.wait(2)
                if env.AntiBanConfig.AutoReturnEnabled then
                    if env.AutoFarmConfig.MatchCount >= env.AntiBanConfig.MatchesBeforeReturn then
                        env.AutoFarmConfig.MatchCount = 0
                        WindUI:Notify({
                            Title   = "Auto Return",
                            Content = ("Reached %d matches — returning to menu."):format(env.AntiBanConfig.MatchesBeforeReturn),
                            Duration = 4,
                        })
                        goToLobby()
                    end
                end
            end
        end)
        print("[ANTI BAN TAB] Content loaded!")
    end)

    -- ========================================================
    -- SETTINGS TAB
    -- ========================================================
    task.spawn(function()
        task.wait(1.2)
        print("[SETTINGS TAB] Loading content...")

        SettingsTab:Section({ Title = "Configuration System", TextSize = 16, TextTransparency = 0.3 })
        SettingsTab:Space()

        local function buildConfigData()
            local e = getgenv()
            return {
                MainTab_AutoSkip               = e.MainTabConfig.AutoSkip,
                MainTab_AutoSpeed2x            = e.MainTabConfig.AutoSpeed2x,
                MainTab_AutoSpeed3x            = e.MainTabConfig.AutoSpeed3x,
                MainTab_AutoPlayAgain          = e.MainTabConfig.AutoPlayAgain,
                MainTab_AutoReturn             = e.MainTabConfig.AutoReturn,
                MainTab_AutoDifficulty         = e.MainTabConfig.AutoDifficulty,
                MainTab_AutoJoinMap            = e.MainTabConfig.AutoJoinMap,
                MainTab_SelectedDifficulty     = e.MainTabConfig.SelectedDifficulty,
                MainTab_SelectedDifficultyName = e.MainTabConfig.SelectedDifficultyName,
                MainTab_SelectedMap            = e.MainTabConfig.SelectedMap,
                MainTab_SelectedMapName        = e.MainTabConfig.SelectedMapName,
                AutoFarm_GraveyardV1Active = e.AutoFarmConfig.GraveyardV1Active,
                AutoFarm_WinterActive      = e.AutoFarmConfig.WinterActive,
                AutoFarm_SpaceV1Active     = e.AutoFarmConfig.SpaceV1Active or false,
                AutoFarm_SpaceV2Active     = e.AutoFarmConfig.SpaceV2Active or false,
                AutoFarm_DojoActive        = e.AutoFarmConfig.DojoActive,
                AutoFarm_AutoWinV1Active   = e.AutoFarmConfig.AutoWinV1Active,
                AutoFarm_AutoWinV2Active   = e.AutoFarmConfig.AutoWinV2Active,
                AntiBan_PlacementOffset     = e.AntiBanConfig.PlacementOffset,
                AntiBan_MatchesBeforeReturn = e.AntiBanConfig.MatchesBeforeReturn,
                AntiBan_AutoReturnEnabled   = e.AntiBanConfig.AutoReturnEnabled,
                AntiBan_AntiAFKEnabled      = e.AntiBanConfig.AntiAFKEnabled,
                Performance_RenderStopped      = e.PerformanceConfig.RenderStopped,
                Performance_BlackScreenEnabled = e.PerformanceConfig.BlackScreenEnabled,
                Performance_LowGraphicsEnabled = e.LowGraphicsConfig.Enabled,
            }
        end

        local function saveConfig(name)
            if not name or name == "" then return false end
            local ok = pcall(function()
                if not isfolder("MagicScript")         then makefolder("MagicScript")         end
                if not isfolder("MagicScript/Configs") then makefolder("MagicScript/Configs") end
                local data = game:GetService("HttpService"):JSONEncode(buildConfigData())
                writefile("MagicScript/Configs/" .. name .. ".json", data)
            end)
            return ok
        end

        local function loadConfig(name)
            if not name or name == "" then return false end
            if not isfile("MagicScript/Configs/" .. name .. ".json") then return false end
            local ok, data = pcall(function()
                local raw = readfile("MagicScript/Configs/" .. name .. ".json")
                return game:GetService("HttpService"):JSONDecode(raw)
            end)
            if not ok or not data then return false end
            local e = getgenv()
            e.MainTabConfig.AutoSkip               = data.MainTab_AutoSkip or false
            e.MainTabConfig.AutoSpeed2x            = data.MainTab_AutoSpeed2x or false
            e.MainTabConfig.AutoSpeed3x            = data.MainTab_AutoSpeed3x or false
            e.MainTabConfig.AutoPlayAgain          = data.MainTab_AutoPlayAgain or false
            e.MainTabConfig.AutoReturn             = data.MainTab_AutoReturn or false
            e.MainTabConfig.AutoDifficulty         = data.MainTab_AutoDifficulty or false
            e.MainTabConfig.AutoJoinMap            = data.MainTab_AutoJoinMap or false
            e.MainTabConfig.SelectedDifficulty     = data.MainTab_SelectedDifficulty
            e.MainTabConfig.SelectedDifficultyName = data.MainTab_SelectedDifficultyName
            e.MainTabConfig.SelectedMap            = data.MainTab_SelectedMap
            e.MainTabConfig.SelectedMapName        = data.MainTab_SelectedMapName
            e.AutoFarmConfig.GraveyardV1Active = data.AutoFarm_GraveyardV1Active or false
            e.AutoFarmConfig.WinterActive      = data.AutoFarm_WinterActive or false
            e.AutoFarmConfig.SpaceV1Active     = data.AutoFarm_SpaceV1Active or false
            e.AutoFarmConfig.SpaceV2Active     = data.AutoFarm_SpaceV2Active or false
            e.AutoFarmConfig.DojoActive        = data.AutoFarm_DojoActive or false
            e.AutoFarmConfig.AutoWinV1Active   = data.AutoFarm_AutoWinV1Active or false
            e.AutoFarmConfig.AutoWinV2Active   = data.AutoFarm_AutoWinV2Active or false
            e.AntiBanConfig.PlacementOffset     = data.AntiBan_PlacementOffset or 1.5
            e.AntiBanConfig.MatchesBeforeReturn = data.AntiBan_MatchesBeforeReturn or 100
            e.AntiBanConfig.AutoReturnEnabled   = data.AntiBan_AutoReturnEnabled or false
            e.AntiBanConfig.AntiAFKEnabled      = data.AntiBan_AntiAFKEnabled or false
            e.PerformanceConfig.RenderStopped      = data.Performance_RenderStopped or false
            e.PerformanceConfig.BlackScreenEnabled = data.Performance_BlackScreenEnabled or false
            e.LowGraphicsConfig.Enabled            = data.Performance_LowGraphicsEnabled or false
            task.wait(0.5)
            local t = e.MainTabToggles
            if t.AutoSkip       then t.AutoSkip:Set(e.MainTabConfig.AutoSkip) end
            if t.AutoSpeed2x    then t.AutoSpeed2x:Set(e.MainTabConfig.AutoSpeed2x) end
            if t.AutoSpeed3x    then t.AutoSpeed3x:Set(e.MainTabConfig.AutoSpeed3x) end
            if t.AutoPlayAgain  then t.AutoPlayAgain:Set(e.MainTabConfig.AutoPlayAgain) end
            if t.AutoDifficulty then t.AutoDifficulty:Set(e.MainTabConfig.AutoDifficulty) end
            if t.AutoJoinMap    then t.AutoJoinMap:Set(e.MainTabConfig.AutoJoinMap) end
            local at = e.AntiBanToggles
            if at.AutoReturn then at.AutoReturn:Set(e.AntiBanConfig.AutoReturnEnabled) end
            if at.AntiAFK    then at.AntiAFK:Set(e.AntiBanConfig.AntiAFKEnabled) end
            return true
        end

        local function deleteConfig(name)
            if not name or name == "" then return false end
            if not isfile("MagicScript/Configs/" .. name .. ".json") then return false end
            local ok = pcall(function() delfile("MagicScript/Configs/" .. name .. ".json") end)
            return ok
        end

        local function listConfigs()
            local result = {}
            if not isfolder("MagicScript/Configs") then return result end
            for _, path in ipairs(listfiles("MagicScript/Configs")) do
                local name = path:match("([^/\\]+)%.json$")
                if name then table.insert(result, { Title = name }) end
            end
            if #result == 0 then table.insert(result, { Title = "No configs saved" }) end
            return result
        end

        local function getAutoload()
            if not isfile("MagicScript/AutoLoad.txt") then return nil end
            local ok, name = pcall(readfile, "MagicScript/AutoLoad.txt")
            return ok and name or nil
        end

        local function setAutoload(name)
            if not name or name == "" then return false end
            if not isfolder("MagicScript") then makefolder("MagicScript") end
            local ok = pcall(writefile, "MagicScript/AutoLoad.txt", name)
            return ok
        end

        local function clearAutoload()
            if isfile("MagicScript/AutoLoad.txt") then pcall(delfile, "MagicScript/AutoLoad.txt") end
        end

        local selectedConfig = nil
        local configNameInput, configListDropdown, autoloadButton = nil, nil, nil
        local function refreshDropdown()
            if configListDropdown then configListDropdown:Refresh(listConfigs()) end
        end

        configNameInput = SettingsTab:Input({
            Flag = "NewConfigName", Title = "Config Name",
            Desc = "Enter a name for your configuration.",
            Type = "Input", Placeholder = "my_config",
            Callback = function() if configNameInput then configNameInput:Highlight() end end,
        })
        SettingsTab:Space()

        configListDropdown = SettingsTab:Dropdown({
            Flag = "ConfigList", Title = "Config List", Values = listConfigs(),
            Callback = function(selected)
                if selected.Title ~= "No configs saved" then
                    selectedConfig = selected.Title
                    if configListDropdown then configListDropdown:Highlight() end
                end
            end,
        })
        SettingsTab:Space()

        SettingsTab:Button({
            Title = "Create Config", Desc = "Save current settings as a new config.",
            Callback = function()
                local name = configNameInput and configNameInput.Value
                if not name or name == "" then WindUI:Notify({ Title = "Error", Content = "Enter a config name first!", Duration = 3 }) return end
                if saveConfig(name) then refreshDropdown() WindUI:Notify({ Title = "Config Created", Content = ("'%s' saved!"):format(name), Duration = 3 })
                else WindUI:Notify({ Title = "Save Failed", Content = "Failed to save configuration.", Duration = 3 }) end
            end,
        })
        SettingsTab:Space()

        SettingsTab:Button({
            Title = "Delete Config", Desc = "Permanently delete the selected config.",
            Callback = function()
                if not selectedConfig then WindUI:Notify({ Title = "Error", Content = "Please select a config to delete!", Duration = 3 }) return end
                if deleteConfig(selectedConfig) then
                    local autoload = getAutoload()
                    if autoload == selectedConfig then
                        clearAutoload()
                        if autoloadButton then autoloadButton:SetDesc("Load selected config on startup") end
                    end
                    task.wait(0.1)
                    refreshDropdown()
                    WindUI:Notify({ Title = "Config Deleted", Content = ("'%s' deleted!"):format(selectedConfig), Duration = 3 })
                    selectedConfig = nil
                else
                    WindUI:Notify({ Title = "Delete Failed", Content = ("Config '%s' not found!"):format(selectedConfig), Duration = 3 })
                end
            end,
        })
        SettingsTab:Space()

        SettingsTab:Button({
            Title = "Load Config", Desc = "Apply the selected config to current settings.",
            Callback = function()
                if not selectedConfig then WindUI:Notify({ Title = "Error", Content = "Please select a config to load!", Duration = 3 }) return end
                if loadConfig(selectedConfig) then WindUI:Notify({ Title = "Config Loaded", Content = ("'%s' loaded!"):format(selectedConfig), Duration = 3 })
                else WindUI:Notify({ Title = "Load Failed", Content = ("Failed to load '%s'"):format(selectedConfig), Duration = 3 }) end
            end,
        })
        SettingsTab:Space()

        SettingsTab:Button({
            Title = "Overwrite Config", Desc = "Overwrite the selected config with current settings.",
            Callback = function()
                if not selectedConfig then WindUI:Notify({ Title = "Error", Content = "Please select a config to overwrite!", Duration = 3 }) return end
                if saveConfig(selectedConfig) then WindUI:Notify({ Title = "Config Overwritten", Content = ("'%s' updated!"):format(selectedConfig), Duration = 3 })
                else WindUI:Notify({ Title = "Overwrite Failed", Content = "Failed to overwrite configuration.", Duration = 3 }) end
            end,
        })
        SettingsTab:Space()

        SettingsTab:Button({
            Title = "Refresh List", Desc = "Reload the config list from disk.",
            Callback = function() refreshDropdown() end,
        })
        SettingsTab:Space()

        local currentAutoload = getAutoload()
        autoloadButton = SettingsTab:Button({
            Title = "Set as Autoload",
            Desc  = currentAutoload and ("Current: '" .. currentAutoload .. "'") or "Load selected config on startup",
            Callback = function()
                if not selectedConfig then WindUI:Notify({ Title = "Error", Content = "Please select a config first!", Duration = 3 }) return end
                if setAutoload(selectedConfig) then
                    if autoloadButton then autoloadButton:SetDesc(("Current: '%s'"):format(selectedConfig)) end
                    WindUI:Notify({ Title = "Autoload Set", Content = ("'%s' will load on startup"):format(selectedConfig), Duration = 3 })
                else
                    WindUI:Notify({ Title = "Failed", Content = "Failed to set autoload", Duration = 3 })
                end
            end,
        })
        SettingsTab:Space()

        SettingsTab:Button({
            Title = "Clear Autoload", Desc = "Remove the autoload config.",
            Callback = function()
                clearAutoload()
                if autoloadButton then autoloadButton:SetDesc("Load selected config on startup") end
                WindUI:Notify({ Title = "Autoload Cleared", Content = "No config will load on startup", Duration = 2 })
            end,
        })

        task.spawn(function()
            task.wait(2)
            local autoName = getAutoload()
            if autoName and isfile("MagicScript/Configs/" .. autoName .. ".json") then
                if loadConfig(autoName) then
                    WindUI:Notify({ Title = "Config Loaded", Content = ("'%s' loaded on startup"):format(autoName), Duration = 3 })
                end
            end
        end)

        -- Reset Key button inside Settings
        SettingsTab:Space()
        SettingsTab:Section({ Title = "Key System", TextSize = 16, TextTransparency = 0.3 })
        SettingsTab:Space()
        SettingsTab:Button({
            Title = "Reset Saved Key",
            Desc  = "Clears the saved key file — you will need to re-enter on next launch.",
            Callback = function()
                clearSavedKey()
                WindUI:Notify({ Title = "Key Cleared", Content = "Saved key removed. Re-enter key on next launch.", Duration = 4 })
            end,
        })

        print("[SETTINGS TAB] Content loaded!")
    end)

    print("[MAGIC HUB] Script fully initialized!")
end -- end RunMainScript()

-- ============================================================
-- GUIKEY — build the key-entry screen
-- ============================================================
local function ShowGuiKey()
    -- Remove any existing GuiKey (check both CoreGui and PlayerGui)
    local oldCore = CoreGui:FindFirstChild("GuiKey")
    if oldCore then oldCore:Destroy() end
    local pg = getPlayerGui()
    if pg then
        local oldPG = pg:FindFirstChild("GuiKey")
        if oldPG then oldPG:Destroy() end
    end

    -- ScreenGui — parent to CoreGui for reliable display on all executors
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name             = "GuiKey"
    screenGui.ResetOnSpawn     = false
    screenGui.ZIndexBehavior   = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder     = 999
    screenGui.Parent           = CoreGui

    -- Overlay (dim entire screen)
    local overlay = Instance.new("Frame")
    overlay.Name              = "Overlay"
    overlay.Size              = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3  = Color3.fromRGB(0, 0, 0)
    overlay.BackgroundTransparency = 0.50
    overlay.BorderSizePixel   = 0
    overlay.ZIndex            = 1
    overlay.Parent            = screenGui

    -- Main window frame
    local frame = Instance.new("Frame")
    frame.Name                  = "KeyFrame"
    frame.Size                  = UDim2.fromOffset(420, 240)
    frame.AnchorPoint           = Vector2.new(0.5, 0.5)
    frame.Position              = UDim2.new(0.5, 0, 0.5, 0)
    frame.BackgroundColor3      = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.34
    frame.BorderSizePixel       = 0
    frame.ZIndex                = 2
    frame.Parent                = screenGui

    -- Rounded corners
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent       = frame

    -- Border stroke
    local stroke = Instance.new("UIStroke")
    stroke.Color     = Color3.fromHex("#8013E8")
    stroke.Thickness = 2
    stroke.Parent    = frame

    -- Title bar background
    local titleBar = Instance.new("Frame")
    titleBar.Name                  = "TitleBar"
    titleBar.Size                  = UDim2.new(1, 0, 0, 44)
    titleBar.BackgroundColor3      = Color3.fromHex("#8013E8")
    titleBar.BackgroundTransparency = 0.25
    titleBar.BorderSizePixel       = 0
    titleBar.ZIndex                = 3
    titleBar.Parent                = frame

    local titleBarCorner = Instance.new("UICorner")
    titleBarCorner.CornerRadius = UDim.new(0, 12)
    titleBarCorner.Parent       = titleBar

    -- Title bottom-fill (to square off bottom of title bar)
    local titleFill = Instance.new("Frame")
    titleFill.Name                  = "Fill"
    titleFill.Size                  = UDim2.new(1, 0, 0, 12)
    titleFill.Position              = UDim2.new(0, 0, 1, -12)
    titleFill.BackgroundColor3      = Color3.fromHex("#8013E8")
    titleFill.BackgroundTransparency = 0.25
    titleFill.BorderSizePixel       = 0
    titleFill.ZIndex                = 3
    titleFill.Parent                = titleBar

    -- Title label  "MagicKeySystem"
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name                  = "TitleLabel"
    titleLabel.Size                  = UDim2.new(1, -50, 1, 0)
    titleLabel.Position              = UDim2.new(0, 14, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text                  = "MagicKeySystem"
    titleLabel.TextColor3            = Color3.fromHex("#E8A0FF")
    titleLabel.Font                  = Enum.Font.GothamBold
    titleLabel.TextSize              = 18
    titleLabel.TextXAlignment        = Enum.TextXAlignment.Left
    titleLabel.ZIndex                = 4
    titleLabel.Parent                = titleBar

    -- X button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name                  = "CloseBtn"
    closeBtn.Size                  = UDim2.fromOffset(30, 30)
    closeBtn.AnchorPoint           = Vector2.new(1, 0.5)
    closeBtn.Position              = UDim2.new(1, -8, 0.5, 0)
    closeBtn.BackgroundColor3      = Color3.fromRGB(200, 40, 40)
    closeBtn.BackgroundTransparency = 0.2
    closeBtn.Text                  = "✕"
    closeBtn.TextColor3            = Color3.fromRGB(255, 255, 255)
    closeBtn.Font                  = Enum.Font.GothamBold
    closeBtn.TextSize              = 14
    closeBtn.BorderSizePixel       = 0
    closeBtn.ZIndex                = 5
    closeBtn.Parent                = titleBar

    local closeBtnCorner = Instance.new("UICorner")
    closeBtnCorner.CornerRadius = UDim.new(0, 6)
    closeBtnCorner.Parent       = closeBtn

    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    -- Subtitle / prompt
    local subtitleLabel = Instance.new("TextLabel")
    subtitleLabel.Name                  = "Subtitle"
    subtitleLabel.Size                  = UDim2.new(1, -28, 0, 22)
    subtitleLabel.Position              = UDim2.new(0, 14, 0, 52)
    subtitleLabel.BackgroundTransparency = 1
    subtitleLabel.Text                  = "Enter your key to unlock Magic Hub"
    subtitleLabel.TextColor3            = Color3.fromRGB(180, 180, 180)
    subtitleLabel.Font                  = Enum.Font.Gotham
    subtitleLabel.TextSize              = 13
    subtitleLabel.TextXAlignment        = Enum.TextXAlignment.Left
    subtitleLabel.ZIndex                = 3
    subtitleLabel.Parent                = frame

    -- TextBox (key input)
    local keyBox = Instance.new("TextBox")
    keyBox.Name                  = "KeyBox"
    keyBox.Size                  = UDim2.new(1, -28, 0, 40)
    keyBox.Position              = UDim2.new(0, 14, 0, 82)
    keyBox.BackgroundColor3      = Color3.fromRGB(18, 18, 18)
    keyBox.BackgroundTransparency = 0.1
    keyBox.PlaceholderText       = "Enter key here..."
    keyBox.PlaceholderColor3     = Color3.fromRGB(100, 100, 100)
    keyBox.Text                  = ""
    keyBox.TextColor3            = Color3.fromRGB(255, 255, 255)
    keyBox.Font                  = Enum.Font.Gotham
    keyBox.TextSize              = 15
    keyBox.BorderSizePixel       = 0
    keyBox.ClearTextOnFocus      = false
    keyBox.ZIndex                = 3
    keyBox.Parent                = frame

    local keyBoxCorner = Instance.new("UICorner")
    keyBoxCorner.CornerRadius = UDim.new(0, 8)
    keyBoxCorner.Parent       = keyBox

    local keyBoxStroke = Instance.new("UIStroke")
    keyBoxStroke.Color     = Color3.fromHex("#8013E8")
    keyBoxStroke.Thickness = 1.5
    keyBoxStroke.Parent    = keyBox

    -- Submit button
    local submitBtn = Instance.new("TextButton")
    submitBtn.Name                  = "SubmitBtn"
    submitBtn.Size                  = UDim2.new(1, -28, 0, 38)
    submitBtn.Position              = UDim2.new(0, 14, 0, 132)
    submitBtn.BackgroundColor3      = Color3.fromHex("#8013E8")
    submitBtn.BackgroundTransparency = 0.1
    submitBtn.Text                  = "Unlock"
    submitBtn.TextColor3            = Color3.fromRGB(255, 255, 255)
    submitBtn.Font                  = Enum.Font.GothamBold
    submitBtn.TextSize              = 15
    submitBtn.BorderSizePixel       = 0
    submitBtn.ZIndex                = 3
    submitBtn.Parent                = frame

    local submitCorner = Instance.new("UICorner")
    submitCorner.CornerRadius = UDim.new(0, 8)
    submitCorner.Parent       = submitBtn

    -- Status label (True / Failed)
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Name                  = "StatusLabel"
    statusLabel.Size                  = UDim2.new(1, -28, 0, 30)
    statusLabel.Position              = UDim2.new(0, 14, 0, 180)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text                  = ""
    statusLabel.Font                  = Enum.Font.GothamBold
    statusLabel.TextSize              = 15
    statusLabel.TextXAlignment        = Enum.TextXAlignment.Center
    statusLabel.ZIndex                = 3
    statusLabel.Parent                = frame

    -- Tween helper for submit button color feedback
    local function flashBtn(color)
        local tween = TweenService:Create(
            submitBtn,
            TweenInfo.new(0.15, Enum.EasingStyle.Quad),
            { BackgroundColor3 = color }
        )
        tween:Play()
        task.delay(0.4, function()
            TweenService:Create(
                submitBtn,
                TweenInfo.new(0.15, Enum.EasingStyle.Quad),
                { BackgroundColor3 = Color3.fromHex("#8013E8") }
            ):Play()
        end)
    end

    -- Validate key logic
    local function tryKey(inputKey)
        inputKey = inputKey:gsub("^%s+", ""):gsub("%s+$", "")  -- trim whitespace
        if isValidKey(inputKey) then
            saveKey(inputKey)
            statusLabel.Text       = "✔  True"
            statusLabel.TextColor3 = Color3.fromRGB(80, 220, 100)
            flashBtn(Color3.fromRGB(40, 160, 60))
            submitBtn.Text = "Unlocked!"
            task.delay(0.8, function()
                screenGui:Destroy()
                RunMainScript()
            end)
        else
            statusLabel.Text       = "✘  Failed — Invalid Key"
            statusLabel.TextColor3 = Color3.fromRGB(220, 60, 60)
            flashBtn(Color3.fromRGB(160, 30, 30))
            -- Clear status after 3 seconds
            task.delay(3, function()
                if statusLabel and statusLabel.Parent then
                    statusLabel.Text = ""
                end
            end)
        end
    end

    submitBtn.MouseButton1Click:Connect(function()
        tryKey(keyBox.Text)
    end)

    -- Allow pressing Enter inside textbox
    keyBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            tryKey(keyBox.Text)
        end
    end)
end

-- ============================================================
-- STARTUP — check saved key first
-- ============================================================
task.spawn(function()
    print("[MAGIC HUB] Script loaded — checking key...")
    local ok, err = pcall(function()
        local saved = loadSavedKey()
        if saved and isValidKey(saved) then
            print("[MAGIC HUB] Saved key valid — launching main script")
            RunMainScript()
        else
            print("[MAGIC HUB] No valid key — showing key GUI")
            ShowGuiKey()
        end
    end)
    if not ok then
        warn("[MAGIC HUB] STARTUP ERROR: " .. tostring(err))
        -- Fallback: try to show GuiKey anyway
        local ok2, err2 = pcall(ShowGuiKey)
        if not ok2 then
            warn("[MAGIC HUB] GUIKEY FAILED: " .. tostring(err2))
        end
    end
end)
