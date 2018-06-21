script_name("AutoFisher")
script_authors("t1ckz")
script_dependencies("CLEO")
require "lib.moonloader"
local as_action = require('moonloader').audiostream_state
local sampev = require 'lib.samp.events'
require "lib.sampfuncs"
local key = require 'vkeys'
local imgui = require 'imgui'
local encoding = require 'encoding'
local inicfg = require 'inicfg'
local pie = require 'piem'
--local w32 = require ('w32')
encoding.default = 'CP1251'
u8 = encoding.UTF8

local verisonScript = "v1.5"

local actX, actY, actZ
local active = 0
local autobuy = 0
local waiter = 2000
local clickwait = 50
local pears = 1
local test_text_buffer = imgui.ImInt(2)
local clickwaiter = imgui.ImFloat(0.2)
local setwaiter = imgui.ImInt(2)
local intkeyac = imgui.ImInt(36)
local imogran = imgui.ImInt(15000)
local combo1 = imgui.ImInt(3)
local combo2 = imgui.ImInt(0)
local combo3 = imgui.ImInt(0)
local combo4 = imgui.ImInt(0)
local main_window_state = imgui.ImBool(false)
local win_inform = imgui.ImBool(false)
local changelogwin = imgui.ImBool(false)
local fobject = 0
local o_fish = 0 
local kg_fish = 0.00
local ogran = 15000
local gmped = false
local najiva
local dialcl = 0 
local aafk = 0
local x = 0
local jobed = 0
local didi, d_Text, d_Style, d_b1, d_b2, d_Caption, didi, Voiced, Messaged, MenuOpenV, newCfg, keyac
local design = 3
local fish = 0

local initcfg
function main()
while not isSampAvailable() do wait(100) end
lua_thread.create(RunToBuy) 
lua_thread.create(Captcha)
Voiced = loadAudioStream("moonloader/voice.mp3")
Messaged = loadAudioStream("moonloader/message.mp3")
MenuOpenV = loadAudioStream("moonloader/message.mp3")
initcfg = inicfg.load(nil, "[AFB] Settings")
if initcfg == nil then
newCfg = {
settings = {
f_wait = 2000,
f_pears = 1,
f_object = 0,
f_key = 36,
f_naj = 1,
f_clickwait = 0.05,
f_design = 1,
f_ogran = 15000
}
}
inicfg.save(newCfg, "[AFB] Settings")
initcfg = inicfg.load(nil, "[AFB] Settings")
waiter = initcfg.settings.f_wait
pears = initcfg.settings.f_pears
ogran = initcfg.settings.f_ogran
o_fish = ogran
local keyace = initcfg.settings.f_key
keyac = string.gsub(keyace, '"', " ")
fobject = initcfg.settings.f_object
najiva = initcfg.settings.f_naj
clickwait = initcfg.settings.f_clickwait
design = initcfg.settings.f_design
sampAddChatMessage("[AFB] {ffffff}Не найден файл настройки. Был сознан новый со стандартными.", 0x007DFF)
else
newCfg = {
settings = {
f_wait = initcfg.settings.f_wait,
f_pears = initcfg.settings.f_pears,
f_object = initcfg.settings.f_object,
f_key = initcfg.settings.f_key,
f_naj = initcfg.settings.f_naj,
f_clickwait = initcfg.settings.f_clickwait,
f_design = initcfg.settings.f_design,
f_ogran = initcfg.settings.f_ogran
}
}
waiter = initcfg.settings.f_wait
pears = initcfg.settings.f_pears
local keyace = initcfg.settings.f_key
fobject = initcfg.settings.f_object
najiva = initcfg.settings.f_naj
clickwait = initcfg.settings.f_clickwait
design = initcfg.settings.f_design
ogran = initcfg.settings.f_ogran
o_fish = ogran
keyac = string.gsub(keyace, '"', " ")
end
local saveX = {}
local saveY = {}
local saveZ = {}
jobed = 1
if jobed == 1 then
if design == 0 then
styleDefault()
elseif design == 1 then
styleDefault2()
elseif design == 2 then
styleDefault3()
elseif design == 3 then
apply_custom_style()
end
combo1 = imgui.ImInt(design)
o_fish = ogran
sampRegisterChatCommand("fbot", aget)
  while true do
    wait(0)
	if jobed == 1 then
    if wasKeyPressed(keyac) then
		setAudioStreamState(MenuOpenV, as_action.PLAY)
        main_window_state.v = not main_window_state.v 
    end
    imgui.Process = main_window_state.v
	if fobject >= 1 then
	local X, Y, Z = getCharCoordinates(playerPed)
	local _, object = findAllRandomObjectsInSphere(X, Y, Z, 2.0, true)
	if object >= 1 then
	local _, posX, posY, posZ = getObjectCoordinates(object)
	local wposX, wposY = convert3DCoordsToScreen(posX, posY, posZ)
	local gett = sampGetObjectSampIdByHandle(object)
	local modelId = getObjectModel(object)
	if gett >= 1 then
	local _, positionX, positionY, positionZ = getObjectCoordinates(object)
	positionZ = positionZ + 0.1
	if modelId == 1281 or modelId == 19831 or modelId == 2226 or modelId == 1255 or modelId == 19608 or modelId == 1722 or modelId == 1739 or modelId == 2357 then
	if fobject == 1 then
	sampAddChatMessage("Был удалён семейный объект!", 0x007DFF)
	local _ = setObjectCoordinates(object, positionY, positionY, positionZ)
	end
	if fobject == 2 then
	setGameKeyState(14, 255)
	setAudioStreamState(Messaged, as_action.PLAY)
	end
	end
	end
	end
	end
	end
  end
else
end
end


function aget()
main_window_state.v = not main_window_state.v 
end
local COLOR_LGREEN = imgui.ImVec4(0.0, 2.55, 0.0, 1.00)
local COLOR_RED = imgui.ImVec4(255.0, 0.0, 0.0, 1.00)
local COLOR_DEFAULT = imgui.ImVec4(0.133, 0.166, 1.0, 1.00)
local COLOR_BLACK = imgui.ImVec4(0.0, 0.0, 0.0, 1.00)
local COLOR_WHITE = imgui.ImVec4(1.0, 1.0, 1.0, 1.00)

function imgui.OnDrawFrame()
  if main_window_state.v then 
	imgui.SetNextWindowPos(imgui.ImVec2(600,100), imgui.Cond.FirstUseEver);
    imgui.SetNextWindowSize(imgui.ImVec2(250, 320), imgui.Cond.FirstUseEver) 
    imgui.Begin('AFisher BOT '..verisonScript..'', main_window_state)
    imgui.Text(u8'Приветствуем вас в меню бота!')
	if active == 1 then 
	imgui.Text(u8"Бот активирован")
	else 
	imgui.TextColored(COLOR_RED,u8"Бот отключён")
	end 
    if imgui.Button(u8'Активировать бот',imgui.ImVec2(234,20)) then
	win_inform.v = not win_inform.v
		if active == 1
		then
		printString("~r~Deactive", 500)
		active = 0
		autobuy = 0
		o_fish = 0
		else
		printString("~g~Active", 1000)
		actX, actY, actZ = GetCoordinates()
		lua_thread.create(fisher)
		active = 1
		end
    end
	if imgui.CollapsingHeader(u8'Внутренние настройки') then
	if najiva == 1 then
	najiva = 1
	imgui.Text(u8"Наживка: Хлебный мякиш")
	else
	najiva = 2
	imgui.Text(u8'Наживка: Червь')
	end
	if imgui.Button(u8'Смена наживы', imgui.ImVec2(200,20)) then
	if najiva == 1
	then
	najiva = 2
	else
	najiva = 1
	end 
    end
	imgui.Text(u8'Задержка /fish')
	imgui.SliderInt(' ', setwaiter, 0, 5, "%.0f")
	waiter = setwaiter.v
	if pears == 1 then
	imgui.Text(u8"Правый(Ближний)")
	else
	imgui.Text(u8'Левый(Дальний)')
	end
	if imgui.Button(u8'Смена пирса', imgui.ImVec2(234,20)) then if pears == 1 then pears = 2 else pears = 1 end  end
	end
	if imgui.CollapsingHeader(u8'Внешние настройки') then
	imgui.Text(u8"Действие при объекте:")
	imgui.Combo(u8"", combo2, u8"Ничего\0Удалить\0Перепрыгнуть", 5)
	fobject = combo2.v
	imgui.Text(u8'Клавиша активации')
	imgui.InputInt(u8'ButtonID', intkeyac, 1)
	if imgui.Button(u8'Применить!',imgui.ImVec2(234,20)) then
	keyace = intkeyac.v
	if keyace >= 1 and keyace <= 145 then
	keyac = string.gsub(keyace, '"', " ")
	sampAddChatMessage(string.format("[AFB] {ffffff}Установлена клавиша: %d. Не забудьте сохранить настройки!", keyac), 0x007DFF)
	else
	sampAddChatMessage("[AFB] {ffffff}Укажите клавишу!", 0x007DFF)
	end
	end
	imgui.Text(u8'Ограничение рыбы')
	imgui.InputInt(u8'Кол-во', imogran, 10)
	if imgui.Button(u8'Установить ограничение',imgui.ImVec2(234,20)) then
	ogran = imogran.v
	o_fish = ogran
	if ogran >= 1 and ogran <= 99999999 then
	sampAddChatMessage(string.format("[AFB] {ffffff}Установленно ограничение: %d рыб. Не забудьте сохранить настройки!", o_fish), 0x007DFF)
	else
	sampAddChatMessage("[AFB] {ffffff}Неверное кол-во!", 0x007DFF)
	end
	end
	end
	if imgui.CollapsingHeader(u8'Доп.функции') then
	if imgui.Button(u8'Перезагрузить конфигурацию',imgui.ImVec2(234,20)) then
	initcfg = inicfg.load(nil, "[AFB] Settings")
	newCfg = {
	settings = {
	f_wait = initcfg.settings.f_wait,
	f_pears = initcfg.settings.f_pears,
	f_object = initcfg.settings.f_object,
	f_key = initcfg.settings.f_key,
	f_naj = initcfg.settings.f_naj,
	f_clickwait = initcfg.settings.f_clickwait,
	f_design = initcfg.settings.f_design,
	f_ogran = initcfg.setting.f_ogran
	}
	}
	waiter = initcfg.settings.f_wait
	pears = initcfg.settings.f_pears
	fobject = initcfg.settings.f_object
	najiva = initcfg.settings.f_naj
	clickwait = initcfg.settings.f_clickwait
	design = initcfg.settings.f_design
	ogran = initcfg.settings.f_ogran
	local keyace = initcfg.settings.f_key
	keyac = string.gsub(keyace, '"', " ")
	o_fish = ogran
	sampAddChatMessage("[AFB] {ffffff}Вы обновили настройки!",0x007DFF)
	end
	if imgui.Button(u8'Проверка аудио',imgui.ImVec2(234,20)) then
	sampAddChatMessage("Если всё впорядке, вы сейчас слышите аудио:{00ff00} message.mp3",0x007DFF)
	setAudioStreamState(Messaged, as_action.PLAY)
	end
	imgui.Combo(u8"Дизайн", combo1, u8"Синий\0Зелёный\0Красный\0Тёмный", 4)
	design = combo1.v
	if design == 0 then styleDefault()
	elseif design == 1 then styleDefault2()
	elseif design == 2 then styleDefault3()
	elseif design == 3 then apply_custom_style()
	end
	if imgui.Button(u8'Очистить чат',imgui.ImVec2(234,20)) then
	sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF)  sampAddChatMessage(" ",0xFFFFFF)  sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF)
	sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF)
	sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF)
	sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF) sampAddChatMessage(" ",0xFFFFFF)
	end
	end
	if imgui.Button(u8'Сохранить настройки',imgui.ImVec2(234,20)) then
	initcfg = inicfg.load(nil, "[AFB] Settings")
	newCfg = {
	settings = {
	f_wait = waiter,
	f_pears = pears,
	f_key = keyac,
	f_clickwait = clickwait,
	f_naj = najiva,
	f_object = fobject,
	f_design = design,
	f_ogran = ogran
	}
	}
	inicfg.save(newCfg, "[AFB] Settings")
	end
	
	if imgui.Button(u8'Обновления', imgui.ImVec2(234,20)) then
	changelogwin.v = not changelogwin.v
	end
	imgui.Text(u8'Альтернативное меню: ПКМ\n')
	imgui.Text('Author:\nVK:vk.com/t1ckz\nDiscord:T1cKz #8010')
	if imgui.IsWindowHovered() and imgui.IsMouseClicked(1) then
	imgui.OpenPopup(u8'Меню')
	end
	if pie.BeginPiePopup(u8'Меню', 1) then
	if pie.PieMenuItem(u8'Включить/Выключить бот') then
	win_inform.v = not win_inform.v
		if active == 1
		then
		printString("~r~Deactive", 500)
		active = 0
		autobuy = 0
		o_fish = 0
		else
		printString("~g~Active", 1000)
		actX, actY, actZ = GetCoordinates()
		lua_thread.create(fisher)
		active = 1
		end
		end
	if pie.BeginPieMenu(u8'Пирс') then
    if pie.PieMenuItem(u8'Ближний') then 
	sampAddChatMessage("[AFB]: {ffffff}Вы установили пирс: Ближний", 0x007DFF) 
	pears = 1
	end
    if pie.PieMenuItem(u8'Дальний') then 
	sampAddChatMessage("[AFB]: {ffffff}Вы установили пирс: Дальний", 0x007DFF) 
	pears = 2
	end
   pie.EndPieMenu()
  end
  if pie.BeginPieMenu(u8'Дизайн') then
    if pie.PieMenuItem(u8'Синий') then 
	sampAddChatMessage("[AFB]: {ffffff}Вы установили новый дизайн: Синий", 0x007DFF) 
	design = 0
	styleDefault()
	end
    if pie.PieMenuItem(u8'Зелёный') then 
	sampAddChatMessage("[AFB]: {ffffff}Вы установили новый дизайн: Зелёный", 0x007DFF) 
	design = 1
	styleDefault2()
	end
	if pie.PieMenuItem(u8'Красный') then 
	sampAddChatMessage("[AFB]: {ffffff}Вы установили новый дизайн: Красный", 0x007DFF) 
	design = 2
	styleDefault3()
	end
	if pie.PieMenuItem(u8'Тёмный') then 
	sampAddChatMessage("[AFB]: {ffffff}Вы установили новый дизайн: Тёмный", 0x007DFF) 
	design = 3
	apply_custom_style()
	end
   pie.EndPieMenu()
  end
    if pie.BeginPieMenu(u8'Действие при объекте') then
    if pie.PieMenuItem(u8'Ничего не делать') then 
	sampAddChatMessage("[AFB]: {ffffff}Вы установили новое действие: Ничего не делать", 0x007DFF) 
	fobject = 0
	end
    if pie.PieMenuItem(u8'Удалить') then 
	sampAddChatMessage("[AFB]: {ffffff}Вы установили новое действие: Удалить объект", 0x007DFF) 
	fobject = 1
	end
	if pie.PieMenuItem(u8'Перепрыгнуть') then 
	sampAddChatMessage("[AFB]: {ffffff}Вы установили новое действие: Перепрыгнуть", 0x007DFF) 
	fobject = 2
	end
   pie.EndPieMenu()
  end
  pie.EndPiePopup()
end
    imgui.End()
  end
  if win_inform.v then 
	imgui.SetNextWindowPos(imgui.ImVec2(900,100), imgui.Cond.FirstUseEver);
    imgui.SetNextWindowSize(imgui.ImVec2(250, 100), imgui.Cond.FirstUseEver) 
    imgui.Begin('Informer')
    imgui.Text(string.format(u8"%d/%d рыб",fish, ogran))
	imgui.Text(string.format(u8"КГ: %.2f", kg_fish))
	imgui.End()
  end
  if changelogwin.v then 
	imgui.SetNextWindowPos(imgui.ImVec2(100,100), imgui.Cond.FirstUseEver);
    imgui.SetNextWindowSize(imgui.ImVec2(450, 300), imgui.Cond.FirstUseEver) 
    imgui.Begin('ChangeLog')
    imgui.Text(u8"1.4b MoreFix\n- Исправлен баг с покупкой наживы\n- Исправлен баг с капчей+пару капч в базе\n- Исправлен баг со звуком\n- Добавил функцию 'Удалить объекты семей.'\n - Удаляет объект /fobject который находится\nв радиусе 2.0 метров.\n- Открыв статистику/Информацию о рыбе\n/Удар от игрока - диалог скрывается")
	imgui.Text(u8"1.4c\n- Добавлена смена стиля интерфейса\n- Добавлен баннихоп\n- Капчи в базу(Emerald, Quartz, Onyx, Amber)\n- Добавил ограничение рыбы\n- Возможность сохранять настройки\n- Возможность смены клавиши активации\n- Вернул информер")
	imgui.Text(u8"1.5\n- Добавлен счётчик КГ в информер\n- Убрана автокапча\n- Оптимизация кода\n- Альтернативное меню(PIE) - ПКМ\n- Новый дизайн - Тёмный\n- Фикс мелких багов")
	imgui.End()
  end
end

function sampev.onDisplayGameText(style, time, text)
if active == 1 then
		if string.find(text,"PED_FIREWEAPON")
		then
		setGameKeyState(17, 128)
			elseif string.find(text, "PED_LOCK_TARGET") then
			setGameKeyState(6, 128)
		end
		end	
end



function sampev.onSetInterior(interior)
if interior >= 1
then
if active == 1 then
active = 0
end
end
end

function sampev.onServerMessage(color, message)
if active == 1
then 
if string.find(message,"Server closed the connecting") then
local _, id = sampGetPlayerIdByCharHandle(playerPed)
local realy = sampIsPlayerConnected(id)
if realy == false then
setAudioStreamState(Voiced, as_action.PLAY)
end
elseif string.find(message, "Lost connection to the server. Reconnecting..") then
setAudioStreamState(Voiced, as_action.PLAY)
elseif string.find(message,"Вы в наручниках") then
setAudioStreamState(Messaged, as_action.PLAY)
active = 0
elseif string.find(message,"Администратор") then
if string.find(message,"для") or string.find(message,"телепортировал Вас к себе") then
setAudioStreamState(Voiced, as_action.PLAY)
active = 0
end
elseif string.find(message, "Нельзя использовать команды, пока открыт диалог") then
sampAddChatMessage(message, 0xFFFFFFFF)
if string.find(d_Caption, "Предупреждение") then
sampCloseCurrentDialogWithButton(0)
lua_thread.create(fisher)
end
return false
elseif string.find(message, "Прекратите флуд!") then
sampAddChatMessage(message, 0xFFFFFFFF)
lua_thread.create(fisher)
end
if string.find(message, "Вы поймали рыбу: ") then
if string.find(message, "Вес:") then
if string.find(message, "Окунь") or string.find(message, "Карась") or string.find(message, "Акула") or string.find(message, "Щука") then
local ss = string.match(message, "Вес: {1fc41f}(.*)кг")
kg_fish = kg_fish + ss
fish = fish + 1
o_fish = o_fish - 1
if o_fish == 0 then
active = 0
o_fish = 0
win_inform.v = not win_inform.v
setAudioStreamState(Messaged, as_action.PLAY)
sampAddChatMessage("[AFB] {ffffff}Ограничение рыбы! Бот отключён!",0x007DFF)
end
lua_thread.create(fisher)
end
end
end
if string.find(message, "Рыба сорвалась") then
sampAddChatMessage(message, 0xFFFFFFFF)
lua_thread.create(fisher)
return false
elseif string.find(message, "Внимание! У Вас нет лицензии. Вас может оштрафовать полиция. Вы можете приобрести лицензию у сотрудников мэрии") then
return false
elseif string.find(message, "Вы должны быть на лодке или в специально отведенном месте, направив персонажа в сторону воды") then
sampAddChatMessage(message, 0xFFFFFFFF)
local tempX, tempY, tempZ = GetCoordinates()
if tempZ <= 1.2 then
setAudioStreamState(Messaged, as_action.PLAY)
actZ = actZ - 1.1
setCharCoordinates(PLAYER_PED, actX, actY, actZ)
SetAngle(2624.9851,-3471.4514,4.72)
if pears == 1 then 
SetAngle(2624.9851,-3471.4514,4.72)
else
local dist = getDistanceBetweenCoords3d(tempX, tempY, tempZ, actX,actY,actZ)
SetAngle(2762.0059,-2319.8579,-0.4773)
if dist < 2 then
setCharCoordinates(PLAYER_PED, actX, actY, actZ)
end
end
sampfuncsLog("{007dff}[AFB] {ffffff}Бот вернулся на исходную позицию!")
autobuy = 1
lua_thread.create(fisher)
else
if pears == 1 then 
SetAngle(2624.9851,-3471.4514,4.72)
else
SetAngle(2762.0059,-2319.8579,-0.4773)
end
lua_thread.create(fisher)
setAudioStreamState(Messaged, as_action.PLAY)
end
return false
end
if string.find(message, "У вас нет наживы") then
msg = "• {AC0000}[Ошибка] {ffffff}У вас нет наживы"
if message == msg then
sampAddChatMessage(message, 0xFFFFFFFF)
autobuy = 1
sampfuncsLog("{007dff}[AFB] {ffffff}У вас закончилась наживка. Бот бежит за ней!")
else
sampfuncsLog("{007dff}[AFB] {ffffff}Кто-то попытался сбить бота:")
sampfuncsLog(message)
lua_thread.create(fisher)
end
return false
end
end
end


function sampev.onSendStatsUpdate(money, drunkLevel)
if active == 1 then
if money <= 49 then
setAudioStreamState(Messaged, as_action.PLAY)
sampAddChatMessage("[AFB] {ffffff}У вас нет денег на покупку наживы. Скрипт отключён!", 0x007DFF)
active = 0
end
end
end


function fisher()
wait(waiter)
if active == 1 then
sampSendChat("/fish")
end
end

function RunToBuy()
	while true do
		wait(0)
		if autobuy == 1 then
		local nX, nY, nZ = GetCoordinates()
			if pears == 1 then
			BeginToPoint(2592.69, -2468.18, 3.21, 0.300000, -255, false)
			BeginToPoint(2593.71, -2462.02, 3.21, 0.300000, -255, true)
			BeginToPoint(2598.38, -2460.77, 4.83, 0.300000, -255, true)
			BeginToPoint(2610.17, -2461.05, 9.39, 0.300000, -255, true)
			BeginToPoint(2616.73, -2461.10, 13.33, 0.300000, -255, true)
			BeginToPoint(2620.43, -2457.51, 13.62, 0.300000, -255, true)
			BeginToPoint(2612.50, -2455.16, 13.62, 0.300000, -255, true)
			BeginToPoint(2603.68, -2446.34, 13.62, 0.300000, -255, true)
			BeginToPoint(2596.79, -2437.94, 13.64, 0.300000, -255, true)
			BeginToPoint(2598.92, -2433.61, 13.64, 0.300000, -255, false)
			BeginToPoint(2601.67, -2431.78, 13.64, 0.300000, -255, false)
			BeginToPoint(2605.41, -2435.06, 13.65, 0.300000, -255, false)
			BeginToPoint(2607.62, -2437.31, 13.65, 0.300000, -255, false)
			wait(2500)
			sampSetCurrentDialogListItem(2)
			sampCloseCurrentDialogWithButton(1)
			wait(2000)
				local id = sampGetCurrentDialogId() 
				if najiva == 1 then
				sampSetCurrentDialogListItem(0)
				sampSendDialogResponse(id, 1, 0, 0) 
				else
				sampSetCurrentDialogListItem(1)
				sampSendDialogResponse(id, 1, 1, 0) 
				end 
				wait(1000)
			sampCloseCurrentDialogWithButton(0)
			wait(700)
			sampCloseCurrentDialogWithButton(0)
			BeginToPoint(2605.58, -2437.69, 13.65, 0.300000, -255, false)
			BeginToPoint(2605.29, -2435.34, 13.65, 0.300000, -255, false)
			BeginToPoint(2601.36, -2430.70, 13.64, 0.300000, -255, false)
			BeginToPoint(2597.74, -2432.33, 13.64, 0.300000, -255, false)
			BeginToPoint(2598.92, -2440.80, 13.63, 0.300000, -255, true)
			BeginToPoint(2607.57, -2451.88, 13.62, 0.300000, -255, true)
			BeginToPoint(2612.85, -2455.17, 13.62, 0.300000, -255, true)
			BeginToPoint(2617.86, -2458.85, 13.62, 0.300000, -255, false)
			BeginToPoint(2618.52, -2461.74, 13.33, 0.300000, -255, false)
			BeginToPoint(2610.44, -2461.94, 9.56, 0.300000, -255, false)
			BeginToPoint(2601.68, -2461.55, 6.91, 0.300000, -255, false)
			BeginToPoint(2594.99, -2461.79, 3.21, 0.300000, -255, false)
			BeginToPoint(2592.28, -2468.40, 3.21, 0.300000, -255, false)
			BeginToPoint(actX,actY,actZ, 0.300000, -255, false)
			SetAngle(2624.9851,-3471.4514,4.72)
			sampSendChat("/fish")
			autobuy = 0
			else if pears == 2 then
			BeginToPoint(2723.81, -2326.24, 3.00, 0.300000, -255, false)
			BeginToPoint(2712.10, -2326.37, 8.10, 0.300000, -255, true)
			BeginToPoint(2698.40, -2327.26, 13.33, 0.300000, -255, true)
			BeginToPoint(2695.36, -2327.42, 13.33, 0.300000, -255, true)
			BeginToPoint(2692.93, -2330.49, 13.63, 0.300000, -255, true)
			BeginToPoint(2690.09, -2334.39, 13.63, 0.300000, -255, true)
			BeginToPoint(2685.33, -2335.58, 13.63, 0.300000, -255, true)
			BeginToPoint(2635.85, -2338.87, 13.63, 0.300000, -255, true)
			BeginToPoint(2626.27, -2339.99, 13.63, 0.300000, -255, true)
			BeginToPoint(2614.82, -2344.75, 13.58, 0.300000, -255, true)
			BeginToPoint(2610.89, -2348.35, 13.60, 0.300000, -255, true)
			BeginToPoint(2608.73, -2359.97, 13.57, 0.300000, -255, true)
			BeginToPoint(2607.73, -2369.46, 13.58, 0.300000, -255, true)
			BeginToPoint(2603.84, -2421.91, 13.64, 0.300000, -255, true)
			BeginToPoint(2603.12, -2427.87, 13.64, 0.300000, -255, false)
			BeginToPoint(2602.52, -2431.14, 13.64, 0.300000, -255, false)
			BeginToPoint(2603.41, -2433.06, 13.65, 0.300000, -255, false)
			BeginToPoint(2605.81, -2435.42, 13.65, 0.300000, -255, false)
			BeginToPoint(2607.64, -2437.30, 13.65, 0.300000, -255, false)
			wait(2500)
			sampSetCurrentDialogListItem(2)
			sampCloseCurrentDialogWithButton(1)
			wait(2000)
				local id = sampGetCurrentDialogId() 
				if najiva == 1 then
				sampSetCurrentDialogListItem(0)
				sampSendDialogResponse(id, 1, 0, 0) 
				else
				sampSetCurrentDialogListItem(1)
				sampSendDialogResponse(id, 1, 1, 0) 
				end 
				wait(1000)
			sampCloseCurrentDialogWithButton(0)
			wait(700)
			sampCloseCurrentDialogWithButton(0)
			BeginToPoint(2607.26, -2434.78, 13.65, 0.300000, -255, false)
			BeginToPoint(2605.02, -2434.28, 13.65, 0.300000, -255, false)
			BeginToPoint(2602.34, -2432.02, 13.64, 0.300000, -255, false)
			BeginToPoint(2600.89, -2430.24, 13.64, 0.300000, -255, false)
			BeginToPoint(2601.25, -2425.31, 13.47, 0.300000, -255, false)
			BeginToPoint(2607.38, -2386.40, 13.63, 0.300000, -255, true)
			BeginToPoint(2611.55, -2351.76, 13.58, 0.300000, -255, true)
			BeginToPoint(2613.18, -2348.08, 13.58, 0.300000, -255, true)
			BeginToPoint(2616.46, -2345.65, 13.61, 0.300000, -255, true)
			BeginToPoint(2623.03, -2344.12, 13.63, 0.300000, -255, true)
			BeginToPoint(2682.33, -2336.23, 13.63, 0.300000, -255, true)
			BeginToPoint(2688.57, -2334.17, 13.63, 0.300000, -255, true)
			BeginToPoint(2695.55, -2330.26, 13.63, 0.300000, -255, true)
			BeginToPoint(2701.25, -2328.40, 13.21, 0.300000, -255, false)
			BeginToPoint(2709.41, -2327.51, 8.30, 0.300000, -255, false)
			BeginToPoint(2716.28, -2327.20, 6.62, 0.300000, -255, false)
			BeginToPoint(2720.92, -2327.13, 3.70, 0.300000, -255, false)
			BeginToPoint(2725.62, -2327.11, 3.00, 0.300000, -255, false)
			BeginToPoint(actX,actY,actZ, 0.300000, -255, false)
			SetAngle(2762.0059,-2319.8579,-0.4773)
			sampSendChat("/fish")
			autobuy = 0
			end
			end
			end
			end
end


function BeginToPoint(x, y, z, radius, move_code, isSprint)
	while true do 
		local posX, posY, posZ = GetCoordinates()
		SetAngle(x, y, z)
		local dist = getDistanceBetweenCoords3d(x, y, z, posX, posY, z)
		MovePlayer(move_code, isSprint, dist)
		wait(0)
		if autobuy == 0 or dist < radius then
		return
		end
		end
	end
	
function MovePlayer(move_code, isSprint, dis)
	setGameKeyState(1, move_code)
	if isSprint then
	if dis > 6.0 then
	local one = 1
	local two = 9999999999
	local tree = math.random(one, two)
	if tree <= 9900000000 then
	setGameKeyState(16, 255)
	else
	setGameKeyState(14, 255)
	end
	else
	setGameKeyState(16, 255)
	end
	end
end

function SetAngle(x, y, z)
	local posX, posY, posZ = GetCoordinates()
	local pX = x - posX
	local pY = y - posY
	local zAngle = getHeadingFromVector2d(pX, pY)

	if isCharInAnyCar(playerPed) then
		local car = storeCarCharIsInNoSave(playerPed)
		setCarHeading(car, zAngle)
	else
		setCharHeading(playerPed, zAngle)
	end

	restoreCameraJumpcut()
end

function GetCoordinates()
	if isCharInAnyCar(playerPed) then
		local car = storeCarCharIsInNoSave(playerPed)
		return getCarCoordinates(car)
	else
		return getCharCoordinates(playerPed)
	end
end

function teleportPlayer(x, y, z)
	if isCharInAnyCar(playerPed) then
		setCharCoordinates(playerPed, x, y, z)
	end
	setCharCoordinatesDontResetAnim(playerPed, x, y, z)
end

function setCharCoordinatesDontResetAnim(char, x, y, z)
	if doesCharExist(char) then
		local ptr = getCharPointer(char)
		setEntityCoordinates(ptr, x, y, z)
	end
end

function setEntityCoordinates(entityPtr, x, y, z)
	if entityPtr ~= 0 then
		local matrixPtr = readMemory(entityPtr + 0x14, 4, false)
		if matrixPtr ~= 0 then
			local posPtr = matrixPtr + 0x30
			writeMemory(posPtr + 0, 4, representFloatAsInt(x), false) --X
			writeMemory(posPtr + 4, 4, representFloatAsInt(y), false) --Y
			writeMemory(posPtr + 8, 4, representFloatAsInt(z), false) --Z
		end
	end
end

function sampev.onShowDialog(dialogId, style, caption, b1, b2,text)
--sampfuncsLog(text)
if active == 1 then
if string.find(caption, "Принадлежности рыбака") or string.find(caption,"Предупреждение") or string.find(caption,"Статистика") then
d_Caption = caption
d_Style = style
d_Text = text
d_b1 = b1
d_b2 = b2 
dialcl = 1
end
end
end

function Captcha()
while true do
wait(0)
	if dialcl >= 1 then
	wait(300)
	sampCloseCurrentDialogWithButton(0)
	sampShowDialog(1488, d_Caption, d_Text, d_b1, d_b2, d_Style)
	dialcl = 0
	end
end
end

function apply_custom_style()
imgui.SwitchContext()
local style = imgui.GetStyle()
local colors = style.Colors
local clr = imgui.Col
local ImVec4 = imgui.ImVec4
style.WindowRounding = 1.5
style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
style.ChildWindowRounding = 2.0
style.FrameRounding = 0.5
style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
style.ScrollbarSize = 13.0
style.ScrollbarRounding = 0
style.GrabMinSize = 8.0
style.GrabRounding = 1.0
-- style.Alpha =
style.WindowPadding = imgui.ImVec2(4.0, 4.0)
-- style.WindowMinSize =
style.FramePadding = imgui.ImVec2(3.5, 3.5)
-- style.ItemInnerSpacing =
-- style.TouchExtraPadding =
-- style.IndentSpacing =
-- style.ColumnsMinSpacing = ?
style.ButtonTextAlign = imgui.ImVec2(0.0, 0.5)
-- style.DisplayWindowPadding =
-- style.DisplaySafeAreaPadding =
-- style.AntiAliasedLines =
-- style.AntiAliasedShapes =
-- style.CurveTessellationTol =
colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.91)
colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
colors[clr.ComboBg]                = colors[clr.PopupBg]
colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
colors[clr.FrameBg]                = ImVec4(0.12, 0.12, 0.12, 0.94)
colors[clr.FrameBgHovered]         = ImVec4(0.45, 0.45, 0.45, 0.85)
colors[clr.FrameBgActive]          = ImVec4(0.63, 0.63, 0.63, 0.63)
colors[clr.TitleBg]                = ImVec4(0.13, 0.13, 0.13, 0.99)
colors[clr.TitleBgActive]          = ImVec4(0.13, 0.13, 0.13, 0.99)
colors[clr.TitleBgCollapsed]       = ImVec4(0.05, 0.05, 0.05, 0.79)
colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
colors[clr.CheckMark]              = ImVec4(1.00, 1.00, 1.00, 1.00)
colors[clr.SliderGrab]             = ImVec4(0.28, 0.28, 0.28, 1.00)
colors[clr.SliderGrabActive]       = ImVec4(0.35, 0.35, 0.35, 1.00)
colors[clr.Button]                 = ImVec4(0.12, 0.12, 0.12, 0.94)
colors[clr.ButtonHovered]          = ImVec4(0.34, 0.34, 0.35, 0.89)
colors[clr.ButtonActive]           = ImVec4(0.21, 0.21, 0.21, 0.81)
colors[clr.Header]                 = ImVec4(0.12, 0.12, 0.12, 0.94)
colors[clr.HeaderHovered]          = ImVec4(0.12, 0.12, 0.12, 0.94)
colors[clr.HeaderActive]           = ImVec4(0.16, 0.16, 0.16, 0.90)
colors[clr.Separator]              = colors[clr.Border]
colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function styleDefault()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 0.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.ChildWindowRounding = 10.0
    style.FrameRounding = 1.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 12.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 1.0
    style.GrabRounding = 0.5
    colors[clr.Text]                   = ImVec4(0.00, 0.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.00, 0.00, 0.00, 1.00)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 0.00, 0.00, 1.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(1.0, 0.0, 0.0, 1.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]                = ImVec4(0.0, 0.0, 1.0, 0.1)
    colors[clr.FrameBgHovered]         = ImVec4(0.0, 0.0, 1.0, 0.1)
    colors[clr.FrameBgActive]          = ImVec4(0.0, 0.0, 1.0, 0.1)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.00, 0.00, 0.00, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 1.51)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.00, 0.00, 1.00, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.00, 0.00, 1.00, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.00, 0.00, 1.00, 1.00)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Button]                 = ImVec4(0.00, 0.00, 0.98, 0.31)--кнопка
    colors[clr.ButtonHovered]          = ImVec4(0.10, 0.10, 0.98, 0.31)
    colors[clr.ButtonActive]           = ImVec4(0.20, 0.20, 0.98, 0.31)
    colors[clr.Header]                 = ImVec4(0.00, 0.00, 0.98, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.1, 0.1, 0.98, 1.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.2, 0.2, 0.98, 0.9)
    colors[clr.ResizeGripActive]       = ImVec4(0.3, 0.3, 0.98, 0.9)
    colors[clr.CloseButton]            = ImVec4(0.0, 0.0, 1.0, 0.1)
    colors[clr.CloseButtonHovered]     = ImVec4(0.0, 0.0, 0.0, 1.0)
    colors[clr.CloseButtonActive]      = ImVec4(0.0, 0.0, 0.0, 1.0)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.99)
end
function styleDefault2()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 0.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.ChildWindowRounding = 10.0
    style.FrameRounding = 1.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 12.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 1.0
    style.GrabRounding = 0.5
    colors[clr.Text]                   = ImVec4(0.00, 1.0, 0.00, 1.00)--текст
    colors[clr.TextDisabled]           = ImVec4(0.650, 0.50, 0.650, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.0, 0.0, 0.0, 1.00)--фон окна
    colors[clr.ChildWindowBg]          = ImVec4(0.0, 0.0, 0.0, 1.0)
    colors[clr.PopupBg]                = ImVec4(0.0, 0.0, 0.0, 1.0)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(1.0, 0.0, 0.0, 1.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]                = ImVec4(0.0, 1.0, 0.0, 0.1)
    colors[clr.FrameBgHovered]         = ImVec4(0.0, 1.0, 0.0, 0.1)
    colors[clr.FrameBgActive]          = ImVec4(0.0, 1.0, 0.0, 0.1)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.00, 0.00, 0.00, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 1.51)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)--скрол
    colors[clr.ScrollbarGrab]          = ImVec4(0.00, 1.0, 0.00, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.00, 1.0, 0.00, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(00.00, 1.0, 0.00, 1.00)
    colors[clr.CheckMark]              = ImVec4(0.0, 1.0, 0.0, 1.0)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.Button]                 = ImVec4(0.00, 0.40, 0.0, 0.5)
    colors[clr.ButtonHovered]          = ImVec4(0.0, 0.3, 0.0, 0.80)
    colors[clr.ButtonActive]           = ImVec4(0.0, 0.5, 0.0, 0.51)
    colors[clr.Header]                 = ImVec4(0.0, 0.00, 0.0, 1.00)
    colors[clr.HeaderHovered]          = ImVec4(0.0, 0.00, 0.0, 1.00)
    colors[clr.HeaderActive]           = ImVec4(0.0, 0.00, 0.0, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.00, 0.00, 0.00, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.0, 1.0, 0.0, 1.0)
    colors[clr.ResizeGripHovered]      = ImVec4(0.0, 0.8, 0.0, 1.0)
    colors[clr.ResizeGripActive]       = ImVec4(0.0, 0.9, 0.0, 1.0)
    colors[clr.CloseButton]            = ImVec4(0.0, 1.0, 0.0, 0.2)
    colors[clr.CloseButtonHovered]     = ImVec4(0.0, 0.0, 0.0, 0.1)
    colors[clr.CloseButtonActive]      = ImVec4(0.0, 0.0, 0.0, 1.0)
    colors[clr.PlotLines]              = ImVec4(0.0, 0.0, 0.0, 1.0)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.0, 0.0, 0.0, 1.0)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.99)
end
function styleDefault3()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 0.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.ChildWindowRounding = 10.0
    style.FrameRounding = 1.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 12.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 1.0
    style.GrabRounding = 0.5
    colors[clr.Text]                   = ImVec4(1.00, 0.00, 0.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.00, 0.00, 0.00, 1.00)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 0.00, 0.00, 1.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(1.0, 0.0, 0.0, 1.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]                = ImVec4(1.0, 0.0, 0.0, 0.1)
    colors[clr.FrameBgHovered]         = ImVec4(1.0, 0.0, 0.0, 0.1)
    colors[clr.FrameBgActive]          = ImVec4(1.0, 0.0, 0.0, 0.1)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.00, 0.00, 0.00, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 1.51)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(1.00, 0.00, 0.00, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(1.00, 0.00, 0.00, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(1.00, 0.00, 0.00, 1.00)
    colors[clr.CheckMark]              = ImVec4(1.0, 0.0, 0.0, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Button]                 = ImVec4(0.50, 0.00, 0.00, 1.0)
    colors[clr.ButtonHovered]          = ImVec4(1.00, 0.00, 0.00, 0.31)
    colors[clr.ButtonActive]           = ImVec4(0.60, 0.10, 0.00, 1.0)
    colors[clr.Header]                 = ImVec4(1.00, 0.00, 0.00, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(1.00, 0.00, 0.00, 0.80)
    colors[clr.HeaderActive]           = ImVec4(1.00, 0.00, 0.00, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(1.00, 0.00, 0.00, 0.31)
    colors[clr.ResizeGripHovered]      = ImVec4(1.00, 0.00, 0.00, 0.80)
    colors[clr.ResizeGripActive]       = ImVec4(1.00, 0.00, 0.00, 1.00)
    colors[clr.CloseButton]            = ImVec4(1.0, 0.0, 0.0, 0.1)
    colors[clr.CloseButtonHovered]     = ImVec4(0.0, 0.0, 0.0, 1.0)
    colors[clr.CloseButtonActive]      = ImVec4(0.0, 0.0, 0.0, 1.0)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.99)
end