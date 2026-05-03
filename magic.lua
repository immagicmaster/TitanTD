-- ╔══════════════════════════════════════════════════╗
-- ║           TD MACRO RECORDER & PLAYER            ║
-- ╚══════════════════════════════════════════════════╝

local Players        = game:GetService("Players")
local RunService     = game:GetService("RunService")
local TweenService   = game:GetService("TweenService")
local HttpService    = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

-- ══════════════════════════════════════════════════
-- CONFIG
-- ══════════════════════════════════════════════════
local C = {
    BG_OPACITY    = 0.43,
    PRIMARY       = Color3.fromRGB(120, 40, 200),
    PRIMARY_DARK  = Color3.fromRGB(60,  8, 120),
    PRIMARY_LIGHT = Color3.fromRGB(165, 85, 245),
    ACCENT        = Color3.fromRGB(205, 155, 255),
    BG_DARK       = Color3.fromRGB(8,   4,  18),
    BG_MID        = Color3.fromRGB(18,  9,  32),
    PANEL         = Color3.fromRGB(14,  6,  26),
    TEXT          = Color3.fromRGB(228, 210, 255),
    DIM           = Color3.fromRGB(138, 108, 175),
    RED           = Color3.fromRGB(220, 55,  75),
    GREEN         = Color3.fromRGB(55,  200, 115),
    YELLOW        = Color3.fromRGB(240, 195, 55),
    FONT          = Enum.Font.GothamBold,
    FONT_REG      = Enum.Font.Gotham,
}

-- ══════════════════════════════════════════════════
-- STATE
-- ══════════════════════════════════════════════════
local State = {
    isRecording  = false,
    isPlaying    = false,
    recordStart  = 0,
    recordedData = {},
    towerCount   = 0,
    selectedFile = nil,
    selectedData = nil,
    lastHookTime = 0,  -- Để throttle 0.1s delay cho recorder
}

-- ══════════════════════════════════════════════════
-- UTILS
-- ══════════════════════════════════════════════════
local function tw(obj, props, t, style, dir)
    TweenService:Create(obj, TweenInfo.new(
        t or 0.18,
        style or Enum.EasingStyle.Quart,
        dir  or Enum.EasingDirection.Out
    ), props):Play()
end

local function mkCorner(p, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 8)
    c.Parent = p
end

local function mkStroke(p, col, th, trans)
    local s = Instance.new("UIStroke")
    s.Color = col or C.PRIMARY
    s.Thickness = th or 1.5
    s.Transparency = trans or 0.35
    s.Parent = p
end

local function mkGrad(p, c1, c2, rot)
    local g = Instance.new("UIGradient")
    g.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, c1),
        ColorSequenceKeypoint.new(1, c2),
    })
    g.Rotation = rot or 90
    g.Parent = p
end

-- Serial ngẫu nhiên: 3 chữ số + 3 chữ cái  → vd "729kIJ"
local function makeSerial()
    local digits  = "0123456789"
    local letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local s = ""
    for i = 1, 3 do
        local idx = math.random(1, #digits)
        s = s .. digits:sub(idx, idx)
    end
    for i = 1, 3 do
        local idx = math.random(1, #letters)
        s = s .. letters:sub(idx, idx)
    end
    return s
end

-- Lấy danh sách file .json trong workspace
local function getJsonFiles()
    local files = {}
    local ok, list = pcall(function() return listfiles("") end)
    if not ok or type(list) ~= "table" then
        ok, list = pcall(function() return listfiles() end)
    end
    if ok and type(list) == "table" then
        for _, path in ipairs(list) do
            local name = tostring(path)
            -- Lấy tên file từ đường dẫn đầy đủ
            local fname = name:match("([^/\\]+)$") or name
            if fname:lower():match("%.json$") then
                table.insert(files, {path = name, name = fname})
            end
        end
    end
    return files
end

-- ══════════════════════════════════════════════════
-- BUILD GUI
-- ══════════════════════════════════════════════════
if PlayerGui:FindFirstChild("TDMacroGUI") then
    PlayerGui:FindFirstChild("TDMacroGUI"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TDMacroGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- ── Main Frame ──────────────────────────────────────
local MainFrame = Instance.new("Frame")
MainFrame.Name = "Main"
MainFrame.Size = UDim2.new(0, 370, 0, 0)   -- sẽ tween mở
MainFrame.Position = UDim2.new(0.5, -185, 0.5, 0)
MainFrame.BackgroundColor3 = C.BG_DARK
MainFrame.BackgroundTransparency = 1 - C.BG_OPACITY
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui
mkCorner(MainFrame, 14)
mkStroke(MainFrame, C.PRIMARY, 2, 0.25)
mkGrad(MainFrame, C.BG_DARK, C.BG_MID, 135)

-- ── Title Bar ───────────────────────────────────────
local TBar = Instance.new("Frame")
TBar.Size = UDim2.new(1, 0, 0, 50)
TBar.BackgroundColor3 = C.PRIMARY_DARK
TBar.BackgroundTransparency = 0.15
TBar.BorderSizePixel = 0
TBar.Parent = MainFrame
mkCorner(TBar, 14)
mkGrad(TBar, C.PRIMARY_DARK, C.PRIMARY, 150)

local TIcon = Instance.new("TextLabel")
TIcon.Size = UDim2.new(0, 34, 0, 34)
TIcon.Position = UDim2.new(0, 12, 0.5, -17)
TIcon.BackgroundTransparency = 1
TIcon.Text = "⬡"
TIcon.TextColor3 = C.ACCENT
TIcon.TextSize = 24
TIcon.Font = C.FONT
TIcon.Parent = TBar

local TTitle = Instance.new("TextLabel")
TTitle.Size = UDim2.new(1, -130, 0, 22)
TTitle.Position = UDim2.new(0, 50, 0, 7)
TTitle.BackgroundTransparency = 1
TTitle.Text = "TD MACRO"
TTitle.TextColor3 = C.TEXT
TTitle.TextSize = 17
TTitle.Font = C.FONT
TTitle.TextXAlignment = Enum.TextXAlignment.Left
TTitle.Parent = TBar

local TSub = Instance.new("TextLabel")
TSub.Size = UDim2.new(1, -130, 0, 15)
TSub.Position = UDim2.new(0, 50, 0, 30)
TSub.BackgroundTransparency = 1
TSub.Text = "Recorder & Player"
TSub.TextColor3 = C.ACCENT
TSub.TextSize = 10
TSub.Font = C.FONT_REG
TSub.TextXAlignment = Enum.TextXAlignment.Left
TSub.Parent = TBar

local function mkTitleBtn(xOffset, bgCol, txt)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 28, 0, 28)
    b.Position = UDim2.new(1, xOffset, 0.5, -14)
    b.BackgroundColor3 = bgCol
    b.BackgroundTransparency = 0.35
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.TextSize = 13
    b.Font = C.FONT
    b.BorderSizePixel = 0
    b.AutoButtonColor = false
    b.Parent = TBar
    mkCorner(b, 7)
    b.MouseEnter:Connect(function() tw(b, {BackgroundTransparency=0.1}, 0.1) end)
    b.MouseLeave:Connect(function() tw(b, {BackgroundTransparency=0.35}, 0.12) end)
    return b
end

local CloseBtn = mkTitleBtn(-38, C.RED,    "✕")
local MinBtn   = mkTitleBtn(-72, C.YELLOW, "─")

-- ── Scroll Content ──────────────────────────────────
local Scroll = Instance.new("ScrollingFrame")
Scroll.Name = "Scroll"
Scroll.Size = UDim2.new(1, 0, 1, -54)
Scroll.Position = UDim2.new(0, 0, 0, 54)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 3
Scroll.ScrollBarImageColor3 = C.PRIMARY
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.Parent = MainFrame

local Pad = Instance.new("UIPadding")
Pad.PaddingLeft   = UDim.new(0, 12)
Pad.PaddingRight  = UDim.new(0, 12)
Pad.PaddingTop    = UDim.new(0, 10)
Pad.PaddingBottom = UDim.new(0, 10)
Pad.Parent = Scroll

local Layout = Instance.new("UIListLayout")
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Padding = UDim.new(0, 8)
Layout.Parent = Scroll

-- ══════════════════════════════════════════════════
-- COMPONENT HELPERS
-- ══════════════════════════════════════════════════
local function secLabel(txt, order)
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, 0, 0, 16)
    l.BackgroundTransparency = 1
    l.Text = "▸  " .. txt
    l.TextColor3 = C.ACCENT
    l.TextSize = 10
    l.Font = C.FONT
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.LayoutOrder = order
    l.Parent = Scroll
    return l
end

local function mkPanel(h, order)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 0, h)
    f.BackgroundColor3 = C.PANEL
    f.BackgroundTransparency = 0.08
    f.BorderSizePixel = 0
    f.LayoutOrder = order
    f.Parent = Scroll
    mkCorner(f, 10)
    mkStroke(f, C.PRIMARY, 1.5, 0.45)
    return f
end

local function mkBtn(parent, txt, bgCol, sx, sy, ox, oy, px, py)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(sx or 1, ox or 0, sy or 0, oy or 40)
    b.Position = UDim2.new(px or 0, 0, py or 0, 0)
    b.BackgroundColor3 = bgCol
    b.BackgroundTransparency = 0.15
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.TextSize = 13
    b.Font = C.FONT
    b.BorderSizePixel = 0
    b.AutoButtonColor = false
    b.Parent = parent
    mkCorner(b, 10)
    mkStroke(b, bgCol, 1.5, 0.3)
    mkGrad(b, bgCol, bgCol:Lerp(Color3.new(0,0,0), 0.28), 90)
    b.MouseEnter:Connect(function() tw(b, {BackgroundTransparency=0.0}, 0.1) end)
    b.MouseLeave:Connect(function() tw(b, {BackgroundTransparency=0.15}, 0.12) end)
    b.MouseButton1Down:Connect(function() tw(b, {BackgroundTransparency=0.38}, 0.07) end)
    b.MouseButton1Up:Connect(function() tw(b, {BackgroundTransparency=0.0}, 0.08) end)
    return b
end

local function mkSep(order)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 0, 1)
    f.BackgroundColor3 = C.PRIMARY
    f.BackgroundTransparency = 0.55
    f.BorderSizePixel = 0
    f.LayoutOrder = order
    f.Parent = Scroll
    mkGrad(f, C.PRIMARY_LIGHT, C.BG_DARK, 0)
end

-- ══════════════════════════════════════════════════
-- STATUS PANEL  (order 1)
-- ══════════════════════════════════════════════════
local StatPanel = mkPanel(50, 1)

local StatDot = Instance.new("Frame")
StatDot.Size = UDim2.new(0, 9, 0, 9)
StatDot.Position = UDim2.new(0, 14, 0.5, -4)
StatDot.BackgroundColor3 = C.GREEN
StatDot.BorderSizePixel = 0
StatDot.Parent = StatPanel
mkCorner(StatDot, 5)

local StatText = Instance.new("TextLabel")
StatText.Size = UDim2.new(1, -115, 1, 0)
StatText.Position = UDim2.new(0, 30, 0, 0)
StatText.BackgroundTransparency = 1
StatText.Text = "Sẵn sàng"
StatText.TextColor3 = C.TEXT
StatText.TextSize = 12
StatText.Font = C.FONT_REG
StatText.TextXAlignment = Enum.TextXAlignment.Left
StatText.Parent = StatPanel

local TimerLbl = Instance.new("TextLabel")
TimerLbl.Size = UDim2.new(0, 88, 1, 0)
TimerLbl.Position = UDim2.new(1, -96, 0, 0)
TimerLbl.BackgroundTransparency = 1
TimerLbl.Text = "00:00"
TimerLbl.TextColor3 = C.ACCENT
TimerLbl.TextSize = 20
TimerLbl.Font = C.FONT
TimerLbl.TextXAlignment = Enum.TextXAlignment.Right
TimerLbl.Parent = StatPanel

local function setStatus(msg, dotCol)
    StatText.Text = msg
    StatDot.BackgroundColor3 = dotCol or C.GREEN
end

-- ══════════════════════════════════════════════════
-- GHI MACRO  (order 2-4)
-- ══════════════════════════════════════════════════
secLabel("GHI MACRO", 2)

local RecRow = Instance.new("Frame")
RecRow.Size = UDim2.new(1, 0, 0, 44)
RecRow.BackgroundTransparency = 1
RecRow.LayoutOrder = 3
RecRow.Parent = Scroll

local RecRowLayout = Instance.new("UIListLayout")
RecRowLayout.FillDirection = Enum.FillDirection.Horizontal
RecRowLayout.Padding = UDim.new(0, 8)
RecRowLayout.Parent = RecRow

local RecordBtn = mkBtn(RecRow, "⏺  RECORD", C.RED,    0.5, 1, -4, 44, 0, 0)
local StopBtn   = mkBtn(RecRow, "⏹  STOP",   C.PRIMARY, 0.5, 1, -4, 44, 0, 0)
StopBtn.BackgroundTransparency = 0.55
StopBtn.TextColor3 = C.DIM

-- ══════════════════════════════════════════════════
-- LƯU FILE  (order 5-7)
-- ══════════════════════════════════════════════════
secLabel("LƯU FILE", 5)

local SaveRow = Instance.new("Frame")
SaveRow.Size = UDim2.new(1, 0, 0, 44)
SaveRow.BackgroundTransparency = 1
SaveRow.LayoutOrder = 6
SaveRow.Parent = Scroll

local SaveRowLayout = Instance.new("UIListLayout")
SaveRowLayout.FillDirection = Enum.FillDirection.Horizontal
SaveRowLayout.Padding = UDim.new(0, 8)
SaveRowLayout.Parent = SaveRow

-- TextBox tên file (tùy chỉnh)
local NameBox = Instance.new("TextBox")
NameBox.Size = UDim2.new(0.58, -4, 1, 0)
NameBox.BackgroundColor3 = C.PANEL
NameBox.BackgroundTransparency = 0.05
NameBox.Text = "MagicTTD"
NameBox.PlaceholderText = "Tên file tùy chỉnh..."
NameBox.TextColor3 = C.TEXT
NameBox.PlaceholderColor3 = C.DIM
NameBox.TextSize = 12
NameBox.Font = C.FONT_REG
NameBox.ClearTextOnFocus = false
NameBox.BorderSizePixel = 0
NameBox.LayoutOrder = 1
NameBox.Parent = SaveRow
mkCorner(NameBox, 10)
mkStroke(NameBox, C.PRIMARY, 1.5, 0.35)

-- Preview tên file sẽ được lưu
local NamePreview = Instance.new("TextLabel")
NamePreview.Size = UDim2.new(1, -20, 0, 13)
NamePreview.Position = UDim2.new(0, 10, 1, 2)
NamePreview.BackgroundTransparency = 1
NamePreview.Text = ""
NamePreview.TextColor3 = C.DIM
NamePreview.TextSize = 9
NamePreview.Font = C.FONT_REG
NamePreview.TextXAlignment = Enum.TextXAlignment.Left
NamePreview.Parent = SaveRow

local SaveBtn = mkBtn(SaveRow, "💾  LƯU", C.GREEN, 0.42, 1, -4, 44, 0, 0)
SaveBtn.LayoutOrder = 2

-- Cập nhật preview tên file khi gõ
local function updateNamePreview()
    local base = NameBox.Text ~= "" and NameBox.Text or "macro"
    NamePreview.Text = "→ " .. base .. "XXXyyy.json  (serial ngẫu nhiên)"
end

NameBox:GetPropertyChangedSignal("Text"):Connect(updateNamePreview)
updateNamePreview()

-- Thêm label phụ bên dưới SaveRow
local SaveHint = Instance.new("Frame")
SaveHint.Size = UDim2.new(1, 0, 0, 14)
SaveHint.BackgroundTransparency = 1
SaveHint.LayoutOrder = 7
SaveHint.Parent = Scroll

local SaveHintLbl = Instance.new("TextLabel")
SaveHintLbl.Size = UDim2.new(1, 0, 1, 0)
SaveHintLbl.BackgroundTransparency = 1
SaveHintLbl.Text = "Tên file = Tên tùy chỉnh + Mã serial 6 ký tự ngẫu nhiên"
SaveHintLbl.TextColor3 = C.DIM
SaveHintLbl.TextSize = 9
SaveHintLbl.Font = C.FONT_REG
SaveHintLbl.TextXAlignment = Enum.TextXAlignment.Left
SaveHintLbl.Parent = SaveHint

mkSep(8)

-- ══════════════════════════════════════════════════
-- PHÁT MACRO  (order 9-14)
-- ══════════════════════════════════════════════════
secLabel("PHÁT MACRO", 9)

-- ── Header của dropdown (bấm để mở/đóng) ──────────
local DropHeader = Instance.new("TextButton")
DropHeader.Size = UDim2.new(1, 0, 0, 42)
DropHeader.BackgroundColor3 = C.PANEL
DropHeader.BackgroundTransparency = 0.05
DropHeader.Text = ""
DropHeader.BorderSizePixel = 0
DropHeader.AutoButtonColor = false
DropHeader.LayoutOrder = 10
DropHeader.Parent = Scroll
mkCorner(DropHeader, 10)
mkStroke(DropHeader, C.PRIMARY, 1.5, 0.35)

local DropIcon = Instance.new("TextLabel")
DropIcon.Size = UDim2.new(0, 32, 1, 0)
DropIcon.Position = UDim2.new(0, 8, 0, 0)
DropIcon.BackgroundTransparency = 1
DropIcon.Text = "📂"
DropIcon.TextSize = 16
DropIcon.Font = C.FONT
DropIcon.Parent = DropHeader

local DropSelectedLbl = Instance.new("TextLabel")
DropSelectedLbl.Size = UDim2.new(1, -88, 1, 0)
DropSelectedLbl.Position = UDim2.new(0, 40, 0, 0)
DropSelectedLbl.BackgroundTransparency = 1
DropSelectedLbl.Text = "Chọn file macro..."
DropSelectedLbl.TextColor3 = C.DIM
DropSelectedLbl.TextSize = 12
DropSelectedLbl.Font = C.FONT_REG
DropSelectedLbl.TextXAlignment = Enum.TextXAlignment.Left
DropSelectedLbl.TextTruncate = Enum.TextTruncate.AtEnd
DropSelectedLbl.Parent = DropHeader

local RefreshBtn = Instance.new("TextButton")
RefreshBtn.Size = UDim2.new(0, 34, 0, 30)
RefreshBtn.Position = UDim2.new(1, -80, 0.5, -15)
RefreshBtn.BackgroundColor3 = C.PRIMARY
RefreshBtn.BackgroundTransparency = 0.35
RefreshBtn.Text = "↺"
RefreshBtn.TextColor3 = Color3.new(1,1,1)
RefreshBtn.TextSize = 16
RefreshBtn.Font = C.FONT
RefreshBtn.BorderSizePixel = 0
RefreshBtn.AutoButtonColor = false
RefreshBtn.ZIndex = 3
RefreshBtn.Parent = DropHeader
mkCorner(RefreshBtn, 8)
RefreshBtn.MouseEnter:Connect(function() tw(RefreshBtn, {BackgroundTransparency=0.1}, 0.1) end)
RefreshBtn.MouseLeave:Connect(function() tw(RefreshBtn, {BackgroundTransparency=0.35}, 0.12) end)

local DropArrow = Instance.new("TextLabel")
DropArrow.Size = UDim2.new(0, 30, 1, 0)
DropArrow.Position = UDim2.new(1, -38, 0, 0)
DropArrow.BackgroundTransparency = 1
DropArrow.Text = "▼"
DropArrow.TextColor3 = C.ACCENT
DropArrow.TextSize = 12
DropArrow.Font = C.FONT
DropArrow.Parent = DropHeader

-- ── Dropdown List ──────────────────────────────────
local DropListWrap = Instance.new("Frame")
DropListWrap.Size = UDim2.new(1, 0, 0, 0)   -- height sẽ tween
DropListWrap.BackgroundColor3 = C.PANEL
DropListWrap.BackgroundTransparency = 0.05
DropListWrap.BorderSizePixel = 0
DropListWrap.ClipsDescendants = true
DropListWrap.LayoutOrder = 11
DropListWrap.Parent = Scroll
mkCorner(DropListWrap, 10)
mkStroke(DropListWrap, C.PRIMARY_LIGHT, 1.5, 0.4)

local DropScroll = Instance.new("ScrollingFrame")
DropScroll.Size = UDim2.new(1, -4, 1, 0)
DropScroll.Position = UDim2.new(0, 2, 0, 0)
DropScroll.BackgroundTransparency = 1
DropScroll.BorderSizePixel = 0
DropScroll.ScrollBarThickness = 2
DropScroll.ScrollBarImageColor3 = C.PRIMARY
DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
DropScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
DropScroll.Parent = DropListWrap

local DropLayout = Instance.new("UIListLayout")
DropLayout.SortOrder = Enum.SortOrder.LayoutOrder
DropLayout.Padding = UDim.new(0, 2)
DropLayout.Parent = DropScroll

local DropPad = Instance.new("UIPadding")
DropPad.PaddingLeft   = UDim.new(0, 4)
DropPad.PaddingRight  = UDim.new(0, 4)
DropPad.PaddingTop    = UDim.new(0, 4)
DropPad.PaddingBottom = UDim.new(0, 4)
DropPad.Parent = DropScroll

-- ── No-file label (hiện khi không có file) ─────────
local NoFileLbl = Instance.new("TextLabel")
NoFileLbl.Size = UDim2.new(1, 0, 0, 36)
NoFileLbl.BackgroundTransparency = 1
NoFileLbl.Text = "Không tìm thấy file .json trong workspace"
NoFileLbl.TextColor3 = C.DIM
NoFileLbl.TextSize = 11
NoFileLbl.Font = C.FONT_REG
NoFileLbl.TextXAlignment = Enum.TextXAlignment.Center
NoFileLbl.LayoutOrder = 1
NoFileLbl.Parent = DropScroll

local dropOpen = false
local selectedItem = nil   -- TextButton item đang được chọn
local allItems = {}        -- {btn, fname}

local function closeDropdown()
    dropOpen = false
    tw(DropListWrap, {Size = UDim2.new(1, 0, 0, 0)}, 0.2, Enum.EasingStyle.Quart)
    DropArrow.Text = "▼"
end

local function openDropdown()
    dropOpen = true
    local itemCount = #allItems
    local listH = itemCount > 0 and math.min(itemCount * 38 + 8, 160) or 44
    tw(DropListWrap, {Size = UDim2.new(1, 0, 0, listH)}, 0.2, Enum.EasingStyle.Quart)
    DropArrow.Text = "▲"
end

local function buildDropdownItems(files)
    -- Xoá item cũ
    for _, item in ipairs(allItems) do
        item.btn:Destroy()
    end
    allItems = {}
    selectedItem = nil

    NoFileLbl.Visible = #files == 0

    for i, f in ipairs(files) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 34)
        btn.BackgroundColor3 = C.BG_MID
        btn.BackgroundTransparency = 0.3
        btn.Text = ""
        btn.BorderSizePixel = 0
        btn.AutoButtonColor = false
        btn.LayoutOrder = i + 1
        btn.Parent = DropScroll
        mkCorner(btn, 7)

        local iconL = Instance.new("TextLabel")
        iconL.Size = UDim2.new(0, 26, 1, 0)
        iconL.Position = UDim2.new(0, 6, 0, 0)
        iconL.BackgroundTransparency = 1
        iconL.Text = "📄"
        iconL.TextSize = 13
        iconL.Font = C.FONT
        iconL.Parent = btn

        local nameL = Instance.new("TextLabel")
        nameL.Size = UDim2.new(1, -36, 1, 0)
        nameL.Position = UDim2.new(0, 32, 0, 0)
        nameL.BackgroundTransparency = 1
        nameL.Text = f.name
        nameL.TextColor3 = C.TEXT
        nameL.TextSize = 11
        nameL.Font = C.FONT_REG
        nameL.TextXAlignment = Enum.TextXAlignment.Left
        nameL.TextTruncate = Enum.TextTruncate.AtEnd
        nameL.Parent = btn

        local item = {btn = btn, fname = f.name, fpath = f.path, nameL = nameL, iconL = iconL}
        table.insert(allItems, item)

        btn.MouseEnter:Connect(function()
            if selectedItem ~= item then
                tw(btn, {BackgroundTransparency = 0.1}, 0.1)
            end
        end)
        btn.MouseLeave:Connect(function()
            if selectedItem ~= item then
                tw(btn, {BackgroundTransparency = 0.3}, 0.12)
            end
        end)

        btn.MouseButton1Click:Connect(function()
            -- Bỏ chọn item cũ
            if selectedItem and selectedItem ~= item then
                tw(selectedItem.btn, {BackgroundColor3 = C.BG_MID, BackgroundTransparency = 0.3}, 0.15)
                selectedItem.nameL.TextColor3 = C.TEXT
            end
            selectedItem = item
            tw(btn, {BackgroundColor3 = C.PRIMARY, BackgroundTransparency = 0.15}, 0.15)
            nameL.TextColor3 = Color3.new(1, 1, 1)

            -- Load data từ file
            local fileOk, fileData = pcall(function() return readfile(f.path) end)
            if not fileOk or not fileData then
                fileOk, fileData = pcall(function() return readfile(f.name) end)
            end

            if fileOk and fileData and fileData ~= "" then
                local parseOk, parsed = pcall(function()
                    return HttpService:JSONDecode(fileData)
                end)
                if parseOk and type(parsed) == "table" then
                    State.selectedFile = f.name
                    State.selectedData = parsed
                    DropSelectedLbl.Text = f.name
                    DropSelectedLbl.TextColor3 = C.TEXT

                    -- Kích hoạt nút Play
                    tw(PlayBtn, {BackgroundTransparency = 0.1, BackgroundColor3 = C.PRIMARY}, 0.2)
                    PlayBtn.TextColor3 = Color3.new(1, 1, 1)
                    PlayBtn.Active = true

                    setStatus("✓ Đã chọn: " .. f.name, C.GREEN)
                else
                    setStatus("⚠ File JSON không hợp lệ!", C.YELLOW)
                    State.selectedFile = nil
                    State.selectedData = nil
                end
            else
                setStatus("⚠ Không đọc được: " .. f.name, C.RED)
                State.selectedFile = nil
                State.selectedData = nil
            end

            closeDropdown()
        end)
    end
end

local function refreshFiles()
    local files = getJsonFiles()
    buildDropdownItems(files)
    if #files > 0 then
        setStatus(string.format("↺ Tìm thấy %d file JSON", #files), C.GREEN)
    else
        setStatus("↺ Không có file .json trong workspace", C.YELLOW)
    end
end

-- Bấm header → mở/đóng dropdown + làm mới danh sách
DropHeader.MouseButton1Click:Connect(function()
    if dropOpen then
        closeDropdown()
    else
        refreshFiles()
        openDropdown()
    end
end)

-- Nút refresh riêng
RefreshBtn.MouseButton1Click:Connect(function()
    refreshFiles()
    if not dropOpen then openDropdown() end
end)

-- ── Play Button ─────────────────────────────────────
local PlayBtn = mkBtn(Scroll, "▶  PHÁT MACRO", C.PRIMARY, 1, 0, 0, 44, 0, 0)
PlayBtn.LayoutOrder = 12
PlayBtn.BackgroundTransparency = 0.52
PlayBtn.TextColor3 = C.DIM
PlayBtn.Active = false
PlayBtn.TextSize = 15

-- ── Stop Play Button ────────────────────────────────
local StopPlayBtn = mkBtn(Scroll, "⏹  DỪNG PHÁT", C.RED, 1, 0, 0, 38, 0, 0)
StopPlayBtn.LayoutOrder = 13
StopPlayBtn.Visible = false

-- ── Progress bar khi play ───────────────────────────
local ProgWrap = Instance.new("Frame")
ProgWrap.Size = UDim2.new(1, 0, 0, 20)
ProgWrap.BackgroundTransparency = 1
ProgWrap.LayoutOrder = 14
ProgWrap.Visible = false
ProgWrap.Parent = Scroll

local ProgBg = Instance.new("Frame")
ProgBg.Size = UDim2.new(1, 0, 0, 6)
ProgBg.Position = UDim2.new(0, 0, 0, 0)
ProgBg.BackgroundColor3 = C.BG_MID
ProgBg.BorderSizePixel = 0
ProgBg.Parent = ProgWrap
mkCorner(ProgBg, 3)

local ProgFill = Instance.new("Frame")
ProgFill.Size = UDim2.new(0, 0, 1, 0)
ProgFill.BackgroundColor3 = C.PRIMARY_LIGHT
ProgFill.BorderSizePixel = 0
ProgFill.Parent = ProgBg
mkCorner(ProgFill, 3)
mkGrad(ProgFill, C.PRIMARY_LIGHT, C.PRIMARY, 0)

local ProgLbl = Instance.new("TextLabel")
ProgLbl.Size = UDim2.new(1, 0, 0, 13)
ProgLbl.Position = UDim2.new(0, 0, 0, 8)
ProgLbl.BackgroundTransparency = 1
ProgLbl.Text = "0 / 0 hành động"
ProgLbl.TextColor3 = C.DIM
ProgLbl.TextSize = 9
ProgLbl.Font = C.FONT_REG
ProgLbl.TextXAlignment = Enum.TextXAlignment.Right
ProgLbl.Parent = ProgWrap

-- ══════════════════════════════════════════════════
-- DRAG WINDOW
-- ══════════════════════════════════════════════════
local dragWin, dragStart, dragStartPos = false, nil, nil

TBar.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragWin = true; dragStart = i.Position; dragStartPos = MainFrame.Position
    end
end)
TBar.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then dragWin = false end
end)
UserInputService.InputChanged:Connect(function(i)
    if dragWin and i.UserInputType == Enum.UserInputType.MouseMovement then
        local d = i.Position - dragStart
        MainFrame.Position = UDim2.new(
            dragStartPos.X.Scale, dragStartPos.X.Offset + d.X,
            dragStartPos.Y.Scale, dragStartPos.Y.Offset + d.Y)
    end
end)

-- ══════════════════════════════════════════════════
-- TIMER
-- ══════════════════════════════════════════════════
local timerConn
local function startTimer()
    timerConn = RunService.Heartbeat:Connect(function()
        if State.isRecording then
            local e = tick() - State.recordStart
            TimerLbl.Text = string.format("%02d:%02d", math.floor(e/60), math.floor(e%60))
        end
    end)
end
local function stopTimer()
    if timerConn then timerConn:Disconnect(); timerConn = nil end
end

-- ══════════════════════════════════════════════════
-- SERIALIZE / BUILD JSON
-- ══════════════════════════════════════════════════
local mapId = "000000000000"

local function encodeEntry(e)
    if e.type == "PlaceTower" then
        return {
            e.time, "PlaceTower",
            { tostring(e.towerType), {["__t"]="Vector3", x=e.pos.X, y=e.pos.Y, z=e.pos.Z}, 0, e.mapId or mapId },
            e.num, false, {targetName = "Tower_"..e.num}
        }
    elseif e.type == "UpgradeRem" then
        return { e.time, "UpgradeRem", {}, e.num, false, {u = e.u} }
    end
end

local function buildJson()
    local out = {}
    for _, e in ipairs(State.recordedData) do
        local enc = encodeEntry(e)
        if enc then table.insert(out, enc) end
    end
    return HttpService:JSONEncode(out)
end

-- ══════════════════════════════════════════════════
-- HOOK REMOTES (Recorder với delay 0.1s)
-- ══════════════════════════════════════════════════
local originalNamecall = nil

local function hookRemotes()
    if not hookmetamethod then return end
    originalNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args   = {...}

        if State.isRecording and (method == "FireServer" or method == "InvokeServer") then
            local now = tick()
            -- ── Delay 0.1s: bỏ qua nếu quá gần lần ghi trước ──
            if (now - State.lastHookTime) >= 0.1 then
                local rName = (self.Name or ""):lower()

                if rName:find("placetower") or rName:find("place_tower") or rName == "place" then
                    local tType = args[1] and tostring(args[1]) or "1"
                    local pos   = args[2]
                    if typeof(pos) == "Vector3" then
                        State.lastHookTime = now
                        local t = now - State.recordStart
                        State.towerCount = State.towerCount + 1
                        table.insert(State.recordedData, {
                            time = t, type = "PlaceTower",
                            towerType = tType, pos = pos,
                            mapId = args[4] or mapId,
                            num = State.towerCount,
                        })
                        task.defer(function()
                            setStatus(string.format("⏺ Đang ghi... [PlaceTower ×%d]", State.towerCount), C.RED)
                        end)
                    end

                elseif rName:find("upgrade") or rName:find("rem") then
                    local tNum = tonumber(args[1]) or 0
                    local uLvl = tonumber(args[2]) or 1
                    State.lastHookTime = now
                    local t = now - State.recordStart
                    table.insert(State.recordedData, {
                        time = t, type = "UpgradeRem",
                        num = tNum, u = uLvl,
                    })
                    task.defer(function()
                        setStatus(string.format("⏺ Đang ghi... [Upgrade T%d → lv%d]", tNum, uLvl), C.RED)
                    end)
                end
            end
        end

        return originalNamecall(self, ...)
    end)
end

-- ══════════════════════════════════════════════════
-- RECORD
-- ══════════════════════════════════════════════════
RecordBtn.MouseButton1Click:Connect(function()
    if State.isRecording or State.isPlaying then return end

    State.isRecording  = true
    State.recordStart  = tick()
    State.recordedData = {}
    State.towerCount   = 0
    State.lastHookTime = 0
    TimerLbl.Text = "00:00"

    tw(RecordBtn, {BackgroundColor3 = C.RED, BackgroundTransparency = 0.0}, 0.15)
    RecordBtn.Text = "⏺  SEDANG MEREKAM"
    tw(StopBtn, {BackgroundTransparency = 0.15, BackgroundColor3 = C.PRIMARY}, 0.15)
    StopBtn.TextColor3 = Color3.new(1, 1, 1)

    setStatus("⏺ Bắt đầu ghi hành động...", C.RED)
    startTimer()
    pcall(hookRemotes)
end)

-- ══════════════════════════════════════════════════
-- STOP RECORD
-- ══════════════════════════════════════════════════
StopBtn.MouseButton1Click:Connect(function()
    if not State.isRecording then return end

    State.isRecording = false
    stopTimer()

    RecordBtn.Text = "⏺  RECORD"
    tw(RecordBtn, {BackgroundTransparency = 0.15}, 0.15)
    tw(StopBtn, {BackgroundTransparency = 0.55, BackgroundColor3 = C.PRIMARY}, 0.15)
    StopBtn.TextColor3 = C.DIM

    -- Unhook
    if originalNamecall then
        pcall(function()
            hookmetamethod(game, "__namecall", originalNamecall)
        end)
        originalNamecall = nil
    end

    local n = #State.recordedData
    setStatus(string.format("✓ Đã ghi %d hành động", n), C.GREEN)
end)

-- ══════════════════════════════════════════════════
-- SAVE FILE
-- ══════════════════════════════════════════════════
SaveBtn.MouseButton1Click:Connect(function()
    if #State.recordedData == 0 then
        setStatus("⚠ Chưa có dữ liệu để lưu!", C.YELLOW)
        return
    end

    local baseName = NameBox.Text ~= "" and NameBox.Text or "macro"
    -- Loại bỏ ký tự không hợp lệ
    baseName = baseName:gsub("[^%w_%-]", "")
    if baseName == "" then baseName = "macro" end

    local serial   = makeSerial()                          -- vd "729kIJ"
    local fileName = baseName .. serial .. ".json"         -- vd "MagicTTD729kIJ.json"
    local jsonData = buildJson()

    -- Cố ghi file
    local ok, err = pcall(function() writefile(fileName, jsonData) end)
    if ok then
        setStatus("✓ Đã lưu: " .. fileName, C.GREEN)
        -- Làm mới danh sách dropdown luôn
        task.delay(0.3, refreshFiles)
    else
        -- Fallback: copy clipboard
        pcall(function() setclipboard(jsonData) end)
        setStatus("📋 writefile thất bại → đã copy vào clipboard", C.ACCENT)
    end
end)

-- ══════════════════════════════════════════════════
-- PLAY MACRO
-- ══════════════════════════════════════════════════
local function findRemote(names)
    local rs = game:GetService("ReplicatedStorage")
    for _, desc in ipairs(rs:GetDescendants()) do
        if desc:IsA("RemoteEvent") or desc:IsA("RemoteFunction") then
            for _, n in ipairs(names) do
                if desc.Name:lower():find(n:lower()) then return desc end
            end
        end
    end
    return nil
end

local function decodeV3(t)
    if type(t) == "table" and t["__t"] == "Vector3" then
        return Vector3.new(t.x or 0, t.y or 0, t.z or 0)
    end
    return Vector3.new(0, 0, 0)
end

PlayBtn.MouseButton1Click:Connect(function()
    if not PlayBtn.Active or not State.selectedData then
        setStatus("⚠ Hãy chọn file macro trước!", C.YELLOW)
        return
    end
    if State.isRecording then
        setStatus("⚠ Đang ghi, không thể phát!", C.YELLOW)
        return
    end
    if State.isPlaying then return end

    State.isPlaying = true
    PlayBtn.Visible = false
    StopPlayBtn.Visible = true
    ProgWrap.Visible = true
    ProgFill.Size = UDim2.new(0, 0, 1, 0)

    local data = State.selectedData
    local total = #data
    setStatus(string.format("▶ Đang phát %d hành động...", total), C.PRIMARY_LIGHT)

    local placeRemote   = findRemote({"placetower", "place_tower", "towplace"})
    local upgradeRemote = findRemote({"upgraderem", "upgrade", "upgrem"})

    task.spawn(function()
        local playStart = tick()
        local stopped   = false
        local stopConn

        stopConn = StopPlayBtn.MouseButton1Click:Connect(function()
            stopped = true
        end)

        for i, entry in ipairs(data) do
            if stopped or not State.isPlaying then break end
            if type(entry) ~= "table" then continue end

            local entryTime = tonumber(entry[1]) or 0
            local aType     = entry[2]
            local args      = entry[3]
            local tNum      = entry[4]

            -- Đợi đến đúng thời điểm (real-time giống file gốc)
            local elapsed = tick() - playStart
            if entryTime > elapsed then
                task.wait(entryTime - elapsed)
            end

            if stopped or not State.isPlaying then break end

            -- Fire action
            if aType == "PlaceTower" and type(args) == "table" then
                local tType   = args[1]
                local pos     = decodeV3(args[2])
                local mId     = args[4] or mapId

                if placeRemote then
                    if placeRemote:IsA("RemoteEvent") then
                        placeRemote:FireServer(tType, pos, 0, mId)
                    else
                        placeRemote:InvokeServer(tType, pos, 0, mId)
                    end
                end
                setStatus(string.format("▶ PlaceTower [%d/%d]", i, total), C.PRIMARY_LIGHT)

            elseif aType == "UpgradeRem" then
                local meta   = entry[6]
                local uLevel = (type(meta) == "table" and meta.u) or 1

                if upgradeRemote then
                    if upgradeRemote:IsA("RemoteEvent") then
                        upgradeRemote:FireServer(tNum, uLevel)
                    else
                        upgradeRemote:InvokeServer(tNum, uLevel)
                    end
                end
                setStatus(string.format("▶ Upgrade T%d→lv%d [%d/%d]", tNum, uLevel, i, total), C.PRIMARY_LIGHT)
            end

            -- Cập nhật progress bar
            local pct = i / total
            tw(ProgFill, {Size = UDim2.new(pct, 0, 1, 0)}, 0.15)
            ProgLbl.Text = string.format("%d / %d hành động", i, total)

            -- Cập nhật timer hiển thị
            local e = tick() - playStart
            TimerLbl.Text = string.format("%02d:%02d", math.floor(e/60), math.floor(e%60))
        end

        stopConn:Disconnect()
        State.isPlaying = false
        PlayBtn.Visible = true
        StopPlayBtn.Visible = false

        local didFinish = not stopped
        ProgWrap.Visible = false

        if didFinish then
            setStatus(string.format("✓ Phát xong %d hành động!", total), C.GREEN)
            tw(ProgFill, {Size = UDim2.new(1, 0, 1, 0)}, 0.2)
        else
            setStatus("⏹ Đã dừng phát macro", C.YELLOW)
        end
    end)
end)

StopPlayBtn.MouseButton1Click:Connect(function()
    State.isPlaying = false
end)

-- ══════════════════════════════════════════════════
-- MINIMIZE / CLOSE
-- ══════════════════════════════════════════════════
local minimized = false
local FULL_H, MINI_H = 530, 50

MinBtn.MouseButton1Click:Connect(function()
    if minimized then
        tw(MainFrame, {Size = UDim2.new(0, 370, 0, FULL_H)}, 0.25, Enum.EasingStyle.Back)
        minimized = false
    else
        tw(MainFrame, {Size = UDim2.new(0, 370, 0, MINI_H)}, 0.2, Enum.EasingStyle.Quart)
        minimized = true
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    tw(MainFrame, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 25)
    }, 0.22, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    task.delay(0.3, function() ScreenGui:Destroy() end)
end)

-- ══════════════════════════════════════════════════
-- OPEN ANIMATION
-- ══════════════════════════════════════════════════
MainFrame.Size = UDim2.new(0, 370, 0, 0)
MainFrame.Position = UDim2.new(0.5, -185, 0.5, 25)

tw(MainFrame, {
    Size = UDim2.new(0, 370, 0, FULL_H),
    Position = UDim2.new(0.5, -185, 0.5, -265)
}, 0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

-- Load file list on open
task.delay(0.5, refreshFiles)

print("[TD Macro v2] Loaded!")
print("  Serial format: TênFile + 3 số + 3 chữ (vd MagicTTD729kIJ.json)")
print("  Recorder delay: 0.1s chống trùng lặp")
print("  Dropdown tự đọc workspace .json files")
