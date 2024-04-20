local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
 
-- check if the ScreenGui already exists, if it does, destroy it and remove BillboardGuis
if playerGui:FindFirstChild("TadachiisESP") then
    playerGui:FindFirstChild("TadachiisESP"):Destroy()
 
    for _, player in ipairs(game.Players:GetPlayers()) do
        local billboardGui = player.Character and player.Character:FindFirstChild("Head") and player.Character.Head:FindFirstChild("PlayerBillboardGui")
        if billboardGui then
            billboardGui:Destroy()
        end
    end
end
 
-- create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TadachiisESP"
screenGui.Parent = playerGui
screenGui.DisplayOrder = 1
 
-- create Frame
local holder = Instance.new("Frame")
holder.Name = "Holder"
holder.Parent = screenGui
holder.Size = UDim2.new(0, 200, 0, 100) -- size of the frame
holder.Position = UDim2.new(0.5, -100, 0.5, -50) -- position of the frame at the center of the screen
holder.BackgroundColor3 = Color3.new(1, 1, 1) -- white background
holder.BackgroundTransparency = 0.5 -- semi-transparent
holder.Draggable = true -- makes the frame draggable
holder.Active = true
 
-- create TextLabel
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Text = "Tadachii's ESP GUI"
titleLabel.TextScaled = true
titleLabel.Parent = holder
titleLabel.Size = UDim2.new(1, 0, 0.5, 0) -- fills half of the frame
titleLabel.BackgroundColor3 = Color3.new(1, 1, 1) -- white background
titleLabel.TextColor3 = Color3.new(0, 0, 0) -- black text
titleLabel.BackgroundTransparency = 0.5 -- semi-transparent
 
-- create TextLabel for Status
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Text = ""
statusLabel.Parent = holder
statusLabel.Size = UDim2.new(1, 0, 0.25, 0) -- fills one-fourth of the frame below the TitleLabel
statusLabel.Position = UDim2.new(0, 0, 0.5, 0) -- aligns the text label to the bottom of the frame
statusLabel.BackgroundColor3 = Color3.new(1, 1, 1) -- white background
statusLabel.TextColor3 = Color3.new(0, 0, 0) -- black text
statusLabel.BackgroundTransparency = 0.5 -- semi-transparent
statusLabel.TextScaled = true -- enable text scaling for the status label
 
-- create TextButton for Status
local statusButton = Instance.new("TextButton")
statusButton.Name = "StatusButton"
statusButton.Text = "Off"
statusButton.Parent = holder
statusButton.Size = UDim2.new(1, 0, 0.25, 0) -- fills one-fourth of the frame below the StatusLabel
statusButton.Position = UDim2.new(0, 0, 0.75, 0) -- aligns the button to the bottom of the frame
statusButton.BackgroundColor3 = Color3.new(1, 1, 1) -- white background
statusButton.TextColor3 = Color3.new(0, 0, 0) -- black text
statusButton.BackgroundTransparency = 0.5 -- semi-transparent
statusButton.TextScaled = true -- enable text scaling for the button
 
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
    textLabel.TextColor3 = Color3.new(1, 0, 0) -- red text for the player's name
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
                billboardGui.PlayerNameLabel.TextColor3 = Color3.new(1, 0, 0) -- Set the text color to red
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
