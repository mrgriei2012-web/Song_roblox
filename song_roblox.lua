-- c00lkidd214anzz Script Hub
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Флаг, чтобы загрузить проигрыватель только один раз
getgenv().isEngineLoaded = false

-- Функция для безопасной загрузки движка
local function loadEngine()
    if not getgenv().isEngineLoaded then
        loadstring(game:HttpGet("https://hellohellohell0.com/talentless-raw/loader_main.lua", true))()
        getgenv().isEngineLoaded = true
        task.wait(2) -- Даем время на инициализацию стороннего GUI
    end
end

-- Создаем твое окно с кнопками
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "MySongsGui"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0, 50, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true

-- Заголовок
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "c00lkidd214anzz"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

-- Список песен
local songs = {
    ["Rush E"] = "https://raw.githubusercontent.com/mrgriei2012-web/Song_roblox/main/rush%20e.txt",
    ["Kiss Me Again"] = "https://raw.githubusercontent.com/mrgriei2012-web/Song_roblox/refs/heads/main/kiss%20me%20again.txt"
}

local yOffset = 30
for name, url in pairs(songs) do
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, yOffset)
    btn.Text = name
    
    btn.MouseButton1Click:Connect(function()
        -- 1. Сначала загружаем проигрыватель (если не запущен)
        loadEngine()
        
        -- 2. Затем выполняем файл песни
        local success, code = pcall(function() return game:HttpGet(url, true) end)
        if success then
            local func = loadstring(code)
            if func then 
                func() 
            else
                warn("Ошибка: код песни не загрузился")
            end
        end
    end)
    yOffset = yOffset + 30
end