
--[[
    AUTO HUB
    Blox Fruits UI
    Blue Black Neon Edition
    Mobile Friendly
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AutoHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 340, 0, 420)
Main.Position = UDim2.new(0.5, -170, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(5, 10, 22)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(0, 130, 255)
Stroke.Thickness = 2
Stroke.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(10, 25, 50)
Title.Text = "AUTO HUB"
Title.TextColor3 = Color3.fromRGB(40, 160, 255)
Title.TextSize = 25
Title.Font = Enum.Font.GothamBold
Title.Parent = Main

local Scroll = Instance.new("ScrollingFrame")
Scroll.Position = UDim2.new(0, 10, 0, 60)
Scroll.Size = UDim2.new(1, -20, 1, -70)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 4
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 7)
Layout.Parent = Scroll

Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Scroll.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 10)
end)

local categories = {
    ["LEVELING"] = {
        "Auto Level",
        "Auto Quest",
        "Auto Mastery"
    },
    ["BOSS HUNTER"] = {
        "Auto Elite Hunter",
        "Auto Rip Indra",
        "Auto Dough King",
        "Auto Cake Prince",
        "Auto Darkbeard"
    },
    ["SWORD COLLECTION"] = {
        "Get Yama",
        "Get Tushita",
        "Cursed Dual Katana",
        "True Triple Katana",
        "Legendary Sword"
    },
    ["RAID & RACE"] = {
        "Auto Raid",
        "Race V2",
        "Race V3",
        "Race V4"
    },
    ["EXPLORATION"] = {
        "Find Mirage",
        "Teleport to Fruit"
    },
    ["INVENTORY"] = {
        "Store Fruit",
        "Get God Chalice",
        "Get Fist of Darkness"
    }
}

local function createLabel(text)
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 0, 30)
    Label.BackgroundTransparency = 1
    Label.Text = "◆ " .. text
    Label.TextColor3 = Color3.fromRGB(50, 160, 255)
    Label.TextSize = 15
    Label.Font = Enum.Font.GothamBold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Scroll
end

local function createButton(name)
    local enabled = false

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 38)
    Button.BackgroundColor3 = Color3.fromRGB(15, 35, 65)
    Button.TextColor3 = Color3.fromRGB(220, 235, 255)
    Button.TextSize = 13
    Button.Font = Enum.Font.GothamMedium
    Button.Text = name .. " : OFF"
    Button.Parent = Scroll

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 7)
    Corner.Parent = Button

    Button.MouseButton1Click:Connect(function()
        enabled = not enabled

        Button.Text = name .. (enabled and " : ON" or " : OFF")
        Button.BackgroundColor3 = enabled
            and Color3.fromRGB(0, 100, 190)
            or Color3.fromRGB(15, 35, 65)
    end)
end

for category, features in pairs(categories) do
    createLabel(category)

    for _, feature in ipairs(features) do
        createButton(feature)
    end
end

print("AUTO HUB loaded successfully!")
