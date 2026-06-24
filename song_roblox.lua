-- c00lkidd214anzz Script Hub
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local VirtualInputManager = game:GetService("VirtualInputManager")
local mouse = player:GetMouse()

-- 1. Создаем GUI и Ватермарк
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "MusicMenu"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 999

local watermark = Instance.new("TextLabel", screenGui)
watermark.Size = UDim2.new(0, 200, 0, 30)
watermark.Position = UDim2.new(0, 10, 0, 10)
watermark.BackgroundTransparency = 1
watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
watermark.Font = Enum.Font.GothamBold
watermark.TextSize = 20
watermark.Text = "c00lkidd214anzz"
watermark.TextXAlignment = Enum.TextXAlignment.Left
local uiStroke = Instance.new("UIStroke", watermark)
uiStroke.Thickness = 2

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true

-- 2. Движок (функции)
getgenv().play = function(note, bpm)
    VirtualInputManager:SendKeyEvent(true, note, false, mouse)
    task.wait(60 / bpm)
    VirtualInputManager:SendKeyEvent(false, note, false, mouse)
end

getgenv().rest = function(duration, bpm)
    task.wait(duration * (60 / bpm))
end

-- 3. Функция запуска с передачей окружения
local function startSong(url)
    local success, songCode = pcall(function() return game:HttpGet(url, true) end)
    if success and songCode then
        local func, err = loadstring(songCode)
        if func then
            setfenv(func, getfenv()) -- Файл песни видит функции play и rest
            func()
        else
            warn("Ошибка кода: " .. tostring(err))
        end
    else
        warn("Не удалось скачать файл: " .. tostring(songCode))
    end
end

-- 4. Кнопки с твоими ссылками
local songs = {
    ["Rush E"] = "https://raw.githubusercontent.com/mrgriei2012-web/Song_roblox/main/rush%20e.txt",
    ["Kiss Me Again"] = "https://raw.githubusercontent.com/mrgriei2012-web/Song_roblox/refs/heads/main/kiss%20me%20again.txt"
}

local yOffset = 0
for name, url in pairs(songs) do
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new(0, 0, 0, yOffset)
    btn.Text = name
    btn.MouseButton1Click:Connect(function() startSong(url) end)
    yOffset = yOffset + 40
end

print("Скрипт c00lkidd214anzz успешно запущен!")
