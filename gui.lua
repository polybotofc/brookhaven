# Query: 
# ContextLines: 1

-- Buat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TestHubGui"
screenGui.Parent = game.CoreGui

-- Buat frame utama untuk Hub/GUI
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Warna hitam
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Buat judul hub
local title = Instance.new("TextLabel")
title.Text = "Test Hub"
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Warna abu-abu gelap
title.TextColor3 = Color3.fromRGB(255, 255, 255) -- Warna putih
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold
title.Parent = mainFrame

-- Buat tombol uji coba
local testButton = Instance.new("TextButton")
testButton.Text = "Run Test"
testButton.Size = UDim2.new(0.8, 0, 0.2, 0)
testButton.Position = UDim2.new(0.1, 0, 0.6, 0)
testButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Warna abu-abu
testButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Warna putih
testButton.Font = Enum.Font.SourceSans
testButton.TextScaled = true
testButton.Parent = mainFrame

-- Fungsi ketika tombol ditekan
testButton.MouseButton1Click:Connect(function()
    print("Test button clicked!")
    -- Tambahkan fungsi atau script yang ingin diujikan di sini
end)
