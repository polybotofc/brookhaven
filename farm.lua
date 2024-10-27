local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local primaryPart = character.PrimaryPart

-- Daftar nama Easter Egg dengan tingkat kesulitan (tanpa EasterEggEasy)
local eggNames = {
    "EasterEggMedium",
    "EasterEggHard",
    "EasterEggExtreme",
    "EasterEggUltimate"
}

-- ==========================================
-- GUI
-- ==========================================

local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.ResetOnSpawn = false

-- Frame utama
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0.4, 0, 0.5, 0)
mainFrame.Position = UDim2.new(0.3, 0, 0.25, 0) -- Posisi di tengah layar
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 0, 0) -- Merah tua (tema Halloween)
mainFrame.BackgroundTransparency = 0 -- Non-transparan
mainFrame.BorderSizePixel = 0
mainFrame.Draggable = true -- Pastikan GUI bisa digeser
mainFrame.Visible = true -- Awalnya ditampilkan

-- Membuat sudut frame menjadi bulat
local UICorner = Instance.new("UICorner", mainFrame)
UICorner.CornerRadius = UDim.new(0, 10)

-- Frame untuk judul
local titleFrame = Instance.new("Frame", mainFrame)
titleFrame.Size = UDim2.new(1, 0, 0.15, 0)
titleFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam
titleFrame.BorderSizePixel = 0

-- Judul
local titleLabel = Instance.new("TextLabel", titleFrame)
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.Text = "BrookHaven Hallowen 2024"
titleLabel.TextColor3 = Color3.fromRGB(255, 165, 0) -- Orange (tema Halloween)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.GothamBold
titleLabel.FontSize = Enum.FontSize.Size36
titleLabel.TextScaled = true

-- Tombol Minimize
local minimizeButton = Instance.new("TextButton", titleFrame)
minimizeButton.Size = UDim2.new(0.05, 0, 0.8, 0) -- Ukuran diperkecil
minimizeButton.Position = UDim2.new(0.95, 0, 0.1, 0)
minimizeButton.Text = "-"
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0) -- Orange
minimizeButton.TextColor3 = Color3.new(0, 0, 0) -- Hitam
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.FontSize = Enum.FontSize.Size36
minimizeButton.TextScaled = true

-- Tombol Kill GUI
local killButton = Instance.new("TextButton", titleFrame)
killButton.Size = UDim2.new(0.05, 0, 0.8, 0) -- Ukuran diperkecil
killButton.Position = UDim2.new(0.9, 0, 0.1, 0)
killButton.Text = "X"
killButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Merah
killButton.TextColor3 = Color3.new(0, 0, 0) -- Hitam
killButton.Font = Enum.Font.GothamBold
killButton.FontSize = Enum.FontSize.Size24
killButton.TextScaled = true

-- Frame untuk menu
local menuFrame = Instance.new("Frame", mainFrame)
menuFrame.Size = UDim2.new(0.3, 0, 0.85, 0)
menuFrame.Position = UDim2.new(0, 0, 0.15, 0)
menuFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam
menuFrame.BorderSizePixel = 0

-- Tombol Farm Candy
local farmButton = Instance.new("TextButton", menuFrame)
farmButton.Size = UDim2.new(1, 0, 0.2, 0)
farmButton.Position = UDim2.new(0, 0, 0, 0)
farmButton.Text = "Farm Candy"
farmButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0) -- Orange
farmButton.BackgroundTransparency = 0 -- Non-transparan
farmButton.TextColor3 = Color3.new(0, 0, 0) -- Hitam
farmButton.Font = Enum.Font.SourceSansBold
farmButton.FontSize = Enum.FontSize.Size24
farmButton.TextScaled = true

-- Credit
local creditLabel = Instance.new("TextLabel", menuFrame)
creditLabel.Size = UDim2.new(1, 0, 0.2, 0)
creditLabel.Position = UDim2.new(0, 0, 0.2, 0)
creditLabel.Text = "Made by Luthfi123456l" -- Ganti dengan nama Anda
creditLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Putih
creditLabel.BackgroundTransparency = 1
creditLabel.Font = Enum.Font.SourceSans
creditLabel.FontSize = Enum.FontSize.Size18
creditLabel.TextScaled = true
creditLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Tombol Discord
local discordButton = Instance.new("TextButton", menuFrame)
discordButton.Size = UDim2.new(1, 0, 0.2, 0)
discordButton.Position = UDim2.new(0, 0, 0.4, 0)
discordButton.Text = "Copy Discord Link"
discordButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0) -- Merah tua
discordButton.BackgroundTransparency = 0 -- Non-transparan
discordButton.TextColor3 = Color3.new(1, 1, 1)
discordButton.Font = Enum.Font.SourceSansBold
discordButton.FontSize = Enum.FontSize.Size24
discordButton.TextScaled = true

-- Fungsi untuk menyalin link Discord
local function copyDiscordLink()
    -- Ganti "your_discord_link" dengan link Discord Anda
    setclipboard("your_discord_link")
end

-- Menghubungkan tombol Discord
discordButton.MouseButton1Click:Connect(copyDiscordLink)

-- Frame untuk konten
local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Size = UDim2.new(0.7, 0, 0.85, 0)
contentFrame.Position = UDim2.new(0.3, 0, 0.15, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam
contentFrame.BackgroundTransparency = 0.5
contentFrame.BorderSizePixel = 0

-- Container untuk avatar dan nama pemain di contentFrame
local playerContainer2 = Instance.new("Frame", contentFrame)
playerContainer2.Size = UDim2.new(1, 0, 0.15, 0)
playerContainer2.BackgroundTransparency = 1

-- Gambar Avatar di contentFrame
local playerImage2 = Instance.new("ImageLabel", playerContainer2)
playerImage2.Size = UDim2.new(0.15, 0, 1, 0)
playerImage2.BackgroundTransparency = 1
playerImage2.Image = game.Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)

-- Nama Pemain di contentFrame
local playerLabel2 = Instance.new("TextLabel", playerContainer2)
playerLabel2.Size = UDim2.new(0.85, 0, 1, 0)
playerLabel2.Position = UDim2.new(0.15, 0, 0, 0)
playerLabel2.Text = player.Name
playerLabel2.TextColor3 = Color3.fromRGB(255, 255, 255) -- Putih
playerLabel2.BackgroundTransparency = 1
playerLabel2.Font = Enum.Font.SourceSansBold
playerLabel2.FontSize = Enum.FontSize.Size24
playerLabel2.TextScaled = true
playerLabel2.TextXAlignment = Enum.TextXAlignment.Left

-- TextLabel di bawah nama pemain
local infoLabel = Instance.new("TextLabel", playerContainer2)
infoLabel.Size = UDim2.new(0.85, 0, 1, 0)
infoLabel.Position = UDim2.new(0.15, 0, 1.5, 0)  -- Posisi di bawah nama pemain
infoLabel.Text = "ini gui versi 1 dari saya maaf kalau ada ./n bug dan ketika selesai farm matikan farm nya ./n join ke discord untuk info gui selengkapnya " -- Ganti dengan teks yang Anda inginkan
infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Putih
infoLabel.BackgroundTransparency = 1
infoLabel.Font = Enum.Font.SourceSans
infoLabel.FontSize = Enum.FontSize.Size14
infoLabel.TextScaled = true
infoLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Frame untuk notifikasi
local notificationFrame = Instance.new("Frame", screenGui) -- Dipindahkan ke screenGui
notificationFrame.Size = UDim2.new(0.3, 0, 0.1, 0)
notificationFrame.Position = UDim2.new(1, 0, 0.9, 0) -- Awal di luar layar sebelah kanan
notificationFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Hitam
notificationFrame.BackgroundTransparency = 0.5
notificationFrame.BorderSizePixel = 0

-- Membuat sudut notifikasi menjadi bulat
local UICorner2 = Instance.new("UICorner", notificationFrame)
UICorner2.CornerRadius = UDim.new(0, 10)

-- Label untuk menampilkan notifikasi
local notificationLabel = Instance.new("TextLabel", notificationFrame)
notificationLabel.Size = UDim2.new(1, 0, 1, 0)
notificationLabel.Text = ""
notificationLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Putih
notificationLabel.BackgroundTransparency = 1
notificationLabel.Font = Enum.Font.SourceSans
notificationLabel.FontSize = Enum.FontSize.Size14
notificationLabel.TextScaled = true
notificationLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Fungsi untuk menampilkan notifikasi
local function showNotification(message)
    notificationLabel.Text = message
    notificationFrame:TweenPosition(UDim2.new(0.7, 0, 0.9, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5) -- Animasi muncul dari kanan
    wait(3) -- Menampilkan notifikasi selama 3 detik
    notificationFrame:TweenPosition(UDim2.new(1, 0, 0.9, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5) -- Animasi keluar ke kanan
    notificationLabel.Text = ""
end

-- Menampilkan notifikasi saat pemain join
game.Players.PlayerAdded:Connect(function(player)
    showNotification(player.Name .. " joined!")
end)

-- Menampilkan notifikasi saat pemain leave
game.Players.PlayerRemoving:Connect(function(player)
    showNotification(player.Name .. " left!")
end)

-- ==========================================
-- Fungsi untuk bot
-- ==========================================

-- Menonaktifkan collision
function disableCollision()
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end
end

-- Mengaktifkan collision
function enableCollision()
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = true
        end
    end
end

-- Fungsi untuk memindahkan bot ke posisi part
function moveToPart(part)
    if part then
        -- Membuat BodyPosition
        local bodyPosition = Instance.new("BodyPosition", primaryPart)
        bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyPosition.D = 1000 -- Menambahkan damping untuk memperlambat pergerakan
        bodyPosition.P = 3000 -- Menyesuaikan kekuatan posisi
        bodyPosition.Position = part.Position

        -- Tunggu sampai bot mencapai posisi part
        local distance = (primaryPart.Position - part.Position).Magnitude
        while distance > 1 do
            wait(0.2) -- Menambahkan delay untuk memperlambat pergerakan
            distance = (primaryPart.Position - part.Position).Magnitude
        end

        -- Menghapus BodyPosition
        bodyPosition:Destroy()
    else
        warn("Part tidak ditemukan.")
    end
end

-- Fungsi untuk mengumpulkan candy di suatu Easter Egg
function collectCandyInEgg(eggName)
    local egg = workspace:FindFirstChild("Easter001!")
    if egg then
        local candy = egg:FindFirstChild(eggName)
        if candy then
            -- Mengumpulkan semua Eggy di dalam Easter Egg
            for _, eggyPart in ipairs(candy:GetChildren()) do
                if eggyPart.Name == "Eggy" then
                    moveToPart(eggyPart)
                end
            end
        else
            warn(eggName .. " tidak ditemukan.")
        end
    else
        warn("Workspace 'Easter001!' tidak ditemukan.")
    end
end

-- Fungsi untuk memulai pergerakan bot
function startMoving()
    isMoving = true
    farmButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0) -- Merah
    disableCollision() -- Menonaktifkan collision saat mulai
    humanoid.WalkSpeed = 0 -- Menghentikan pergerakan berjalan

    while isMoving do
        for _, eggName in ipairs(eggNames) do
            collectCandyInEgg(eggName)
            wait(2) -- Menambahkan delay antar egg
        end

        -- Reset karakter setelah semua candy terkumpul
        player:LoadCharacter()
        break
    end
end

-- Fungsi untuk menghentikan pergerakan bot
function stopMoving()
    isMoving = false
    farmButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- Abu-abu
    enableCollision() -- Mengaktifkan kembali collision saat berhenti
    humanoid.WalkSpeed = 16 -- Mengembalikan kecepatan berjalan normal
    humanoid:MoveTo(character.PrimaryPart.Position) -- Menghentikan pergerakan
end

-- Menghubungkan tombol FarmCandy
farmButton.MouseButton1Click:Connect(function()
    if not isMoving then
        startMoving()
    else
        stopMoving()
    end
end)

-- ==========================================
-- Mendeteksi perubahan karakter
-- ==========================================

player.CharacterAdded:Connect(function(newCharacter)
    -- Update variabel karakter
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    primaryPart = newCharacter.PrimaryPart

    -- Jalankan ulang script jika bot sedang aktif
    if isMoving then
        startMoving()
    end
end)

-- ==========================================
-- Fungsi untuk tombol Minimize dan Kill GUI
-- ==========================================

-- Variabel untuk menyimpan state GUI
local isMinimized = false

-- Fungsi untuk minimize GUI
function minimizeGUI()
    if isMinimized then
        mainFrame.Size = UDim2.new(0.4, 0, 0.5, 0)
        minimizeButton.Text = "-"
        isMinimized = false
    else
        mainFrame.Size = UDim2.new(0.4, 0, 0.15, 0)
        minimizeButton.Text = "+"
        isMinimized = true
    end
    -- Sembunyikan/tampilkan contentFrame
    contentFrame.Visible = not isMinimized
end

-- Menghubungkan tombol Minimize
minimizeButton.MouseButton1Click:Connect(minimizeGUI)

-- Menghubungkan tombol Kill GUI
killButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Membulatkan semua tombol
local buttons = { farmButton, discordButton, minimizeButton, killButton }
for _, button in ipairs(buttons) do
    local corner = Instance.new("UICorner", button)
    corner.CornerRadius = UDim.new(0, 8)
end