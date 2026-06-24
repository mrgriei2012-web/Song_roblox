-- 1. Загружаем сторонний движок
task.spawn(function()
    loadstring(game:HttpGet("https://hellohellohell0.com/talentless-raw/loader_main.lua", true))()
end)

-- Ждем, пока сторонний GUI появится
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 2. Твой интерфейс с кнопками песен
task.spawn(function()
    task.wait(3) -- Ждем загрузки движка
    
    local screenGui = Instance.new("ScreenGui", playerGui)
    screenGui.Name = "MySongsGui"
    screenGui.ResetOnSpawn = false
    
    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 200, 0, 150)
    frame.Position = UDim2.new(0, 50, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.Active = true
    frame.Draggable = true
    
    local watermark = Instance.new("TextLabel", frame)
    watermark.Size = UDim2.new(1, 0, 0, 30)
    watermark.Text = "c00lkidd214anzz"
    watermark.TextColor3 = Color3.new(1, 1, 1)
    watermark.BackgroundTransparency = 1
    
    -- Кнопки песен
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
            -- Загружаем код песни и выполняем его в окружении стороннего скрипта
            local success, code = pcall(function() return game:HttpGet(url, true) end)
            if success then
                local func = loadstring(code)
                if func then func() end
            end
        end)
        yOffset = yOffset + 30
    end
end)