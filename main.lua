local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local playerGui = LocalPlayer:WaitForChild("PlayerGui")

local function pickGuiParent()
    local test = Instance.new("ScreenGui")
    local ok = pcall(function() test.Parent = CoreGui end)
    test:Destroy()
    return ok and CoreGui or playerGui
end

local guiParent = pickGuiParent()

local function newCorner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = radius or UDim.new(0, 12)
    c.Parent = parent
    return c
end

local MENU_BG = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350368096_263.e5e41f.jpg"
local BALL_BG = "https://raw.githubusercontent.com/yuh5710t/picx-images-hosting/main/Image_1793350408301_602.5fac5d.jpg"

local announceGui = Instance.new("ScreenGui")
announceGui.Name = "ShadowMoonAnnouncement"
announceGui.DisplayOrder = 2147483601
announceGui.IgnoreGuiInset = true
announceGui.ResetOnSpawn = false
announceGui.Parent = guiParent

local overlay = Instance.new("Frame")
overlay.Size = UDim2.fromScale(1, 1)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 0.35
overlay.BorderSizePixel = 0
overlay.Parent = announceGui

local card = Instance.new("Frame")
card.AnchorPoint = Vector2.new(0.5, 0.5)
card.Position = UDim2.fromScale(0.5, 0.5)
card.Size = UDim2.fromOffset(300, 200)
card.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
card.BorderSizePixel = 0
card.Parent = announceGui
newCorner(card, UDim.new(0, 16))

local cardStroke = Instance.new("UIStroke")
cardStroke.Color = Color3.fromRGB(215, 40, 40)
cardStroke.Thickness = 2
cardStroke.Parent = card

local messageLabel = Instance.new("TextLabel")
messageLabel.AnchorPoint = Vector2.new(0.5, 0)
messageLabel.Position = UDim2.new(0.5, 0, 0, 30)
messageLabel.Size = UDim2.new(1, -40, 0, 80)
messageLabel.BackgroundTransparency = 1
messageLabel.Text = "本脚本由影月制作，永久免费，严禁倒卖圈钱！"
messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
messageLabel.Font = Enum.Font.GothamBold
messageLabel.TextSize = 18
messageLabel.TextWrapped = true
messageLabel.TextXAlignment = Enum.TextXAlignment.Center
messageLabel.Parent = card

local confirmButton = Instance.new("TextButton")
confirmButton.AnchorPoint = Vector2.new(0.5, 1)
confirmButton.Position = UDim2.new(0.5, 0, 1, -20)
confirmButton.Size = UDim2.new(1, -48, 0, 45)
confirmButton.BackgroundColor3 = Color3.fromRGB(205, 35, 35)
confirmButton.Text = "确定进入"
confirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmButton.Font = Enum.Font.GothamBold
confirmButton.TextSize = 18
confirmButton.BorderSizePixel = 0
confirmButton.Parent = card
newCorner(confirmButton, UDim.new(0, 10))

local mainGui = Instance.new("ScreenGui")
mainGui.Name = "ShadowMoonLoaderUI"
mainGui.ResetOnSpawn = false
mainGui.IgnoreGuiInset = true
mainGui.DisplayOrder = 999999
mainGui.Enabled = false
mainGui.Parent = guiParent

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.fromScale(0.5, 0.5)
mainFrame.Size = UDim2.fromOffset(320, 380)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = mainGui
newCorner(mainFrame, UDim.new(0, 16))

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(215, 40, 40)
mainStroke.Thickness = 1.5
mainStroke.Transparency = 0.3
mainStroke.Parent = mainFrame

local menuBg = Instance.new("ImageLabel")
menuBg.Size = UDim2.fromScale(1, 1)
menuBg.BackgroundTransparency = 1
menuBg.Image = MENU_BG
menuBg.ImageTransparency = 0.2
menuBg.ScaleType = Enum.ScaleType.Crop
menuBg.BorderSizePixel = 0
menuBg.ZIndex = 1
menuBg.Parent = mainFrame
newCorner(menuBg, UDim.new(0, 16))

local menuOverlay = Instance.new("Frame")
menuOverlay.Size = UDim2.fromScale(1, 1)
menuOverlay.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
menuOverlay.BackgroundTransparency = 0.4
menuOverlay.BorderSizePixel = 0
menuOverlay.ZIndex = 2
menuOverlay.Parent = mainFrame
newCorner(menuOverlay, UDim.new(0, 16))

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
titleBar.BackgroundTransparency = 0.2
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 3
titleBar.Parent = mainFrame
newCorner(titleBar, UDim.new(0, 16))

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -70, 1, 0)
titleLabel.Position = UDim2.fromOffset(14, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "影月加载器"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 15
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.ZIndex = 4
titleLabel.Parent = titleBar

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.fromOffset(28, 28)
minimizeBtn.AnchorPoint = Vector2.new(1, 0.5)
minimizeBtn.Position = UDim2.new(1, -8, 0.5, 0)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(205, 35, 35)
minimizeBtn.Text = "—"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 15
minimizeBtn.BorderSizePixel = 0
minimizeBtn.ZIndex = 4
minimizeBtn.Parent = titleBar
newCorner(minimizeBtn, UDim.new(0, 8))

local content = Instance.new("Frame")
content.Name = "Content"
content.Position = UDim2.fromOffset(10, 48)
content.Size = UDim2.new(1, -20, 1, -58)
content.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
content.BackgroundTransparency = 0.15
content.BorderSizePixel = 0
content.ZIndex = 3
content.Parent = mainFrame
newCorner(content, UDim.new(0, 12))

local contentStroke = Instance.new("UIStroke")
contentStroke.Color = Color3.fromRGB(215, 40, 40)
contentStroke.Thickness = 1
contentStroke.Transparency = 0.6
contentStroke.Parent = content

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, 0, 0, 34)
scroll.Position = UDim2.fromOffset(5, 5)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollingDirection = Enum.ScrollingDirection.X
scroll.Parent = content

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 6)
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Parent = scroll

local pageScroll = Instance.new("ScrollingFrame")
pageScroll.Size = UDim2.new(1, -10, 1, -45)
pageScroll.Position = UDim2.fromOffset(5, 42)
pageScroll.BackgroundTransparency = 1
pageScroll.ScrollBarThickness = 2
pageScroll.ScrollBarImageColor3 = Color3.fromRGB(215, 40, 40)
pageScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
pageScroll.Parent = content

local pageLayout = Instance.new("UIListLayout")
pageLayout.Padding = UDim.new(0, 6)
pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
pageLayout.Parent = pageScroll

local ballGui = Instance.new("ScreenGui")
ballGui.Name = "ShadowMoonBall"
ballGui.ResetOnSpawn = false
ballGui.IgnoreGuiInset = true
ballGui.DisplayOrder = 1000000
ballGui.Enabled = false
ballGui.Parent = guiParent

local ball = Instance.new("ImageButton")
ball.Name = "Ball"
ball.Size = UDim2.fromOffset(56, 56)
ball.Position = UDim2.new(0, 24, 0.5, -28)
ball.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
ball.Image = BALL_BG
ball.ScaleType = Enum.ScaleType.Crop
ball.BorderSizePixel = 0
ball.AutoButtonColor = false
ball.Parent = ballGui
newCorner(ball, UDim.new(0, 12))

local ballStroke = Instance.new("UIStroke")
ballStroke.Color = Color3.fromRGB(215, 40, 40)
ballStroke.Thickness = 2
ballStroke.Parent = ball

minimizeBtn.MouseButton1Click:Connect(function()
    mainGui.Enabled = false
    ballGui.Enabled = true
end)

ball.MouseButton1Click:Connect(function()
    ballGui.Enabled = false
    mainGui.Enabled = true
end)local toastGui = Instance.new("ScreenGui")
toastGui.Name = "ShadowMoonToast"
toastGui.ResetOnSpawn = false
toastGui.IgnoreGuiInset = true
toastGui.DisplayOrder = 1000001
toastGui.Parent = guiParent

local toastFrame = Instance.new("Frame")
toastFrame.AnchorPoint = Vector2.new(1, 0)
toastFrame.Position = UDim2.new(1, 20, 0, 120)
toastFrame.Size = UDim2.fromOffset(140, 36)
toastFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
toastFrame.BackgroundTransparency = 0.1
toastFrame.BorderSizePixel = 0
toastFrame.Visible = false
toastFrame.Parent = toastGui
newCorner(toastFrame, UDim.new(0, 10))

local toastStroke = Instance.new("UIStroke")
toastStroke.Color = Color3.fromRGB(215, 40, 40)
toastStroke.Thickness = 1.5
toastStroke.Parent = toastFrame

local toastLabel = Instance.new("TextLabel")
toastLabel.Size = UDim2.new(1, -16, 1, 0)
toastLabel.Position = UDim2.fromOffset(8, 0)
toastLabel.BackgroundTransparency = 1
toastLabel.Text = ""
toastLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
toastLabel.Font = Enum.Font.GothamMedium
toastLabel.TextSize = 13
toastLabel.TextXAlignment = Enum.TextXAlignment.Center
toastLabel.TextTruncate = Enum.TextTruncate.AtEnd
toastLabel.Parent = toastFrame

local toastToken = 0
local function showToast(text)
    toastToken = toastToken + 1
    local myToken = toastToken
    toastLabel.Text = tostring(text)
    toastFrame.Visible = true
    toastFrame.Position = UDim2.new(1, 20, 0, 120)
    TweenService:Create(toastFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -156, 0, 120),
    }):Play()
    task.delay(2, function()
        if myToken ~= toastToken then return end
        TweenService:Create(toastFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 20, 0, 120),
        }):Play()
        task.delay(0.3, function()
            if myToken == toastToken then
                toastFrame.Visible = false
            end
        end)
    end)
end

local currentTabBtn = nil
local function switchTab(btn)
    if currentTabBtn then
        currentTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        currentTabBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
    end
    currentTabBtn = btn
    btn.BackgroundColor3 = Color3.fromRGB(205, 35, 35)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
end

local function createTab(name, order)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.fromOffset(80, 30)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 200, 210)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 13
    btn.BorderSizePixel = 0
    btn.LayoutOrder = order
    btn.Parent = scroll
    newCorner(btn, UDim.new(0, 8))

    local page = Instance.new("Frame")
    page.Size = UDim2.new(1, -10, 0, 0)
    page.BackgroundTransparency = 1
    page.LayoutOrder = order
    page.Visible = false
    page.Parent = pageScroll

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 6)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = page

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.Size = UDim2.new(1, -10, 0, layout.AbsoluteContentSize.Y)
    end)

    btn.MouseButton1Click:Connect(function()
        switchTab(btn)
        for _, p in ipairs(pageScroll:GetChildren()) do
            if p:IsA("Frame") then p.Visible = false end
        end
        page.Visible = true
    end)

    if order == 1 then
        switchTab(btn)
        page.Visible = true
    end

    local tabMethods = {}

    function tabMethods:Button(title, callback)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1, 0, 0, 38)
        b.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        b.Text = title
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.Font = Enum.Font.GothamBold
        b.TextSize = 13
        b.BorderSizePixel = 0
        b.Parent = page
        newCorner(b, UDim.new(0, 8))

        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(215, 40, 40)
        stroke.Thickness = 1
        stroke.Transparency = 0.6
        stroke.Parent = b

        b.MouseButton1Click:Connect(function()
            showToast("点击: " .. title)
            if callback then pcall(callback) end
        end)
        return b
    end

    function tabMethods:Toggle(title, default, callback)
        local state = default or false
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1, 0, 0, 38)
        b.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        b.Text = "  " .. title
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.TextXAlignment = Enum.TextXAlignment.Left
        b.Font = Enum.Font.GothamMedium
        b.TextSize = 13
        b.BorderSizePixel = 0
        b.Parent = page
        newCorner(b, UDim.new(0, 8))

        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(215, 40, 40)
        stroke.Thickness = 1
        stroke.Transparency = 0.6
        stroke.Parent = b

        local ind = Instance.new("Frame")
        ind.Size = UDim2.fromOffset(36, 18)
        ind.AnchorPoint = Vector2.new(1, 0.5)
        ind.Position = UDim2.new(1, -8, 0.5, 0)
        ind.BackgroundColor3 = state and Color3.fromRGB(205, 35, 35) or Color3.fromRGB(60, 60, 70)
        ind.BorderSizePixel = 0
        ind.Parent = b
        newCorner(ind, UDim.new(1, 0))

        local dot = Instance.new("Frame")
        dot.Size = UDim2.fromOffset(14, 14)
        dot.AnchorPoint = Vector2.new(0, 0.5)
        dot.Position = state and UDim2.new(1, -16, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
        dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        dot.BorderSizePixel = 0
        dot.Parent = ind
        newCorner(dot, UDim.new(1, 0))

        b.MouseButton1Click:Connect(function()
            state = not state
            ind.BackgroundColor3 = state and Color3.fromRGB(205, 35, 35) or Color3.fromRGB(60, 60, 70)
            TweenService:Create(dot, TweenInfo.new(0.15), {
                Position = state and UDim2.new(1, -16, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)
            }):Play()
            showToast((state and "开启: " or "关闭: ") .. title)
            if callback then pcall(callback, state) end
        end)
        return b
    end

    function tabMethods:Label(text)
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(1, 0, 0, 28)
        l.BackgroundTransparency = 1
        l.Text = "  " .. text
        l.TextColor3 = Color3.fromRGB(200, 200, 210)
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.Font = Enum.Font.Gotham
        l.TextSize = 13
        l.Parent = page
        return l
    end

    return tabMethods
endconfirmButton.MouseButton1Click:Connect(function()
    announceGui:Destroy()
    mainGui.Enabled = true
end)

local TabBasic = createTab("基础设置", 1)
TabBasic:Label("用户名: " .. LocalPlayer.Name)
TabBasic:Label("显示名: " .. LocalPlayer.DisplayName)
TabBasic:Label("执行器: " .. (identifyexecutor and identifyexecutor() or "未知"))
TabBasic:Label("时间: " .. os.date("%Y-%m-%d %H:%M:%S"))
TabBasic:Label("账号年龄: " .. LocalPlayer.AccountAge .. " 天")
TabBasic:Label("作者: 影月")
TabBasic:Button("最小化到悬浮球", function()
    mainGui.Enabled = false
    ballGui.Enabled = true
end)

local TabGeneral = createTab("通用", 2)
local ESPEnabled = false
local ESPTable = {}

local function getPlayerColor(player)
    if player.TeamColor then return player.TeamColor.Color end
    return Color3.fromRGB(255, 255, 255)
end

local function updateESP(player)
    if player == LocalPlayer then return end
    local character = player.Character
    if not character then return end

    if not ESPTable[player] then
        local highlight = Instance.new("Highlight")
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.FillTransparency = 0.5
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.FillColor = getPlayerColor(player)
        highlight.Enabled = ESPEnabled
        highlight.Adornee = character
        highlight.Parent = character

        local billboard = Instance.new("BillboardGui")
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(0, 800, 0, 50)
        billboard.ExtentsOffset = Vector3.new(0, 1, 0)
        billboard.Parent = character

        local label = Instance.new("TextLabel")
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(1, 0, 1, 0)
        label.Font = Enum.Font.SciFi
        label.TextSize = 11
        label.TextColor3 = getPlayerColor(player)
        label.Text = player.DisplayName
        label.Visible = ESPEnabled
        label.Parent = billboard

        ESPTable[player] = { hl = highlight, bb = billboard }
    else
        local data = ESPTable[player]
        if data.hl and data.hl.Parent then
            data.hl.FillColor = getPlayerColor(player)
            data.hl.Enabled = ESPEnabled
        end
        if data.bb and data.bb.Parent then
            local label = data.bb:FindFirstChildOfClass("TextLabel")
            if label then
                label.Text = player.DisplayName
                label.TextColor3 = getPlayerColor(player)
                label.Visible = ESPEnabled
            end
        end
    end
end

task.spawn(function()
    while task.wait(0.5) do
        if ESPEnabled then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then updateESP(player) end
            end
        end
    end
end)

TabGeneral:Toggle("ESP 高亮", false, function(state)
    ESPEnabled = state
    if not state then
        for player, data in pairs(ESPTable) do
            pcall(function()
                if data.hl then data.hl:Destroy() end
                if data.bb then data.bb:Destroy() end
            end)
            ESPTable[player] = nil
        end
    end
end)

local TabFun = createTab("娱乐", 3)
TabFun:Button("免费通行证（原版）", function()
    for _, v in pairs(game:GetDescendants()) do
        if v.ClassName == "RemoteEvent" then
            if v.Parent.Name == "WeaponsRemotes" or v.Parent.Name == "VipRemotes" or v.Parent.Name == "Remotes" then
                v:FireServer()
            end
        end
    end
end)

local TabLift = createTab("举重模拟器", 4)
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function fireLift(...)
    local remote = ReplicatedStorage:FindFirstChild("RemoteEvent")
    if remote and remote:IsA("RemoteEvent") then remote:FireServer(...) end
end

TabLift:Toggle("自动锻炼", false, function(state)
    if state then
        task.spawn(function()
            while state do
                fireLift({ "GainMuscle" })
                task.wait(0.1)
            end
        end)
    end
end)

TabLift:Toggle("自动出售", false, function(state)
    if state then
        task.spawn(function()
            while state do
                fireLift({ "SellMuscle" })
                task.wait(0.1)
            end
        end)
    end
end)

TabLift:Toggle("打开商店", false, function(state)
    pcall(function()
        local frame = LocalPlayer.PlayerGui.Main_Gui.UpgradeMenu_Frame
        if frame then frame.Visible = state end
    end)
end)

local function parseCurrency(text)
    if not text or text == "" then return nil end
    local numberStr = text:match("^(.-)[KkMmBbTt]?$")
    local suffix = text:match("[KkMmBbTt]$")
    local number = tonumber(numberStr)
    if not number then return nil end
    if suffix then
        local multipliers = { K = 1e3, k = 1e3, M = 1e6, m = 1e6, B = 1e9, b = 1e9, T = 1e12, t = 1e12 }
        number = number * (multipliers[suffix] or 1)
    end
    return number
end

local function makeAutoBuy(pageName, itemType, maxTry)
    return function(state)
        if state then
            task.spawn(function()
                while state do
                    pcall(function()
                        local page = LocalPlayer.PlayerGui.Main_Gui.UpgradeInfo_Frame.PageList[pageName]
                        if not page then return end
                        for _, v in pairs(page:GetChildren()) do
                            if v:IsA("ImageButton") and v:FindFirstChild("LockImage") and not v.LockImage.Visible
                                and v:FindFirstChild("tlPrice") and v.tlPrice.Text ~= "Owned" and v.tlPrice.Text ~= "Equipped"
                                and v.tlPrice.Text ~= "" and v.tlPrice.Text ~= " " and not string.find(v.tlPrice.Text, "R") then
                                local price = parseCurrency(v.tlPrice.Text)
                                local cashText = LocalPlayer.PlayerGui.Main_Gui.DataMenu_Frame.Cash.Status.Text
                                local cash = parseCurrency(cashText)
                                if price and cash and price <= cash then
                                    for try = 1, maxTry do
                                        if v.tlPrice.Text == "Equipped" or v.tlPrice.Text == "Owned" then break end
                                        fireLift({ "BuyItem", itemType, v.Name, try })
                                        task.wait(0.05)
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(0.5)
                end
            end)
        end
    end
end

TabLift:Toggle("自动购买举重物品", false, makeAutoBuy("Page01", "Income_Item", 142))
TabLift:Toggle("自动购买背包容量", false, makeAutoBuy("Page02", "Bag_Item", 78))
TabLift:Toggle("自动购买重生", false, makeAutoBuy("Page03", "Rebirth_Item", 80))
