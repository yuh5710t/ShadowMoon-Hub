end

confirmButton.MouseButton1Click:Connect(function()
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
