-- Таблица твоих песен
local Songs = {
    ["rush e"] = "https://pastebin.com/raw/ССЫЛКА_НА_ПЕРВУЮ",
    ["kiss me again"] = "https://raw.githubusercontent.com/mrgriei2012-web/Song_roblox/refs/heads/main/kiss%20me%20again.txt",
}

-- Функция запуска (теперь она принимает ссылку)
local function playSong(url)
    -- Останавливаем текущую музыку, если она играет (опционально)
    -- Загружаем "движок" и саму песню
    loadstring(game:HttpGet("https://hellohellohell0.com/talentless-raw/loader_main.lua", true))()
    loadstring(game:HttpGet(url, true))()
end

-- В меню просто создаешь кнопки для каждой песни:
for name, url in pairs(Songs) do
    local btn = Instance.new("TextButton", frame)
    btn.Text = name
    btn.MouseButton1Click:Connect(function()
        playSong(url)
    end)
end
