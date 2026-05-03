-- ╔══════════════════════════════════════════════╗
-- ║         TD MACRO RECORDER & PLAYER          ║
-- ║         by Script Generator                 ║
-- ╚══════════════════════════════════════════════╝

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ══════════════════════════════════════════════
-- CONFIG
-- ══════════════════════════════════════════════
local CONFIG = {
    BG_OPACITY       = 0.43,
    PRIMARY          = Color3.fromRGB(120, 40, 200),   -- Tím chính
    PRIMARY_DARK     = Color3.fromRGB(70, 10, 130),    -- Tím đậm
    PRIMARY_LIGHT    = Color3.fromRGB(160, 80, 240),   -- Tím sáng
    ACCENT           = Color3.fromRGB(200, 150, 255),  -- Tím nhạt
    BG_DARK          = Color3.fromRGB(10, 5, 20),      -- Đen tím
    BG_MID           = Color3.fromRGB(20, 10, 35),     -- Đen tím nhạt
    PANEL_BG         = Color3.fromRGB(15, 7, 28),      -- Panel
    TEXT_MAIN        = Color3.fromRGB(230, 210, 255),  -- Chữ chính
    TEXT_DIM         = Color3.fromRGB(140, 110, 180),  -- Chữ mờ
    RED              = Color3.fromRGB(220, 60, 80),
    GREEN            = Color3.fromRGB(60, 200, 120),
    YELLOW           = Color3.fromRGB(240, 200, 60),
    FONT             = Enum.Font.GothamBold,
    FONT_REG         = Enum.Font.Gotham,
}

-- ══════════════════════════════════════════════
-- STATE
-- ══════════════════════════════════════════════
local State = {
    isRecording    = false,
    isPlaying      = false,
    recordStart    = 0,
    recordedData   = {},
    towerCount     = 0,
    selectedFile   = nil,
    selectedData   = nil,
    playConnections = {},
    hookConnections = {},
    statusMsg      = "Sẵn sàng",
}

-- ══════════════════════════════════════════════
-- HELPER: Tween
-- ══════════════════════════════════════════════
local function tween(obj, props, duration, style, dir)
    local info = TweenInfo.new(
        duration or 0.18,
        style or Enum.EasingStyle.Quart,
        dir or Enum.EasingDirection.Out
    )
    TweenService:Create(obj, info, props):Play()
end

-- ══════════════════════════════════════════════
-- HELPER: Corner + Shadow
-- ══════════════════════════════════════════════
local function corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 8)
    c.Parent = parent
    return c
end

local function stroke(parent, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color or CONFIG.PRIMARY
    s.Thickness = thickness or 1.5
    s.Transparency = 0.4
    s.Parent = parent
    return s
end

local function gradient(parent, col1, col2, rotation)
    local g = Instance.new("UIGradient")
    g.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, col1),
        ColorSequenceKeypoint.new(1, col2),
    })
    g.Rotation = rotation or 90
    g.Parent = parent
    return g
end

-- ══════════════════════════════════════════════
-- BUILD GUI
-- ══════════════════════════════════════════════
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TDMacroGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- ── Main Frame ─────────────────────────────────
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 380, 0, 500)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -250)
MainFrame.BackgroundColor3 = CONFIG.BG_DARK
MainFrame.BackgroundTransparency = 1 - CONFIG.BG_OPACITY
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui
corner(MainFrame, 14)
stroke(MainFrame, CONFIG.PRIMARY, 2)

gradient(MainFrame, CONFIG.BG_DARK, CONFIG.BG_MID, 135)

-- ── Glow Border ────────────────────────────────
local GlowFrame = Instance.new("Frame")
GlowFrame.Size = UDim2.new(1, 6, 1, 6)
GlowFrame.Position = UDim2.new(0, -3, 0, -3)
GlowFrame.BackgroundTransparency = 1
GlowFrame.ZIndex = 0
GlowFrame.Parent = MainFrame
local glowStroke = Instance.new("UIStroke")
glowStroke.Color = CONFIG.PRIMARY_LIGHT
glowStroke.Thickness = 3
glowStroke.Transparency = 0.7
glowStroke.Parent = GlowFrame
corner(GlowFrame, 16)

-- ── Title Bar ──────────────────────────────────
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 52)
TitleBar.BackgroundColor3 = CONFIG.PRIMARY_DARK
TitleBar.BackgroundTransparency = 0.2
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame
corner(TitleBar, 14)
gradient(TitleBar, CONFIG.PRIMARY_DARK, CONFIG.PRIMARY, 145)

local TitleIcon = Instance.new("TextLabel")
TitleIcon.Size = UDim2.new(0, 36, 0, 36)
TitleIcon.Position = UDim2.new(0, 12, 0.5, -18)
TitleIcon.BackgroundTransparency = 1
TitleIcon.Text = "⬡"
TitleIcon.TextColor3 = CONFIG.ACCENT
TitleIcon.TextSize = 26
TitleIcon.Font = CONFIG.FONT
TitleIcon.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -120, 1, 0)
TitleLabel.Position = UDim2.new(0, 52, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "TD MACRO"
TitleLabel.TextColor3 = CONFIG.TEXT_MAIN
TitleLabel.TextSize = 18
TitleLabel.Font = CONFIG.FONT
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

local TitleSub = Instance.new("TextLabel")
TitleSub.Size = UDim2.new(1, -120, 0, 18)
TitleSub.Position = UDim2.new(0, 52, 1, -20)
TitleSub.BackgroundTransparency = 1
TitleSub.Text = "Recorder & Player"
TitleSub.TextColor3 = CONFIG.ACCENT
TitleSub.TextSize = 11
TitleSub.Font = CONFIG.FONT_REG
TitleSub.TextXAlignment = Enum.TextXAlignment.Left
TitleSub.Parent = TitleBar

-- Close button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -42, 0.5, -15)
CloseBtn.BackgroundColor3 = CONFIG.RED
CloseBtn.BackgroundTransparency = 0.3
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.TextSize = 14
CloseBtn.Font = CONFIG.FONT
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TitleBar
corner(CloseBtn, 8)

-- Minimize button
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -78, 0.5, -15)
MinBtn.BackgroundColor3 = CONFIG.YELLOW
MinBtn.BackgroundTransparency = 0.4
MinBtn.Text = "─"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.TextSize = 14
MinBtn.Font = CONFIG.FONT
MinBtn.BorderSizePixel = 0
MinBtn.Parent = TitleBar
corner(MinBtn, 8)

-- ── Content Area ───────────────────────────────
local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -24, 1, -64)
Content.Position = UDim2.new(0, 12, 0, 58)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Padding = UDim.new(0, 10)
ContentLayout.Parent = Content

-- ── Section Label Helper ───────────────────────
local function sectionLabel(parent, text, order)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 0, 18)
    lbl.BackgroundTransparency = 1
    lbl.Text = "▸ " .. text
    lbl.TextColor3 = CONFIG.ACCENT
    lbl.TextSize = 11
    lbl.Font = CONFIG.FONT
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.LayoutOrder = order or 0
    lbl.Parent = parent
    return lbl
end

-- ── Status Panel ───────────────────────────────
local StatusPanel = Instance.new("Frame")
StatusPanel.Size = UDim2.new(1, 0, 0, 52)
StatusPanel.BackgroundColor3 = CONFIG.PANEL_BG
StatusPanel.BackgroundTransparency = 0.1
StatusPanel.BorderSizePixel = 0
StatusPanel.LayoutOrder = 1
StatusPanel.Parent = Content
corner(StatusPanel, 10)
stroke(StatusPanel, CONFIG.PRIMARY, 1.5)

local StatusDot = Instance.new("Frame")
StatusDot.Size = UDim2.new(0, 10, 0, 10)
StatusDot.Position = UDim2.new(0, 14, 0.5, -5)
StatusDot.BackgroundColor3 = CONFIG.GREEN
StatusDot.BorderSizePixel = 0
StatusDot.Parent = StatusPanel
corner(StatusDot, 5)

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, -36, 1, 0)
StatusText.Position = UDim2.new(0, 32, 0, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Sẵn sàng"
StatusText.TextColor3 = CONFIG.TEXT_MAIN
StatusText.TextSize = 13
StatusText.Font = CONFIG.FONT_REG
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.Parent = StatusPanel

local TimerText = Instance.new("TextLabel")
TimerText.Size = UDim2.new(0, 100, 1, 0)
TimerText.Position = UDim2.new(1, -108, 0, 0)
TimerText.BackgroundTransparency = 1
TimerText.Text = "00:00"
TimerText.TextColor3 = CONFIG.ACCENT
TimerText.TextSize = 20
TimerText.Font = CONFIG.FONT
TimerText.TextXAlignment = Enum.TextXAlignment.Right
TimerText.Parent = StatusPanel

-- ── Section: Ghi Macro ─────────────────────────
sectionLabel(Content, "GHI MACRO", 2)

local RecordRow = Instance.new("Frame")
RecordRow.Size = UDim2.new(1, 0, 0, 48)
RecordRow.BackgroundTransparency = 1
RecordRow.LayoutOrder = 3
RecordRow.Parent = Content

local RowLayout = Instance.new("UIListLayout")
RowLayout.FillDirection = Enum.FillDirection.Horizontal
RowLayout.SortOrder = Enum.SortOrder.LayoutOrder
RowLayout.Padding = UDim.new(0, 10)
RowLayout.Parent = RecordRow

-- ── Button Factory ─────────────────────────────
local function makeButton(parent, text, bgColor, order)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.5, -5, 1, 0)
    btn.BackgroundColor3 = bgColor
    btn.BackgroundTransparency = 0.15
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextSize = 13
    btn.Font = CONFIG.FONT
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.LayoutOrder = order or 0
    btn.Parent = parent
    corner(btn, 10)
    stroke(btn, bgColor, 1.5)

    gradient(btn, bgColor, bgColor:Lerp(Color3.new(0,0,0), 0.3), 90)

    btn.MouseEnter:Connect(function()
        tween(btn, {BackgroundTransparency = 0.0}, 0.12)
    end)
    btn.MouseLeave:Connect(function()
        tween(btn, {BackgroundTransparency = 0.15}, 0.15)
    end)
    btn.MouseButton1Down:Connect(function()
        tween(btn, {BackgroundTransparency = 0.35}, 0.08)
    end)
    btn.MouseButton1Up:Connect(function()
        tween(btn, {BackgroundTransparency = 0.0}, 0.1)
    end)
    return btn
end

local RecordBtn  = makeButton(RecordRow, "⏺  RECORD",   CONFIG.RED,   1)
local StopBtn    = makeButton(RecordRow, "⏹  STOP",     CONFIG.PRIMARY, 2)
StopBtn.BackgroundTransparency = 0.5

-- ── Save Button ────────────────────────────────
sectionLabel(Content, "LƯU FILE", 4)

local SavePanel = Instance.new("Frame")
SavePanel.Size = UDim2.new(1, 0, 0, 48)
SavePanel.BackgroundTransparency = 1
SavePanel.LayoutOrder = 5
SavePanel.Parent = Content

local SavePanelLayout = Instance.new("UIListLayout")
SavePanelLayout.FillDirection = Enum.FillDirection.Horizontal
SavePanelLayout.Padding = UDim.new(0, 10)
SavePanelLayout.Parent = SavePanel

local FileNameInput = Instance.new("TextBox")
FileNameInput.Size = UDim2.new(0.55, -5, 1, 0)
FileNameInput.BackgroundColor3 = CONFIG.PANEL_BG
FileNameInput.BackgroundTransparency = 0.1
FileNameInput.Text = "MagicTTD"
FileNameInput.PlaceholderText = "Tên file..."
FileNameInput.TextColor3 = CONFIG.TEXT_MAIN
FileNameInput.PlaceholderColor3 = CONFIG.TEXT_DIM
FileNameInput.TextSize = 12
FileNameInput.Font = CONFIG.FONT_REG
FileNameInput.ClearTextOnFocus = false
FileNameInput.BorderSizePixel = 0
FileNameInput.LayoutOrder = 1
FileNameInput.Parent = SavePanel
corner(FileNameInput, 10)
stroke(FileNameInput, CONFIG.PRIMARY, 1.5)

local SaveBtn = Instance.new("TextButton")
SaveBtn.Size = UDim2.new(0.45, -5, 1, 0)
SaveBtn.BackgroundColor3 = CONFIG.GREEN
SaveBtn.BackgroundTransparency = 0.15
SaveBtn.Text = "💾  LƯU FILE"
SaveBtn.TextColor3 = Color3.new(1,1,1)
SaveBtn.TextSize = 13
SaveBtn.Font = CONFIG.FONT
SaveBtn.BorderSizePixel = 0
SaveBtn.AutoButtonColor = false
SaveBtn.LayoutOrder = 2
SaveBtn.Parent = SavePanel
corner(SaveBtn, 10)
stroke(SaveBtn, CONFIG.GREEN, 1.5)
gradient(SaveBtn, CONFIG.GREEN, CONFIG.GREEN:Lerp(Color3.new(0,0,0),0.3), 90)

SaveBtn.MouseEnter:Connect(function() tween(SaveBtn, {BackgroundTransparency=0.0}, 0.12) end)
SaveBtn.MouseLeave:Connect(function() tween(SaveBtn, {BackgroundTransparency=0.15}, 0.15) end)

-- ── Separator ──────────────────────────────────
local Sep = Instance.new("Frame")
Sep.Size = UDim2.new(1, 0, 0, 2)
Sep.BackgroundColor3 = CONFIG.PRIMARY
Sep.BackgroundTransparency = 0.6
Sep.BorderSizePixel = 0
Sep.LayoutOrder = 6
Sep.Parent = Content
gradient(Sep, CONFIG.PRIMARY_LIGHT, Color3.new(0,0,0), 0)

-- ── Section: Phát Macro ────────────────────────
sectionLabel(Content, "PHÁT MACRO", 7)

-- File selector display
local FileSelectPanel = Instance.new("Frame")
FileSelectPanel.Size = UDim2.new(1, 0, 0, 48)
FileSelectPanel.BackgroundColor3 = CONFIG.PANEL_BG
FileSelectPanel.BackgroundTransparency = 0.1
FileSelectPanel.BorderSizePixel = 0
FileSelectPanel.LayoutOrder = 8
FileSelectPanel.Parent = Content
corner(FileSelectPanel, 10)
stroke(FileSelectPanel, CONFIG.PRIMARY, 1.5)

local FileIcon = Instance.new("TextLabel")
FileIcon.Size = UDim2.new(0, 36, 1, 0)
FileIcon.Position = UDim2.new(0, 8, 0, 0)
FileIcon.BackgroundTransparency = 1
FileIcon.Text = "📂"
FileIcon.TextSize = 18
FileIcon.Font = CONFIG.FONT
FileIcon.Parent = FileSelectPanel

local FileNameDisplay = Instance.new("TextLabel")
FileNameDisplay.Size = UDim2.new(1, -100, 1, 0)
FileNameDisplay.Position = UDim2.new(0, 44, 0, 0)
FileNameDisplay.BackgroundTransparency = 1
FileNameDisplay.Text = "Chưa chọn file macro..."
FileNameDisplay.TextColor3 = CONFIG.TEXT_DIM
FileNameDisplay.TextSize = 12
FileNameDisplay.Font = CONFIG.FONT_REG
FileNameDisplay.TextXAlignment = Enum.TextXAlignment.Left
FileNameDisplay.TextTruncate = Enum.TextTruncate.AtEnd
FileNameDisplay.Parent = FileSelectPanel

local LoadBtn = Instance.new("TextButton")
LoadBtn.Size = UDim2.new(0, 56, 0, 32)
LoadBtn.Position = UDim2.new(1, -64, 0.5, -16)
LoadBtn.BackgroundColor3 = CONFIG.PRIMARY
LoadBtn.BackgroundTransparency = 0.2
LoadBtn.Text = "Chọn"
LoadBtn.TextColor3 = Color3.new(1,1,1)
LoadBtn.TextSize = 12
LoadBtn.Font = CONFIG.FONT
LoadBtn.BorderSizePixel = 0
LoadBtn.AutoButtonColor = false
LoadBtn.Parent = FileSelectPanel
corner(LoadBtn, 8)
LoadBtn.MouseEnter:Connect(function() tween(LoadBtn, {BackgroundTransparency=0.0}, 0.12) end)
LoadBtn.MouseLeave:Connect(function() tween(LoadBtn, {BackgroundTransparency=0.2}, 0.15) end)

-- Play speed
local SpeedRow = Instance.new("Frame")
SpeedRow.Size = UDim2.new(1, 0, 0, 32)
SpeedRow.BackgroundTransparency = 1
SpeedRow.LayoutOrder = 9
SpeedRow.Parent = Content

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0, 120, 1, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Tốc độ phát:"
SpeedLabel.TextColor3 = CONFIG.TEXT_DIM
SpeedLabel.TextSize = 12
SpeedLabel.Font = CONFIG.FONT_REG
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.Parent = SpeedRow

local SpeedValue = Instance.new("TextLabel")
SpeedValue.Size = UDim2.new(0, 40, 1, 0)
SpeedValue.Position = UDim2.new(1, -42, 0, 0)
SpeedValue.BackgroundTransparency = 1
SpeedValue.Text = "1.0x"
SpeedValue.TextColor3 = CONFIG.ACCENT
SpeedValue.TextSize = 13
SpeedValue.Font = CONFIG.FONT
SpeedValue.TextXAlignment = Enum.TextXAlignment.Right
SpeedValue.Parent = SpeedRow

local SpeedSlider = Instance.new("Frame")
SpeedSlider.Size = UDim2.new(1, -170, 0, 6)
SpeedSlider.Position = UDim2.new(0, 128, 0.5, -3)
SpeedSlider.BackgroundColor3 = CONFIG.BG_MID
SpeedSlider.BorderSizePixel = 0
SpeedSlider.Parent = SpeedRow
corner(SpeedSlider, 3)
stroke(SpeedSlider, CONFIG.PRIMARY, 1)

local SpeedFill = Instance.new("Frame")
SpeedFill.Size = UDim2.new(0.33, 0, 1, 0)
SpeedFill.BackgroundColor3 = CONFIG.PRIMARY_LIGHT
SpeedFill.BorderSizePixel = 0
SpeedFill.Parent = SpeedSlider
corner(SpeedFill, 3)
gradient(SpeedFill, CONFIG.PRIMARY_LIGHT, CONFIG.PRIMARY, 0)

local SpeedThumb = Instance.new("TextButton")
SpeedThumb.Size = UDim2.new(0, 14, 0, 14)
SpeedThumb.Position = UDim2.new(0.33, -7, 0.5, -7)
SpeedThumb.BackgroundColor3 = Color3.new(1,1,1)
SpeedThumb.Text = ""
SpeedThumb.BorderSizePixel = 0
SpeedThumb.AutoButtonColor = false
SpeedThumb.ZIndex = 5
SpeedThumb.Parent = SpeedSlider
corner(SpeedThumb, 7)

-- Play macro button
local PlayBtn = Instance.new("TextButton")
PlayBtn.Size = UDim2.new(1, 0, 0, 48)
PlayBtn.BackgroundColor3 = CONFIG.PRIMARY
PlayBtn.BackgroundTransparency = 0.5
PlayBtn.Text = "▶  PHÁT MACRO"
PlayBtn.TextColor3 = Color3.fromRGB(180, 140, 220)
PlayBtn.TextSize = 15
PlayBtn.Font = CONFIG.FONT
PlayBtn.BorderSizePixel = 0
PlayBtn.AutoButtonColor = false
PlayBtn.LayoutOrder = 10
PlayBtn.Active = false
PlayBtn.Parent = Content
corner(PlayBtn, 10)
stroke(PlayBtn, CONFIG.PRIMARY, 1.5)

-- Stop play button
local StopPlayBtn = Instance.new("TextButton")
StopPlayBtn.Size = UDim2.new(1, 0, 0, 36)
StopPlayBtn.BackgroundColor3 = CONFIG.RED
StopPlayBtn.BackgroundTransparency = 0.2
StopPlayBtn.Text = "⏹  DỪNG PHÁT"
StopPlayBtn.TextColor3 = Color3.new(1,1,1)
StopPlayBtn.TextSize = 13
StopPlayBtn.Font = CONFIG.FONT
StopPlayBtn.BorderSizePixel = 0
StopPlayBtn.AutoButtonColor = false
StopPlayBtn.LayoutOrder = 11
StopPlayBtn.Visible = false
StopPlayBtn.Parent = Content
corner(StopPlayBtn, 10)
stroke(StopPlayBtn, CONFIG.RED, 1.5)
gradient(StopPlayBtn, CONFIG.RED, CONFIG.RED:Lerp(Color3.new(0,0,0),0.3), 90)
StopPlayBtn.MouseEnter:Connect(function() tween(StopPlayBtn, {BackgroundTransparency=0.0}, 0.12) end)
StopPlayBtn.MouseLeave:Connect(function() tween(StopPlayBtn, {BackgroundTransparency=0.2}, 0.15) end)

-- ══════════════════════════════════════════════
-- LOGIC: Speed Slider
-- ══════════════════════════════════════════════
local playSpeed = 1.0
local dragging = false

SpeedThumb.MouseButton1Down:Connect(function()
    dragging = true
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

RunService.Heartbeat:Connect(function()
    if dragging then
        local sliderPos = SpeedSlider.AbsolutePosition.X
        local sliderWidth = SpeedSlider.AbsoluteSize.X
        local mouseX = UserInputService:GetMouseLocation().X
        local pct = math.clamp((mouseX - sliderPos) / sliderWidth, 0, 1)
        -- Range: 0.5x → 3.0x
        playSpeed = 0.5 + pct * 2.5
        SpeedFill.Size = UDim2.new(pct, 0, 1, 0)
        SpeedThumb.Position = UDim2.new(pct, -7, 0.5, -7)
        SpeedValue.Text = string.format("%.1fx", playSpeed)
    end
end)

-- ══════════════════════════════════════════════
-- LOGIC: Drag Window
-- ══════════════════════════════════════════════
local draggingWindow = false
local dragStart, startPos

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingWindow = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingWindow = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if draggingWindow and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- ══════════════════════════════════════════════
-- LOGIC: Status updater
-- ══════════════════════════════════════════════
local function setStatus(msg, dotColor, timerStr)
    StatusText.Text = msg
    StatusDot.BackgroundColor3 = dotColor or CONFIG.GREEN
    if timerStr then TimerText.Text = timerStr end
end

-- ══════════════════════════════════════════════
-- LOGIC: Timer display while recording
-- ══════════════════════════════════════════════
local timerConn
local function startTimer()
    timerConn = RunService.Heartbeat:Connect(function()
        if State.isRecording then
            local elapsed = tick() - State.recordStart
            local m = math.floor(elapsed / 60)
            local s = math.floor(elapsed % 60)
            TimerText.Text = string.format("%02d:%02d", m, s)
        end
    end)
end
local function stopTimer()
    if timerConn then timerConn:Disconnect() timerConn = nil end
end

-- ══════════════════════════════════════════════
-- MACRO FORMAT: Serialise Vector3
-- ══════════════════════════════════════════════
local function serializeVector3(v3)
    return {["__t"] = "Vector3", x = v3.X, y = v3.Y, z = v3.Z}
end

local function encodeAction(entry)
    -- entry: {time, type, data}
    if entry.type == "PlaceTower" then
        return {
            entry.time,
            "PlaceTower",
            {
                tostring(entry.towerType),
                serializeVector3(entry.position),
                0,
                entry.mapId or "000000000000"
            },
            entry.towerNum,
            false,
            {targetName = "Tower_" .. entry.towerNum}
        }
    elseif entry.type == "UpgradeRem" then
        return {
            entry.time,
            "UpgradeRem",
            {},
            entry.towerNum,
            false,
            {u = entry.upgradeLevel}
        }
    end
end

local function buildJsonOutput()
    local result = {}
    for _, entry in ipairs(State.recordedData) do
        local encoded = encodeAction(entry)
        if encoded then
            table.insert(result, encoded)
        end
    end
    return HttpService:JSONEncode(result)
end

-- ══════════════════════════════════════════════
-- HOOK: Remote Events for recording
-- ══════════════════════════════════════════════
local mapId = "000000000000"

local function findRemote(name)
    local remotes = {
        game:GetService("ReplicatedStorage"):FindFirstChildOfClass("RemoteEvent"),
        game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"),
        game:GetService("ReplicatedStorage"):FindFirstChild("Events"),
    }
    -- Try to find the specific remote
    local rs = game:GetService("ReplicatedStorage")
    for _, desc in ipairs(rs:GetDescendants()) do
        if desc:IsA("RemoteEvent") and desc.Name == name then
            return desc
        end
        if desc:IsA("RemoteFunction") and desc.Name == name then
            return desc
        end
    end
    return nil
end

local function hookRemotes()
    -- Try to find PlaceTower remote
    local placeTowerRemote = findRemote("PlaceTower") or findRemote("placeTower") or findRemote("TowerPlace")
    local upgradeRemote = findRemote("UpgradeRem") or findRemote("UpgradeTower") or findRemote("upgrade")

    -- Hook using __namecall method for all remotes (executor approach)
    local originalNamecall
    originalNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = {...}

        if State.isRecording then
            local remoteName = self.Name or ""

            if method == "FireServer" or method == "InvokeServer" then
                if remoteName:lower():find("placetower") or remoteName:lower():find("place") then
                    local currentTime = tick() - State.recordStart
                    local towerType = args[1] and tostring(args[1]) or "1"
                    local position = args[2]
                    if typeof(position) == "Vector3" then
                        State.towerCount = State.towerCount + 1
                        table.insert(State.recordedData, {
                            time = currentTime,
                            type = "PlaceTower",
                            towerType = towerType,
                            position = position,
                            mapId = mapId,
                            towerNum = State.towerCount,
                        })
                        setStatus(string.format("⏺ Đang ghi... [%d tower]", State.towerCount), CONFIG.RED)
                    end
                elseif remoteName:lower():find("upgrade") then
                    local currentTime = tick() - State.recordStart
                    local towerNum = args[1] and tonumber(args[1]) or 0
                    local upgradeLevel = args[2] and tonumber(args[2]) or 1
                    table.insert(State.recordedData, {
                        time = currentTime,
                        type = "UpgradeRem",
                        towerNum = towerNum,
                        upgradeLevel = upgradeLevel,
                    })
                    setStatus(string.format("⏺ Đang ghi... [Upgrade Tower %d]", towerNum), CONFIG.RED)
                end
            end
        end

        return originalNamecall(self, ...)
    end)

    return originalNamecall
end

-- ══════════════════════════════════════════════
-- RECORD
-- ══════════════════════════════════════════════
local hookedNamecall = nil

RecordBtn.MouseButton1Click:Connect(function()
    if State.isRecording then return end
    if State.isPlaying then
        setStatus("⚠ Đang phát macro, không thể ghi!", CONFIG.YELLOW)
        return
    end

    State.isRecording = true
    State.recordStart = tick()
    State.recordedData = {}
    State.towerCount = 0
    TimerText.Text = "00:00"

    -- Activate record button style
    tween(RecordBtn, {BackgroundTransparency = 0.0}, 0.2)
    RecordBtn.Text = "⏺ ĐANG GHI..."
    tween(StopBtn, {BackgroundTransparency = 0.15}, 0.2)

    setStatus("⏺ Đang ghi hành động...", CONFIG.RED, "00:00")
    startTimer()

    -- Hook remotes if executor supports it
    pcall(function()
        hookedNamecall = hookRemotes()
    end)
end)

-- ══════════════════════════════════════════════
-- STOP RECORD
-- ══════════════════════════════════════════════
StopBtn.MouseButton1Click:Connect(function()
    if not State.isRecording then return end

    State.isRecording = false
    stopTimer()

    RecordBtn.Text = "⏺  RECORD"
    tween(RecordBtn, {BackgroundTransparency = 0.15}, 0.2)
    tween(StopBtn, {BackgroundTransparency = 0.5}, 0.2)

    local count = #State.recordedData
    setStatus(string.format("✓ Đã ghi %d hành động", count), CONFIG.GREEN)

    -- Unhook if needed
    if hookedNamecall then
        pcall(function()
            hookmetamethod(game, "__namecall", hookedNamecall)
        end)
        hookedNamecall = nil
    end
end)

-- ══════════════════════════════════════════════
-- SAVE FILE
-- ══════════════════════════════════════════════
SaveBtn.MouseButton1Click:Connect(function()
    if #State.recordedData == 0 then
        setStatus("⚠ Không có dữ liệu để lưu!", CONFIG.YELLOW)
        return
    end

    local fileName = FileNameInput.Text
    if fileName == "" then
        fileName = "MagicTTD"
    end

    -- Add timestamp suffix like original file format
    local timestamp = tostring(math.floor(tick() * 1000))
    local finalName = fileName .. "_" .. timestamp .. ".json"

    local jsonData = buildJsonOutput()

    -- Try writefile (executor only)
    local success, err = pcall(function()
        writefile(finalName, jsonData)
    end)

    if success then
        setStatus("✓ Đã lưu: " .. finalName, CONFIG.GREEN)
    else
        -- Fallback: copy to clipboard
        pcall(function()
            setclipboard(jsonData)
        end)
        setStatus("📋 Đã copy JSON vào clipboard!", CONFIG.ACCENT)
    end
end)

-- ══════════════════════════════════════════════
-- LOAD FILE (select macro)
-- ══════════════════════════════════════════════
LoadBtn.MouseButton1Click:Connect(function()
    -- Try to open file dialog (executor)
    local ok, result = pcall(function()
        return loadfile and loadfile() or nil
    end)

    -- Try readfile with a dialog or input
    -- Fallback: prompt user for filename
    local inputFrame = Instance.new("Frame")
    inputFrame.Size = UDim2.new(0, 320, 0, 160)
    inputFrame.Position = UDim2.new(0.5, -160, 0.5, -80)
    inputFrame.BackgroundColor3 = CONFIG.BG_DARK
    inputFrame.BackgroundTransparency = 0.05
    inputFrame.BorderSizePixel = 0
    inputFrame.ZIndex = 20
    inputFrame.Parent = ScreenGui
    corner(inputFrame, 12)
    stroke(inputFrame, CONFIG.PRIMARY, 2)
    gradient(inputFrame, CONFIG.BG_DARK, CONFIG.BG_MID, 135)

    local iTitle = Instance.new("TextLabel")
    iTitle.Size = UDim2.new(1, -16, 0, 36)
    iTitle.Position = UDim2.new(0, 8, 0, 8)
    iTitle.BackgroundTransparency = 1
    iTitle.Text = "Nhập tên file macro (.json)"
    iTitle.TextColor3 = CONFIG.ACCENT
    iTitle.TextSize = 13
    iTitle.Font = CONFIG.FONT
    iTitle.ZIndex = 21
    iTitle.Parent = inputFrame

    local iBox = Instance.new("TextBox")
    iBox.Size = UDim2.new(1, -16, 0, 36)
    iBox.Position = UDim2.new(0, 8, 0, 50)
    iBox.BackgroundColor3 = CONFIG.PANEL_BG
    iBox.BackgroundTransparency = 0.1
    iBox.Text = ""
    iBox.PlaceholderText = "vd: MagicTTD_1777819001881.json"
    iBox.TextColor3 = CONFIG.TEXT_MAIN
    iBox.PlaceholderColor3 = CONFIG.TEXT_DIM
    iBox.TextSize = 12
    iBox.Font = CONFIG.FONT_REG
    iBox.BorderSizePixel = 0
    iBox.ZIndex = 21
    iBox.Parent = inputFrame
    corner(iBox, 8)
    stroke(iBox, CONFIG.PRIMARY, 1.5)

    local iConfirm = Instance.new("TextButton")
    iConfirm.Size = UDim2.new(0.45, -8, 0, 36)
    iConfirm.Position = UDim2.new(0, 8, 1, -44)
    iConfirm.BackgroundColor3 = CONFIG.PRIMARY
    iConfirm.BackgroundTransparency = 0.1
    iConfirm.Text = "✓ Xác nhận"
    iConfirm.TextColor3 = Color3.new(1,1,1)
    iConfirm.TextSize = 13
    iConfirm.Font = CONFIG.FONT
    iConfirm.BorderSizePixel = 0
    iConfirm.ZIndex = 21
    iConfirm.Parent = inputFrame
    corner(iConfirm, 8)

    local iCancel = Instance.new("TextButton")
    iCancel.Size = UDim2.new(0.45, -8, 0, 36)
    iCancel.Position = UDim2.new(0.55, 0, 1, -44)
    iCancel.BackgroundColor3 = CONFIG.RED
    iCancel.BackgroundTransparency = 0.2
    iCancel.Text = "✕ Hủy"
    iCancel.TextColor3 = Color3.new(1,1,1)
    iCancel.TextSize = 13
    iCancel.Font = CONFIG.FONT
    iCancel.BorderSizePixel = 0
    iCancel.ZIndex = 21
    iCancel.Parent = inputFrame
    corner(iCancel, 8)

    iCancel.MouseButton1Click:Connect(function()
        inputFrame:Destroy()
    end)

    iConfirm.MouseButton1Click:Connect(function()
        local fname = iBox.Text
        if fname == "" then
            inputFrame:Destroy()
            return
        end

        -- Try readfile
        local fileOk, fileData = pcall(function()
            return readfile(fname)
        end)

        if fileOk and fileData then
            local parseOk, parsed = pcall(function()
                return HttpService:JSONDecode(fileData)
            end)
            if parseOk and parsed then
                State.selectedFile = fname
                State.selectedData = parsed
                FileNameDisplay.Text = fname
                FileNameDisplay.TextColor3 = CONFIG.TEXT_MAIN

                -- Enable play button
                PlayBtn.BackgroundTransparency = 0.15
                PlayBtn.TextColor3 = Color3.new(1,1,1)
                PlayBtn.Active = true
                tween(PlayBtn, {BackgroundColor3 = CONFIG.PRIMARY}, 0.2)
                stroke(PlayBtn, CONFIG.PRIMARY_LIGHT, 2)
                gradient(PlayBtn, CONFIG.PRIMARY, CONFIG.PRIMARY_DARK, 90)

                setStatus("✓ Đã tải: " .. fname, CONFIG.GREEN)
            else
                setStatus("⚠ File JSON không hợp lệ!", CONFIG.RED)
            end
        else
            -- Try paste from clipboard as fallback
            local clipOk, clipData = pcall(function()
                return getclipboard and getclipboard() or ""
            end)
            if clipOk and clipData and clipData ~= "" then
                local parseOk2, parsed2 = pcall(function()
                    return HttpService:JSONDecode(clipData)
                end)
                if parseOk2 and parsed2 then
                    State.selectedFile = "clipboard"
                    State.selectedData = parsed2
                    FileNameDisplay.Text = "[Từ clipboard]"
                    FileNameDisplay.TextColor3 = CONFIG.TEXT_MAIN
                    PlayBtn.BackgroundTransparency = 0.15
                    PlayBtn.TextColor3 = Color3.new(1,1,1)
                    PlayBtn.Active = true
                    setStatus("✓ Đã tải từ clipboard", CONFIG.GREEN)
                else
                    setStatus("⚠ Không đọc được file!", CONFIG.RED)
                end
            else
                setStatus("⚠ Không tìm thấy file: " .. fname, CONFIG.RED)
            end
        end

        inputFrame:Destroy()
    end)
end)

-- ══════════════════════════════════════════════
-- PLAY MACRO
-- ══════════════════════════════════════════════
local function findPlaceTowerRemote()
    local rs = game:GetService("ReplicatedStorage")
    for _, d in ipairs(rs:GetDescendants()) do
        if (d:IsA("RemoteEvent") or d:IsA("RemoteFunction")) then
            local n = d.Name:lower()
            if n:find("placetower") or n:find("place_tower") then
                return d
            end
        end
    end
    return nil
end

local function findUpgradeRemote()
    local rs = game:GetService("ReplicatedStorage")
    for _, d in ipairs(rs:GetDescendants()) do
        if (d:IsA("RemoteEvent") or d:IsA("RemoteFunction")) then
            local n = d.Name:lower()
            if n:find("upgrade") then
                return d
            end
        end
    end
    return nil
end

local function decodeVector3(v3data)
    if type(v3data) == "table" and v3data["__t"] == "Vector3" then
        return Vector3.new(v3data.x, v3data.y, v3data.z)
    end
    return Vector3.new(0, 0, 0)
end

PlayBtn.MouseButton1Click:Connect(function()
    if not PlayBtn.Active then
        setStatus("⚠ Hãy chọn file macro trước!", CONFIG.YELLOW)
        return
    end
    if State.isRecording then
        setStatus("⚠ Đang ghi, không thể phát!", CONFIG.YELLOW)
        return
    end
    if State.isPlaying then return end
    if not State.selectedData then
        setStatus("⚠ Không có dữ liệu macro!", CONFIG.YELLOW)
        return
    end

    State.isPlaying = true
    PlayBtn.Visible = false
    StopPlayBtn.Visible = true
    setStatus("▶ Đang phát macro...", CONFIG.PRIMARY_LIGHT, "00:00")

    local placeRemote = findPlaceTowerRemote()
    local upgradeRemote = findUpgradeRemote()
    local data = State.selectedData
    local totalActions = #data

    task.spawn(function()
        local playStart = tick()
        local actionIdx = 1
        local stopped = false

        local stopConn
        stopConn = StopPlayBtn.MouseButton1Click:Connect(function()
            stopped = true
        end)

        while actionIdx <= totalActions and State.isPlaying and not stopped do
            local entry = data[actionIdx]
            if type(entry) ~= "table" then
                actionIdx = actionIdx + 1
                continue
            end

            local entryTime = entry[1]
            local actionType = entry[2]
            local args = entry[3]
            local towerNum = entry[4]

            -- Wait until the right time (adjusted by playSpeed)
            local scaledTime = entryTime / playSpeed
            local elapsed = tick() - playStart
            if scaledTime > elapsed then
                task.wait(scaledTime - elapsed)
            end

            if stopped or not State.isPlaying then break end

            -- Fire the action
            if actionType == "PlaceTower" then
                local towerType = args[1]
                local pos = decodeVector3(args[2])
                local targetMapId = args[4] or mapId

                if placeRemote then
                    if placeRemote:IsA("RemoteEvent") then
                        placeRemote:FireServer(towerType, pos, 0, targetMapId)
                    else
                        placeRemote:InvokeServer(towerType, pos, 0, targetMapId)
                    end
                else
                    -- Try via game namespace
                    pcall(function()
                        game:GetService("ReplicatedStorage")
                            :FindFirstChild("PlaceTower"):FireServer(towerType, pos, 0, targetMapId)
                    end)
                end
                setStatus(string.format("▶ PlaceTower [%d/%d]", actionIdx, totalActions), CONFIG.PRIMARY_LIGHT)

            elseif actionType == "UpgradeRem" then
                local uData = entry[6]
                local uLevel = uData and uData.u or 1

                if upgradeRemote then
                    if upgradeRemote:IsA("RemoteEvent") then
                        upgradeRemote:FireServer(towerNum, uLevel)
                    else
                        upgradeRemote:InvokeServer(towerNum, uLevel)
                    end
                else
                    pcall(function()
                        game:GetService("ReplicatedStorage")
                            :FindFirstChild("UpgradeRem"):FireServer(towerNum, uLevel)
                    end)
                end
                setStatus(string.format("▶ UpgradeRem T%d → lv%d [%d/%d]", towerNum, uLevel, actionIdx, totalActions), CONFIG.PRIMARY_LIGHT)
            end

            -- Update timer
            local e = tick() - playStart
            TimerText.Text = string.format("%02d:%02d", math.floor(e/60), math.floor(e%60))

            actionIdx = actionIdx + 1
        end

        stopConn:Disconnect()

        State.isPlaying = false
        PlayBtn.Visible = true
        StopPlayBtn.Visible = false

        if actionIdx > totalActions then
            setStatus(string.format("✓ Phát xong %d hành động!", totalActions), CONFIG.GREEN)
        else
            setStatus("⏹ Đã dừng phát macro", CONFIG.YELLOW)
        end
    end)
end)

StopPlayBtn.MouseButton1Click:Connect(function()
    State.isPlaying = false
    PlayBtn.Visible = true
    StopPlayBtn.Visible = false
    setStatus("⏹ Đã dừng phát macro", CONFIG.YELLOW)
end)

-- ══════════════════════════════════════════════
-- CLOSE / MINIMIZE
-- ══════════════════════════════════════════════
local minimized = false

CloseBtn.MouseButton1Click:Connect(function()
    tween(MainFrame, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    task.delay(0.3, function()
        ScreenGui:Destroy()
    end)
end)

MinBtn.MouseButton1Click:Connect(function()
    if minimized then
        tween(MainFrame, {Size = UDim2.new(0, 380, 0, 500)}, 0.25, Enum.EasingStyle.Back)
        minimized = false
    else
        tween(MainFrame, {Size = UDim2.new(0, 380, 0, 52)}, 0.2, Enum.EasingStyle.Quart)
        minimized = true
    end
end)

-- ══════════════════════════════════════════════
-- OPEN ANIMATION
-- ══════════════════════════════════════════════
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
tween(MainFrame, {
    Size = UDim2.new(0, 380, 0, 500),
    Position = UDim2.new(0.5, -190, 0.5, -250)
}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

-- ══════════════════════════════════════════════
-- DONE
-- ══════════════════════════════════════════════
print("[TD Macro] Script loaded successfully!")
print("[TD Macro] - Record: bắt đầu ghi hành động")
print("[TD Macro] - Stop: dừng ghi")
print("[TD Macro] - Save: lưu file JSON giống format gốc")
print("[TD Macro] - Chọn + Phát: phát lại macro")
