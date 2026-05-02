-- MagicHub | Garden Tower Defense (Clean)
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer
local PG = LP.PlayerGui

local env = getgenv()
env.MainCfg = env.MainCfg or {AutoSkip=false,Speed2x=false,Speed3x=false,PlayAgain=false,AutoDiff=false,AutoMap=false,Diff="dif_impossible",Map="map_farm"}
env.BanCfg = env.BanCfg or {Offset=1.5,ReturnAfter=100,AutoReturn=false,AntiAFK=false,AFKLoaded=false,Matches=0}
env.FarmCfg = env.FarmCfg or {GY1=false,GY2=false,Dojo=false,Win1=false,Win2=false,Running=false}
env.PerfCfg = env.PerfCfg or {Render=false,BlackMagicScriptHub=false,BlackGui=nil}
env.GfxCfg = env.GfxCfg or {Enabled=false,Orig=nil}
env.WHCfg = env.WHCfg or {URL="",Enabled=false,Games=0}
env.MT = env.MT or {}
env.AT = env.AT or {}
env.EggRunning = env.EggRunning or false

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title="Magic Hub",
    Icon="crown",
    Author="by Magic_Master",
    Folder="MagicScript",
    Size=UDim2.fromOffset(580,460),
    MinSize=Vector2.new(560,350),
    MaxSize=Vector2.new(850,560),
    Transparent=true,
    Theme="Dark",
    Resizable=true,
    SideBarWidth=200,
    BackgroundImageTransparency=0.5,
    HideSearchBar=true,
    User={Enabled=true,Anonymous=true},
})
Window:SetToggleKey(Enum.KeyCode.LeftShift)
Window:Tag({ Title = "V 1", Color = Color3.fromHex("#8013E8"), Radius = 10 })

local TMain = Window:Tab({Title="Main",Icon="plus"})
local TFarm = Window:Tab({Title="AutoFarm",Icon="book-text"})
local TSumm = Window:Tab({Title="Summon",Icon="sprout"})
local TMisc = Window:Tab({Title="Misc",Icon="wrench"})
local TBan  = Window:Tab({Title="AntiBan",Icon="shield-cog-corner"})
local TWH   = Window:Tab({Title="Webhook",Icon="bell"})
local TSet  = Window:Tab({Title="Settings",Icon="settings"})

-- helpers
local function getState()
    local ok,r = pcall(function()
        local rs = ReplicatedStorage:FindFirstChild("RemoteFunctions")
        if not rs then return "unknown" end
        return rs:FindFirstChild("LobbySetMap_8") and "lobby" or "in_map"
    end)
    return ok and r or "unknown"
end

local function getSeeds()
    local ok,v = pcall(function()
        local g = PG:FindFirstChild("GameGui")
        if not g then return "N/A" end
        local d = g:FindFirstChild("SeedsDisplay",true)
        if d then local l = d:FindFirstChildWhichIsA("TextLabel") if l then return l.Text end end
        return "N/A"
    end)
    return ok and v or "N/A"
end

local function getRunTime()
    local ok,v = pcall(function()
        local g = PG:FindFirstChild("GameGui") or PG:FindFirstChild("GameGuiNoInset")
        if not g then return "N/A" end
        for _,l in pairs(g:GetDescendants()) do
            if l:IsA("TextLabel") then
                local t = l.Text:match("(%d+:%d+)")
                if t then return t end
            end
        end
        return "N/A"
    end)
    return ok and v or "N/A"
end

local function sendWH(isTest)
    local cfg = env.WHCfg
    if cfg.URL == "" then return end
    local ok,e = pcall(function()
        if not isTest then cfg.Games = cfg.Games + 1 end
        local payload = HttpService:JSONEncode({embeds={{
            color=isTest and 3066993 or 15158332,
            description=string.format("**Garden Tower Defense**\n\n**User:** ||%s||\n\n**Matches:** %d\n**Seeds:** %s\n**Time:** %s",LP.Name,cfg.Games,getSeeds(),getRunTime()),
            footer={text="MagicHub | "..os.date("%Y-%m-%d %H:%M:%S")}
        }}})
        request({Url=cfg.URL,Method="POST",Headers={["Content-Type"]="application/json"},Body=payload})
    end)
    if not ok then warn("[WH] "..tostring(e)) end
end

task.spawn(function()
    while true do
        task.wait(0.5)
        if env.WHCfg.URL ~= "" then
            pcall(function()
                local g = PG:FindFirstChild("GameGuiNoInset")
                if not g then return end
                local ge = g.Screen.Middle:FindFirstChild("GameEnd")
                if ge and ge.Visible and not env.WHCfg._flag then
                    env.WHCfg._flag = true
                    task.wait(1.5)
                    sendWH(false)
                    task.wait(2)
                    env.WHCfg._flag = false
                elseif not (ge and ge.Visible) then
                    env.WHCfg._flag = false
                end
            end)
        end
    end
end)

local function blackOn()
    if env.PerfCfg.BlackGui then return end
    pcall(function()
        local sg = Instance.new("ScreenGui")
        sg.Name="BlackScreenGui" sg.IgnoreGuiInset=true sg.DisplayOrder=999 sg.ResetOnSpawn=false
        local f = Instance.new("Frame",sg)
        f.Size=UDim2.new(1,0,1,0) f.BackgroundColor3=Color3.new(0,0,0) f.BackgroundTransparency=0 f.BorderSizePixel=0 f.ZIndex=999
        sg.Parent=PG env.PerfCfg.BlackGui=sg
    end)
end

local function blackOff()
    if env.PerfCfg.BlackGui then pcall(function() env.PerfCfg.BlackGui:Destroy() end) env.PerfCfg.BlackGui=nil end
end

local function gfxOn()
    local t = workspace:FindFirstChildOfClass("Terrain")
    env.GfxCfg.Orig = {
        Bright=Lighting.Brightness,GS=Lighting.GlobalShadows,Tech=Lighting.Technology,
        WR=t and t.WaterReflectance or 1,WT=t and t.WaterTransparency or 0.3,
        WS=t and t.WaterWaveSize or 0.15,WV=t and t.WaterWaveSpeed or 10,
        FX={},QL=settings().Rendering.QualityLevel
    }
    for _,c in pairs(Lighting:GetChildren()) do
        if c:IsA("BloomEffect") or c:IsA("BlurEffect") or c:IsA("ColorCorrectionEffect") or c:IsA("SunRaysEffect") or c:IsA("DepthOfFieldEffect") or c:IsA("Atmosphere") then
            table.insert(env.GfxCfg.Orig.FX,c) c.Enabled=false
        end
    end
    Lighting.Brightness=0 Lighting.GlobalShadows=false Lighting.Technology=Enum.Technology.Compatibility
    if t then t.WaterReflectance=0 t.WaterTransparency=1 t.WaterWaveSize=0 t.WaterWaveSpeed=0 end
    settings().Rendering.QualityLevel=Enum.QualityLevel.Level01
end

local function gfxOff()
    local o = env.GfxCfg.Orig if not o then return end
    local t = workspace:FindFirstChildOfClass("Terrain")
    Lighting.Brightness=o.Bright Lighting.GlobalShadows=o.GS Lighting.Technology=o.Tech
    if t then t.WaterReflectance=o.WR t.WaterTransparency=o.WT t.WaterWaveSize=o.WS t.WaterWaveSpeed=o.WV end
    settings().Rendering.QualityLevel=o.QL
    for _,fx in pairs(o.FX) do if fx and fx.Parent then fx.Enabled=true end end
end

local function rf() return ReplicatedStorage:WaitForChild("RemoteFunctions") end

local function enterMap(mapId,label,tries)
    tries = tries or 10
    for i=1,tries do
        local s = getState()
        if s=="in_map" then return true end
        if s=="lobby" then
            local char=LP.Character
            if char then local h=char:FindFirstChild("HumanoidRootPart") if h then h.CFrame=CFrame.new(118.89,78,779.65) task.wait(1) end end
            pcall(function() rf():FindFirstChild("LobbySetMaxPlayers_8"):InvokeServer(1) end)
            task.wait(0.3)
            pcall(function() rf():FindFirstChild("LobbySetMap_8"):InvokeServer(mapId) end)
            task.wait(7)
            if getState()=="in_map" then return true end
            if i<tries then pcall(function() rf():FindFirstChild("LobbyLeave"):InvokeServer() end) task.wait(5) end
        else task.wait(3) end
    end
    return false
end

local function setDiff(d) pcall(function() rf():FindFirstChild("LobbySetDifficulty_8"):InvokeServer(d) end) end

-- ==================== MAIN TAB ====================
task.spawn(function()
    wait(0.1)
    TMain:Section({Title="General"})

    local t=TMain:Toggle({Flag="AutoSkip",Title="Auto Skip",Desc="Skip waves automatically.",Default=false,Callback=function(s)
        env.MainCfg.AutoSkip=s
        if s then task.spawn(function() while env.MainCfg.AutoSkip do pcall(function()
            local g=PG:FindFirstChild("GameGuiNoInset") if not g then return end
            local b=g.Screen.Top.WaveControls:FindFirstChild("AutoSkip")
            if b and b.ImageColor3.R>0.8 then local c=getconnections(b.MouseButton1Click) if c and c[1] then c[1]:Fire() end end
        end) task.wait(0.5) end end) end
    end})
    env.MT.AutoSkip=t TMain:Space()

    t=TMain:Toggle({Flag="Speed2x",Title="Auto Speed 2x",Default=false,Callback=function(s)
        env.MainCfg.Speed2x=s if s then env.MainCfg.Speed3x=false end
        if s then task.spawn(function() while env.MainCfg.Speed2x do pcall(function()
            local g=PG:FindFirstChild("GameGuiNoInset") if not g then return end
            local tk=g.Screen.Top.WaveControls:FindFirstChild("TickSpeed")
            if tk and tk.ImageColor3.R<0.5 then local c=getconnections(tk.MouseButton1Click) if c and c[1] then c[1]:Fire() end end
        end) task.wait(1) end end) end
    end})
    env.MT.Speed2x=t TMain:Space()

    t=TMain:Toggle({Flag="Speed3x",Title="Auto Speed 3x",Default=false,Callback=function(s)
        env.MainCfg.Speed3x=s if s then env.MainCfg.Speed2x=false end
        if s then task.spawn(function() while env.MainCfg.Speed3x do pcall(function()
            local g=PG:FindFirstChild("GameGuiNoInset") if not g then return end
            local tk=g.Screen.Top.WaveControls:FindFirstChild("TickSpeed")
            if tk then local c=getconnections(tk.MouseButton1Click) if c and c[1] then c[1]:Fire() c[1]:Fire() end end
        end) task.wait(1) end end) end
    end})
    env.MT.Speed3x=t TMain:Space()

    t=TMain:Toggle({Flag="PlayAgain",Title="Auto Play Again",Default=false,Callback=function(s)
        env.MainCfg.PlayAgain=s
        if s then task.spawn(function() while env.MainCfg.PlayAgain do pcall(function()
            local g=PG:FindFirstChild("GameGuiNoInset") if not g then return end
            local ge=g.Screen.Middle:FindFirstChild("GameEnd")
            if ge and ge.Visible then local b=ge:FindFirstChild("PlayAgain",true) if b then local c=getconnections(b.MouseButton1Click) if c and c[1] then c[1]:Fire() end end end
        end) task.wait(1) end end) end
    end})
    env.MT.PlayAgain=t TMain:Space()

    t=TMain:Toggle({Flag="AutoDiff",Title="Auto Difficulty",Default=false,Callback=function(s)
        env.MainCfg.AutoDiff=s
        if s then task.spawn(function() while env.MainCfg.AutoDiff do
            if getState()=="lobby" then setDiff(env.MainCfg.Diff) end task.wait(3)
        end end) end
    end})
    env.MT.AutoDiff=t TMain:Space()

    TMain:Dropdown({Flag="Diff",Title="Difficulty",Values={"Easy","Normal","Hard","Insane","Impossible"},Default="Impossible",Callback=function(v)
        local m={Easy="dif_easy",Normal="dif_normal",Hard="dif_hard",Insane="dif_insane",Impossible="dif_impossible"}
        env.MainCfg.Diff=m[v] or "dif_impossible"
    end})
    TMain:Space()

    t=TMain:Toggle({Flag="AutoMap",Title="Auto Join Map",Default=false,Callback=function(s)
        env.MainCfg.AutoMap=s
        if s then task.spawn(function() while env.MainCfg.AutoMap do
            if getState()=="lobby" then enterMap(env.MainCfg.Map,"Map",1) end task.wait(5)
        end end) end
    end})
    env.MT.AutoMap=t TMain:Space()

    TMain:Dropdown({Flag="Map",Title="Map",Values={"Garden","Jungle","Island","Toxic","Back Garden","Dojo","Graveyard","Christmas","Space"},Default="Garden",Callback=function(v)
        local m={Garden="map_farm",Jungle="map_jungle",Island="map_island",Toxic="map_toxic",["Back Garden"]="map_back_garden",Dojo="map_dojo",Graveyard="map_graveyard",Christmas="map_christmas",Space="map_space"}
        env.MainCfg.Map=m[v] or "map_farm"
    end})
    TMain:Space()

    TMain:Section({Title="Performance"})

    t=TMain:Toggle({Flag="PerfMode",Title="Performance Mode",Desc="Stops 3D rendering.",Default=false,Callback=function(s)
        env.PerfCfg.Render=s pcall(function() RunService:Set3dRenderingEnabled(not s) end)
        Window:Notify({Title=s and "Perf Mode ON" or "Perf Mode OFF",Content=s and "3D rendering stopped." or "3D rendering restored.",Duration=2})
    end})
    env.PerfToggle=t TMain:Space()

    t=TMain:Toggle({Flag="BlackScreen",Title="Black Screen",Default=false,Callback=function(s)
        env.PerfCfg.Black=s if s then blackOn() else blackOff() end
        Window:Notify({Title=s and "Black Screen ON" or "Black Screen OFF",Content="",Duration=2})
    end})
    env.BlackToggle=t TMain:Space()

    t=TMain:Toggle({Flag="LowGfx",Title="Low Graphics",Default=false,Callback=function(s)
        env.GfxCfg.Enabled=s if s then gfxOn() else gfxOff() end
        Window:Notify({Title=s and "Low Gfx ON" or "Low Gfx OFF",Content="",Duration=2})
    end})
    env.GfxToggle=t
end)

-- ==================== AUTO FARM TAB ====================
task.spawn(function()
    wait(0.2)
    TFarm:Section({Title="Auto Farm"})
    TFarm:Space()

    local function startFarm(mapId,label)
        if not env.MainCfg.AutoSkip and env.MT.AutoSkip then env.MT.AutoSkip:Set(true) end
        if not env.MainCfg.PlayAgain and env.MT.PlayAgain then env.MT.PlayAgain:Set(true) end
        env.MainCfg.Diff="dif_impossible"
        if not env.MainCfg.AutoDiff and env.MT.AutoDiff then env.MT.AutoDiff:Set(true) end
        task.wait(1) setDiff("dif_impossible") task.wait(1)
        if not env.BanCfg.AFKLoaded then
            task.spawn(function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))() end) env.BanCfg.AFKLoaded=true end)
        end
        task.spawn(function()
            local ok=enterMap(mapId,label,10)
            if ok then Window:Notify({Title="Setup Complete",Content="Entered "..label.."!",Duration=3})
            else Window:Notify({Title="Setup Failed",Content="Could not enter "..label..". Try manually.",Duration=5}) end
        end)
    end

    local function makeFarmToggle(flag,label,mapId,key)
        TFarm:Toggle({Flag=flag,Title=label,Default=false,Callback=function(s)
            if s then
                env.FarmCfg[key]=true startFarm(mapId,label)
            else
                env.FarmCfg[key]=false env.FarmCfg.Running=false
                Window:Notify({Title=label.." Stopped",Content="Auto farm disabled",Duration=2})
            end
        end})
        TFarm:Space()
    end

    makeFarmToggle("GY1","Graveyard V1","map_graveyard","GY1")
    makeFarmToggle("GY2","Graveyard V2","map_graveyard","GY2")
    makeFarmToggle("Dojo","Dojo","map_dojo","Dojo")
    makeFarmToggle("Win1","Auto Win V1","map_farm","Win1")
    makeFarmToggle("Win2","Auto Win V2","map_farm","Win2")
end)

-- ==================== SUMMON TAB ====================
task.spawn(function()
    wait(0.3)
    TSumm:Section({Title="Auto Summon"}) TSumm:Space()
    local SS={Crate="Basic Crate",BuyType="Single",Amount=10,Running=false}
    local sToggle

    TSumm:Dropdown({Flag="SCrate",Title="Select Crate",Values={"Basic Crate","Jungle Crate","Premium Crate","Special Crate"},Default="Basic Crate",Callback=function(v) SS.Crate=v end})
    TSumm:Space()
    TSumm:Dropdown({Flag="SType",Title="Buy Type",Values={"Single","Multi"},Default="Single",Callback=function(v) SS.BuyType=v end})
    TSumm:Space()
    TSumm:Input({Flag="SAmount",Title="Amount",Type="Input",Value="10",Placeholder="10",Callback=function(v) SS.Amount=tonumber(v) or 10 end})
    TSumm:Space()

    sToggle=TSumm:Toggle({Flag="AutoSummon",Title="Start Auto Summon",Default=false,Callback=function(s)
        if s then
            SS.Running=true
            Window:Notify({Title="Auto Summon",Content="Opening "..SS.Amount.."x "..SS.Crate,Duration=3})
            task.spawn(function()
                local n=0
                while SS.Running and n<SS.Amount do
                    local ok,e=pcall(function()
                        local f=rf():FindFirstChild("OpenCrate_8") or rf():FindFirstChild("BuyCrate_8")
                        if f then f:InvokeServer(SS.Crate,SS.BuyType) n=n+1 end
                    end)
                    if not ok then SS.Running=false sToggle:Set(false)
                        Window:Notify({Title="Summon Stopped",Content=tostring(e),Duration=4}) return
                    end
                    task.wait(0.5)
                end
                SS.Running=false sToggle:Set(false)
                Window:Notify({Title="Summon Done",Content="Bought "..n.."x "..SS.Crate,Duration=3})
            end)
        else SS.Running=false Window:Notify({Title="Summon Stopped",Content="",Duration=2}) end
    end})
end)

-- ==================== MISC TAB ====================
task.spawn(function()
    wait(0.4)
    TMisc:Section({Title="Misc"}) TMisc:Space()
    local uid=tostring(LP.UserId)

    local eggT=TMisc:Toggle({Flag="EggCollect",Title="Easter Eggs Auto Collector",Default=false,Callback=function(s)
        env.EggRunning=s
        if s then
            Window:Notify({Title="Egg Collector",Content="Collecting eggs...",Duration=3})
            task.spawn(function()
                local function collect(o)
                    if o.Name~="Collectable" then return end
                    local id=o:GetAttribute("ID") if not id then return end
                    local ap=o:GetAttribute("AcceptedPlayers")
                    if ap and ap:find(uid) then
                        pcall(function()
                            local re=workspace:WaitForChild("RemoteEvents",5)
                            if re then local f=re:FindFirstChild("CollectItem_8") or re:FindFirstChild("CollectEgg_8") if f then f:FireServer(id) end end
                        end)
                    end
                end
                for _,o in pairs(workspace:GetChildren()) do if env.EggRunning then collect(o) end end
                local conn conn=workspace.ChildAdded:Connect(function(o)
                    if not env.EggRunning then conn:Disconnect() return end collect(o)
                end)
                while env.EggRunning do task.wait(0.5) end
                if conn then conn:Disconnect() end
            end)
        else Window:Notify({Title="Egg Collector Off",Content="",Duration=2}) end
    end})
    env.EggToggle=eggT TMisc:Space()

    TMisc:Button({Title="Auto Obby",Desc="Activate ARG Obby portal.",Callback=function()
        pcall(function()
            for _,o in pairs(workspace.Map.ARGObby:GetDescendants()) do
                if o.Name=="FireInteractionEvent" and o:IsA("RemoteEvent") then
                    o:FireServer()
                    Window:Notify({Title="Auto Obby",Content="Activated!",Duration=2}) return
                end
            end
        end)
        Window:Notify({Title="Auto Obby",Content="Remote not found!",Duration=2})
    end})
    TMisc:Space()

    local ralphOn=false
    TMisc:Toggle({Flag="Ralph",Title="Auto Donate Ralph",Desc="Donate 50 seeds to Ralph.",Default=false,Callback=function(s)
        ralphOn=s
        if s then task.spawn(function() while ralphOn do
            pcall(function()
                local map=workspace:FindFirstChild("Map") if not map then return end
                local b=map:FindFirstChild("BeggarItems") and map.BeggarItems:FindFirstChild("Beggar") if not b then return end
                local h=b:FindFirstChild("HumanoidRootPart") if not h then return end
                local i=h:FindFirstChild("Interact") if not i then return end
                local p=i:FindFirstChildOfClass("ProximityPrompt") if p then fireproximityprompt(p) end
            end)
            task.wait(0.1)
        end end) end
    end})
    TMisc:Space()

    TMisc:Section({Title="Server Tools"}) TMisc:Space()
    local hopMin=1 local hopMax=5
    TMisc:Input({Flag="HopMin",Title="Min Players",Type="Input",Value="1",Placeholder="1",Callback=function(v) hopMin=tonumber(v) or 1 end})
    TMisc:Space()
    TMisc:Input({Flag="HopMax",Title="Max Players",Type="Input",Value="5",Placeholder="5",Callback=function(v) hopMax=tonumber(v) or 5 end})
    TMisc:Space()
    TMisc:Button({Title="Server Hop",Desc="Jump to server with desired player count.",Callback=function()
        local ok,e=pcall(function()
            local data=HttpService:JSONDecode(game:HttpGet(string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100",game.PlaceId)))
            local valid={} for _,sv in pairs(data.data) do if sv.playing>=hopMin and sv.playing<=hopMax then table.insert(valid,sv) end end
            assert(#valid>0,"No servers with "..hopMin.."-"..hopMax.." players")
            table.sort(valid,function(a,b) return a.playing<b.playing end)
            local c=valid[math.random(1,math.min(10,#valid))]
            Window:Notify({Title="Server Hop",Content="Teleporting ("..c.playing.." players)...",Duration=2})
            TeleportService:TeleportToPlaceInstance(game.PlaceId,c.id,LP)
        end)
        if not ok then Window:Notify({Title="Hop Failed",Content=tostring(e),Duration=5}) end
    end})
end)

-- ==================== ANTI BAN TAB ====================
task.spawn(function()
    wait(0.4)
    TBan:Section({Title="Anti Ban"}) TBan:Space()

    TBan:Input({Flag="Offset",Title="Placement Offset",Type="Input",Value=tostring(env.BanCfg.Offset),Placeholder="1.5",Callback=function(v) local n=tonumber(v) if n then env.BanCfg.Offset=n end end})
    TBan:Space()
    TBan:Input({Flag="ReturnAfter",Title="Matches Before Return",Type="Input",Value=tostring(env.BanCfg.ReturnAfter),Placeholder="100",Callback=function(v) local n=tonumber(v) if n then env.BanCfg.ReturnAfter=n end end})
    TBan:Space()

    local arT=TBan:Toggle({Flag="AutoReturn",Title="Enable Auto Return",Default=env.BanCfg.AutoReturn,Callback=function(s)
        env.BanCfg.AutoReturn=s
        Window:Notify({Title=s and "Auto Return ON" or "Auto Return OFF",Content=s and "Returns after "..env.BanCfg.ReturnAfter.." matches" or "Farm runs forever",Duration=3})
    end})
    env.AT.AutoReturn=arT TBan:Space()

    local afkT=TBan:Toggle({Flag="AntiAFK",Title="Enable Anti-AFK",Default=false,Callback=function(s)
        env.BanCfg.AntiAFK=s
        if s and not env.BanCfg.AFKLoaded then
            task.spawn(function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))() end) env.BanCfg.AFKLoaded=true end)
        end
        Window:Notify({Title=s and "Anti-AFK ON" or "Anti-AFK OFF",Content="",Duration=2})
    end})
    env.AT.AntiAFK=afkT

    task.spawn(function()
        while true do task.wait(2)
            if env.BanCfg.AutoReturn and getState()=="lobby" then
                env.BanCfg.AutoReturn=false
                if env.AT.AutoReturn then env.AT.AutoReturn:Set(false) end
            end
        end
    end)
end)

-- ==================== WEBHOOK TAB ====================
task.spawn(function()
    wait(0.5)
    TWH:Section({Title="Webhook Settings"}) TWH:Space()
    TWH:Input({Flag="WHURL",Title="Discord Webhook URL",Type="Input",Value=env.WHCfg.URL,Placeholder="https://discord.com/api/webhooks/...",Callback=function(v)
        env.WHCfg.URL=v
        Window:Notify({Title=v~="" and "Webhook Saved" or "Webhook Removed",Content="",Duration=2})
    end})
    TWH:Space()
    TWH:Button({Title="Test Webhook",Desc="Send a test message.",Callback=function()
        if env.WHCfg.URL=="" then Window:Notify({Title="No URL",Content="Enter a webhook URL first!",Duration=3}) return end
        sendWH(true) Window:Notify({Title="Test Sent",Content="Check Discord!",Duration=3})
    end})
end)

-- ==================== SETTINGS TAB ====================
task.spawn(function()
    wait(0.6)
    TSet:Section({Title="Config System"}) TSet:Space()

    local function ensureFolders()
        if not isfolder("MagicHub") then makefolder("MagicHub") end
        if not isfolder("MagicScripts/Configs") then makefolder("MagicScripts/Configs") end
    end

    local function getCfgData()
        local e=env return {
            AutoSkip=e.MainCfg.AutoSkip,Speed2x=e.MainCfg.Speed2x,Speed3x=e.MainCfg.Speed3x,
            PlayAgain=e.MainCfg.PlayAgain,AutoDiff=e.MainCfg.AutoDiff,AutoMap=e.MainCfg.AutoMap,
            Diff=e.MainCfg.Diff,Map=e.MainCfg.Map,
            GY1=e.FarmCfg.GY1,GY2=e.FarmCfg.GY2,Dojo=e.FarmCfg.Dojo,Win1=e.FarmCfg.Win1,Win2=e.FarmCfg.Win2,
            Offset=e.BanCfg.Offset,ReturnAfter=e.BanCfg.ReturnAfter,AutoReturn=e.BanCfg.AutoReturn,AntiAFK=e.BanCfg.AntiAFK,
            Render=e.PerfCfg.Render,Black=e.PerfCfg.Black,LowGfx=e.GfxCfg.Enabled,
            WHURL=e.WHCfg.URL,WHEnabled=e.WHCfg.Enabled,Egg=e.EggRunning
        }
    end

    local function applyData(d)
        local e=env
        e.MainCfg.AutoSkip=d.AutoSkip or false e.MainCfg.Speed2x=d.Speed2x or false
        e.MainCfg.Speed3x=d.Speed3x or false e.MainCfg.PlayAgain=d.PlayAgain or false
        e.MainCfg.AutoDiff=d.AutoDiff or false e.MainCfg.AutoMap=d.AutoMap or false
        if d.Diff then e.MainCfg.Diff=d.Diff end if d.Map then e.MainCfg.Map=d.Map end
        e.FarmCfg.GY1=d.GY1 or false e.FarmCfg.GY2=d.GY2 or false
        e.FarmCfg.Dojo=d.Dojo or false e.FarmCfg.Win1=d.Win1 or false e.FarmCfg.Win2=d.Win2 or false
        e.BanCfg.Offset=d.Offset or 1.5 e.BanCfg.ReturnAfter=d.ReturnAfter or 100
        e.BanCfg.AutoReturn=d.AutoReturn or false e.BanCfg.AntiAFK=d.AntiAFK or false
        e.PerfCfg.Render=d.Render or false e.PerfCfg.Black=d.Black or false
        e.GfxCfg.Enabled=d.LowGfx or false
        e.WHCfg.URL=d.WHURL or "" e.WHCfg.Enabled=d.WHEnabled or false e.EggRunning=d.Egg or false
        local mt=e.MT local at=e.AT
        if mt.AutoSkip then mt.AutoSkip:Set(e.MainCfg.AutoSkip) end
        if mt.Speed2x then mt.Speed2x:Set(e.MainCfg.Speed2x) end
        if mt.Speed3x then mt.Speed3x:Set(e.MainCfg.Speed3x) end
        if mt.PlayAgain then mt.PlayAgain:Set(e.MainCfg.PlayAgain) end
        if mt.AutoDiff then mt.AutoDiff:Set(e.MainCfg.AutoDiff) end
        if mt.AutoMap then mt.AutoMap:Set(e.MainCfg.AutoMap) end
        if at.AntiAFK then at.AntiAFK:Set(e.BanCfg.AntiAFK) end
        if e.PerfToggle then e.PerfToggle:Set(e.PerfCfg.Render) end
        if e.BlackToggle then e.BlackToggle:Set(e.PerfCfg.Black) end
        if e.GfxToggle then e.GfxToggle:Set(e.GfxCfg.Enabled) end
        if e.EggToggle then e.EggToggle:Set(e.EggRunning) end
    end

    local function getList()
        if not isfolder("MagicScripts/Configs") then return {} end
        local ok,files=pcall(function() return listfiles("MagicScripts/Configs") end)
        if not (ok and files) then return {} end
        local list={} for _,p in pairs(files) do local n=p:match("([^/\\]+)%.json$") if n then table.insert(list,n) end end
        return list
    end

    local nameIn,selDD,alBtn

    nameIn=TSet:Input({Flag="CfgName",Title="Config Name",Type="Input",Value="",Placeholder="my_config",Callback=function() end})
    TSet:Space()

    local lst=getList()
    selDD=TSet:Dropdown({Flag="CfgSel",Title="Select Config",Values=lst,Default=lst[1],Callback=function() end})
    TSet:Space()

    local function refreshDD() local l=getList() if selDD then pcall(function() selDD:SetValues(l) end) end end

    TSet:Button({Title="Create Config",Desc="Save current settings.",Callback=function()
        local n=nameIn and nameIn.Value or ""
        if not n or n=="" then Window:Notify({Title="Error",Content="Enter a config name!",Duration=3}) return end
        local ok=pcall(function()
            ensureFolders()
            writefile("MagicScripts/Configs/"..n..".json",HttpService:JSONEncode(getCfgData()))
        end)
        if ok then refreshDD() Window:Notify({Title="Saved",Content="'"..n.."' created!",Duration=3})
        else Window:Notify({Title="Error",Content="Save failed!",Duration=3}) end
    end})
    TSet:Space()

    TSet:Button({Title="Load Config",Desc="Apply selected config.",Callback=function()
        local s=selDD and selDD.Value if not s or type(s)~="string" then return end
        local p="MagicScripts/Configs/"..s..".json"
        if not isfile(p) then Window:Notify({Title="Error",Content="File not found!",Duration=3}) return end
        local ok,data=pcall(function() return HttpService:JSONDecode(readfile(p)) end)
        if ok and data then applyData(data) Window:Notify({Title="Loaded",Content="'"..s.."' applied!",Duration=3})
        else Window:Notify({Title="Error",Content="Failed to load!",Duration=3}) end
    end})
    TSet:Space()

    TSet:Button({Title="Overwrite Config",Desc="Overwrite selected with current.",Callback=function()
        local s=selDD and selDD.Value if not s or type(s)~="string" then return end
        local ok=pcall(function() ensureFolders() writefile("MagicScripts/Configs/"..s..".json",HttpService:JSONEncode(getCfgData())) end)
        if ok then Window:Notify({Title="Overwritten",Content="'"..s.."' updated!",Duration=3})
        else Window:Notify({Title="Error",Content="Failed!",Duration=3}) end
    end})
    TSet:Space()

    TSet:Button({Title="Delete Config",Desc="Delete selected config.",Callback=function()
        local s=selDD and selDD.Value if not s or type(s)~="string" then return end
        local p="MagicScript/Configs/"..s..".json"
        if not isfile(p) then Window:Notify({Title="Error",Content="Not found!",Duration=3}) return end
        pcall(function() delfile(p) end) task.wait(0.1) refreshDD()
        Window:Notify({Title="Deleted",Content="'"..s.."' removed!",Duration=3})
    end})
    TSet:Space()

    TSet:Button({Title="Refresh List",Callback=function() refreshDD() end})
    TSet:Space()

    local curAL=isfile("MagicScript/AutoLoad.txt") and readfile("MagicScript/AutoLoad.txt") or nil
    alBtn=TSet:Button({Title="Set as Autoload",Desc=curAL and ("Current: '"..curAL.."'") or "Load on startup",Callback=function()
        local s=selDD and selDD.Value if not s or type(s)~="string" then return end
        local ok=pcall(function() ensureFolders() writefile("MagicScript/AutoLoad.txt",s) end)
        if ok then if alBtn then alBtn:SetDesc("Current: '"..s.."'") end Window:Notify({Title="Autoload Set",Content="'"..s.."' loads on startup",Duration=3}) end
    end})
    TSet:Space()

    TSet:Button({Title="Remove Autoload",Callback=function()
        if not isfile("MagicScript/AutoLoad.txt") then return end
        pcall(function() delfile("MagicScript/AutoLoad.txt") end)
        if alBtn then alBtn:SetDesc("Load on startup") end
        Window:Notify({Title="Autoload Removed",Content="",Duration=2})
    end})
end)

-- auto-load on startup
task.spawn(function()
    task.wait(2)
    if not isfile("MagicScript/AutoLoad.txt") then return end
    local ok,n=pcall(function() return readfile("MagicScript/AutoLoad.txt") end)
    if not (ok and n) then return end
    local p="MagicScripts/Configs/"..n..".json"
    if not isfile(p) then return end
    local ok2,data=pcall(function() return HttpService:JSONDecode(readfile(p)) end)
    if not (ok2 and data) then return end
    task.wait(1)
    local function applyData(d)
        local e=env
        e.MainCfg.AutoSkip=d.AutoSkip or false e.MainCfg.Speed2x=d.Speed2x or false
        e.MainCfg.Speed3x=d.Speed3x or false e.MainCfg.PlayAgain=d.PlayAgain or false
        e.MainCfg.AutoDiff=d.AutoDiff or false e.MainCfg.AutoMap=d.AutoMap or false
        if d.Diff then e.MainCfg.Diff=d.Diff end if d.Map then e.MainCfg.Map=d.Map end
        e.BanCfg.Offset=d.Offset or 1.5 e.BanCfg.ReturnAfter=d.ReturnAfter or 100
        e.BanCfg.AutoReturn=d.AutoReturn or false e.BanCfg.AntiAFK=d.AntiAFK or false
        e.PerfCfg.Render=d.Render or false e.PerfCfg.Black=d.Black or false
        e.GfxCfg.Enabled=d.LowGfx or false
        e.WHCfg.URL=d.WHURL or "" e.WHCfg.Enabled=d.WHEnabled or false e.EggRunning=d.Egg or false
        local mt=e.MT local at=e.AT
        if mt.AutoSkip then mt.AutoSkip:Set(e.MainCfg.AutoSkip) end
        if mt.Speed2x then mt.Speed2x:Set(e.MainCfg.Speed2x) end
        if mt.Speed3x then mt.Speed3x:Set(e.MainCfg.Speed3x) end
        if mt.PlayAgain then mt.PlayAgain:Set(e.MainCfg.PlayAgain) end
        if mt.AutoDiff then mt.AutoDiff:Set(e.MainCfg.AutoDiff) end
        if mt.AutoMap then mt.AutoMap:Set(e.MainCfg.AutoMap) end
        if at.AntiAFK then at.AntiAFK:Set(e.BanCfg.AntiAFK) end
        if e.PerfToggle then e.PerfToggle:Set(e.PerfCfg.Render) end
        if e.BlackToggle then e.BlackToggle:Set(e.PerfCfg.Black) end
        if e.GfxToggle then e.GfxToggle:Set(e.GfxCfg.Enabled) end
        if e.EggToggle then e.EggToggle:Set(e.EggRunning) end
    end
    applyData(data)
    Window:Notify({Title="Config Loaded",Content="Auto-loaded: "..n,Duration=3})
end)
