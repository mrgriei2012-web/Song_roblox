-- 1. Создаем интерфейс (GUI)
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "MusicMenu"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 999

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 300)
frame.Position = UDim2.new(0.5, -100, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
frame.Active = true
frame.Draggable = true -- Чтобы можно было двигать окно

-- 2. Таблица песен (ссылки ведут на файлы с кодом нот из твоего GitHub)
local Songs = {
    ["Rush E"] = "https://raw.githubusercontent.com/mrgriei2012-web/Song_roblox/main/rush%20e.txt",
    ["Kiss Me Again"] = "https://raw.githubusercontent.com/mrgriei2012-web/Song_roblox/main/kiss%20me%20again.txt",
}

-- 3. Функция запуска
local function playSong(url)
    -- Загружаем основной движок
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://hellohellohell0.com/talentless-raw/loader_main.lua", true))()
        loadstring(game:HttpGet(url, true))()
    end)
    
    if not success then
        warn("Ошибка запуска песни: " .. tostring(err))
    end
end

-- 4. Создаем кнопки для каждой песни
local yOffset = 0
for name, url in pairs(Songs) do
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, 0, 0, 50)
    btn.Position = UDim2.new(0, 0, 0, yOffset)
    btn.Text = name
    btn.MouseButton1Click:Connect(function()
        playSong(url)
    end)
    yOffset = yOffset + 50
end

print("Меню успешно загружено!")
