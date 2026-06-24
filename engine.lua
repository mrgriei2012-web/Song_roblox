local VirtualInputManager = game:GetService("VirtualInputManager")
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Функция нажатия клавиши
function play(note, bpm)
    VirtualInputManager:SendKeyEvent(true, note, false, mouse)
    task.wait(60 / bpm)
    VirtualInputManager:SendKeyEvent(false, note, false, mouse)
end

-- Функция паузы
function rest(duration, bpm)
    task.wait(duration * (60 / bpm))
end