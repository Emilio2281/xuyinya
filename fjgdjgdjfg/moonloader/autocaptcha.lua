script_name("AutoCaptcha")
script_authors("t1ckz")
script_dependencies("CLEO")
require "lib.moonloader"
local sampev = require 'lib.samp.events'
require "lib.sampfuncs"
local key = require 'vkeys'

local valuecap = 22
function main()
sampfuncsLog("AutoCaptcha. verison: 0.1(Загружено: "..valuecap.." капч)")
end

function sampev.onShowDialog(dialogId, style, caption, b1, b2,text)
--sampfuncsLog(text)
if string.find(text, "В какую игру Вы сейчас играете?") then -- 22 штуки
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} GTA SAMP(3)",0xFFFFFF)
end
if string.find(text, "Отметьте цифру 15") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 2) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} 15(2)",0xFFFFFF)
end
if string.find(text, "Какой сейчас год?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 1) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} 2018(1)",0xFFFFFF)
end
if string.find(text, "Какое время года идёт после зимы?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 1) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} Весна(1)",0xFFFFFF)
end
if string.find(text, "На каком СЕРВЕРЕ Вы сейчас играете?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 1) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} Emerald(1)",0xFFFFFF)
end
if string.find(text, "Сколько букв в имени TANYA") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 4) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} 5(4)",0xFFFFFF)
end
if string.find(text, "Сколько букв в имени ROMEO") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} 5(3)",0xFFFFFF)
end
if string.find(text, "Что такое GTA SAMP?") then
sampSendDialogResponse(673, 1, 0, 4) 
enableDialog(true)
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} Игра(4)",0xFFFFFF)
end
if string.find(text, "Что снизу Вашего персонажа?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} Ноги(3)",0xFFFFFF)
end
if string.find(text, "Какого цвета трава?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} Зеленая(3)",0xFFFFFF)
end
if string.find(text, "Чем облизывает человек?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 2) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} Языком(2)",0xFFFFFF)
end
if string.find(text, "Чем слышит человек других людей?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 2) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} Ушами(2)",0xFFFFFF)
end
if string.find(text, "Сколько ногтей на пяти пальцах?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 1) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} Пять(1)",0xFFFFFF)
end
if string.find(text, "Сколько всего часов в одном дне?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 2) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} 24(2)",0xFFFFFF)
end
if string.find(text, "Выберите слово КИТ") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} КИТ(3)",0xFFFFFF)
end
if string.find(text, "Правильный ответ на пример 2 плюс шесть?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 4) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} 8(4)",0xFFFFFF)
end
if string.find(text, "На чем сидите?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 1) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} На машине(1)",0xFFFFFF)
end
if string.find(text, "Чем видит человек окружающий мир?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} Глазами(3)",0xFFFFFF)
end
if string.find(text, "С помощью чего ходит здоровый человек?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} С помощью ног(3)",0xFFFFFF)
end
if string.find(text, "Что растет на голове?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 2) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} Волосы(2)",0xFFFFFF)
end
if string.find(text, "Сколько будет два плюс пять?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 2) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} 7(2)",0xFFFFFF)
end
if string.find(text, "Правильный ответ на пример 6 минус 3?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("Ответ был найден в базе:{007dff} 3(3)",0xFFFFFF)
end
end

function enableDialog(bool)
    local memory = require 'memory'
    memory.setint32(sampGetDialogInfoPtr()+40, bool and 1 or 0, true)
    sampToggleCursor(bool)
end 