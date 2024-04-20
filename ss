local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- check if the ScreenGui already exists, if it does, destroy it and remove BillboardGuis
if playerGui:FindFirstChild("TWRV") then
    playerGui:FindFirstChild("TWRV"):Destroy()

    for _, player in ipairs(game.Players:GetPlayers()) do
        local billboardGui = player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("PlayerBillboardGui")
        if billboardGui then
            billboardGui:Destroy()
        end
    end
end

-- create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TWRV"
screenGui.Parent = playerGui
screenGui.DisplayOrder = 1

-- create Frame
local holder = Instance.new("Frame")
holder.Name = "Holder"
holder.Parent = screenGui
holder.Size = UDim2.new(0, 300, 0, 200) -- increased size to accommodate the new TextLabel
holder.Position = UDim2.new(0.5, -150, 0.5, -100) -- position of the frame at the center of the screen
holder.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- dark grey background
holder.BackgroundTransparency = 0.5 -- semi-transparent
holder.BorderSizePixel = 0 -- remove border
holder.ClipsDescendants = true -- clip content to the frame
holder.AnchorPoint = Vector2.new(0.5, 0.5) -- set anchor point to center
holder.Position = UDim2.new(0.5, 0, 0.5, 0) -- reposition after setting anchor point
holder.ZIndex = 2 -- set ZIndex to ensure it's above other GUI elements

-- Create rounded corners for the frame
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = holder

-- create TextLabel
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Text = "TWRV"
titleLabel.TextScaled = true
titleLabel.Parent = holder
titleLabel.Size = UDim2.new(1, 0, 0.15, 0) -- fills 15% of the frame
titleLabel.BackgroundColor3 = Color3.fromRGB(220, 20, 60) -- red background
titleLabel.TextColor3 = Color3.new(1, 1, 1) -- white text
titleLabel.BackgroundTransparency = 0.5 -- semi-transparent
titleLabel.BorderSizePixel = 0 -- remove border
titleLabel.Font = Enum.Font.GothamSemibold -- set font
titleLabel.TextSize = 36 -- set text size

-- create TextLabel for additional message
local infoLabel = Instance.new("TextLabel")
infoLabel.Name = "InfoLabel"
infoLabel.Text = "IF YOU CLOSE THIS TAB, YOU NEED TO REJOIN FOR ESP TO WORK AGAIN."
infoLabel.TextScaled = true
infoLabel.Parent = holder
infoLabel.Size = UDim2.new(1, 0, 0.15, 0) -- fills 15% of the frame
infoLabel.Position = UDim2.new(0, 0, 0.15, 0) -- position below the titleLabel
infoLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- dark grey background
infoLabel.TextColor3 = Color3.new(1, 1, 1) -- white text
infoLabel.BackgroundTransparency = 0.5 -- semi-transparent
infoLabel.BorderSizePixel = 0 -- remove border
infoLabel.Font = Enum.Font.Gotham -- set font
infoLabel.TextSize = 18 -- set text size

-- create TextButton for closing the GUI
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Text = "X"
closeButton.Parent = holder
closeButton.Size = UDim2.new(0, 20, 0, 20) -- size of the button
closeButton.Position = UDim2.new(1, -25, 0, 5) -- position at the top-right corner with a small offset
closeButton.BackgroundColor3 = Color3.fromRGB(220, 20, 60) -- red background for the close button
closeButton.TextColor3 = Color3.new(1, 1, 1) -- white text color
closeButton.BackgroundTransparency = 0.5 -- semi-transparent
closeButton.TextScaled = true -- enable text scaling for the button
closeButton.BorderSizePixel = 0 -- remove border
closeButton.Font = Enum.Font.Gotham -- set font
closeButton.TextSize = 18 -- set text size

-- Create rounded corners for the close button
local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 10)
closeButtonCorner.Parent = closeButton

-- create TextLabel for Status
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Text = ""
statusLabel.Parent = holder
statusLabel.Size = UDim2.new(1, 0, 0.15, 0) -- fills 15% of the frame
statusLabel.Position = UDim2.new(0, 0, 0.7, 0) -- aligns the text label to the bottom of the frame
statusLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- dark grey background
statusLabel.TextColor3 = Color3.new(1, 1, 1) -- white text
statusLabel.BackgroundTransparency = 0.5 -- semi-transparent
statusLabel.BorderSizePixel = 0 -- remove border
statusLabel.Font = Enum.Font.GothamSemibold -- set font
statusLabel.TextSize = 24 -- set text size

-- create TextButton for Status
local statusButton = Instance.new("TextButton")
statusButton.Name = "StatusButton"
statusButton.Text = "Off"
statusButton.Parent = holder
statusButton.Size = UDim2.new(0.8, 0, 0.15, 0) -- fills 15% of the frame
statusButton.Position = UDim2.new(0.1, 0, 0.85, 0) -- aligns the button to the bottom of the frame
statusButton.BackgroundColor3 = Color3.fromRGB(220, 20, 60) -- red background for the button
statusButton.TextColor3 = Color3.new(1, 1, 1) -- white text color
statusButton.BackgroundTransparency = 0.5 -- semi-transparent
statusButton.TextScaled = true -- enable text scaling for the button
statusButton.BorderSizePixel = 0 -- remove border
statusButton.Font = Enum.Font.GothamSemibold -- set font
statusButton.TextSize = 24 -- set text size

-- Create rounded corners for the status button
local statusButtonCorner = Instance.new("UICorner")
statusButtonCorner.CornerRadius = UDim.new(0, 10)
statusButtonCorner.Parent = statusButton

-- Function to create BillboardGui for a player with name and distance
local function createBillboardGuiForPlayer(player, distance)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "PlayerBillboardGui"
    billboardGui.Adornee = player.Character.Head
    billboardGui.Size = UDim2.new(0, 100, 0, 50) -- fixed size for the BillboardGui
    billboardGui.StudsOffset = Vector3.new(0, 2, 0) -- adjust the vertical offset as needed
    billboardGui.AlwaysOnTop = true
    billboardGui.LightInfluence = 1
    billboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    billboardGui.Parent = player.Character.Head

    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "PlayerNameLabel"
    textLabel.Text = player.Name .. "\nDistance: " .. math.floor(distance)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1 -- transparent background
    textLabel.TextColor3 = Color3.new(1, 1, 1) -- white text for the player's name
    textLabel.TextScaled = true
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0) -- black text stroke
    textLabel.TextStrokeTransparency = 0 -- fully opaque text stroke (visible through walls)
    textLabel.Visible = statusButton.Text == "On" -- Hide the text if StatusButton is "Off"
    textLabel.Parent = billboardGui
end

-- Function to update player ESP distance
local function updatePlayerESP()
    local localCharacter = game.Players.LocalPlayer.Character
    if not localCharacter then
        return
    end

    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local distance = (localCharacter.Head.Position - player.Character.Head.Position).Magnitude
            local billboardGui = player.Character.Head:FindFirstChild("PlayerBillboardGui")
            if billboardGui then
                billboardGui.PlayerNameLabel.Text = player.Name .. "\nDistance: " .. math.floor(distance)
                billboardGui.PlayerNameLabel.TextColor3 = Color3.new(1, 1, 1) -- Set the text color to white
                billboardGui.PlayerNameLabel.Visible = statusButton.Text == "On" -- Update visibility based on StatusButton
            else
                createBillboardGuiForPlayer(player, distance)
            end
        end
    end
end

-- Call updatePlayerESP() initially and then schedule it to be called every 0.01 seconds
updatePlayerESP()
game:GetService("RunService").Heartbeat:Connect(function()
    updatePlayerESP()
end)

-- Function to handle the close button click event
local function onCloseButtonClicked()
    playerGui.TWRV:Destroy() -- Destroy the entire GUI when the close button is clicked
end

closeButton.MouseButton1Click:Connect(onCloseButtonClicked)

-- Now, you can add functionality to the button, for example:
local function onButtonClicked()
    if statusButton.Text == "Off" then
        statusButton.Text = "On"
        -- Add code to enable the player ESP here
    else
        statusButton.Text = "Off"
        -- Add code to disable the player ESP here
        
        -- Remove BillboardGui for each player's head when disabling the ESP
        for _, player in ipairs(game.Players:GetPlayers()) do
            local billboardGui = player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("PlayerBillboardGui")
            if billboardGui then
                billboardGui:Destroy()
            end
        end
    end
    -- Update the visibility of BillboardGui elements after clicking the button
    for _, player in ipairs(game.Players:GetPlayers()) do
        local billboardGui = player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("PlayerBillboardGui")
        if billboardGui then
            billboardGui.PlayerNameLabel.Visible = statusButton.Text == "On"
        end
    end
end

statusButton.MouseButton1Click:Connect(onButtonClicked)
