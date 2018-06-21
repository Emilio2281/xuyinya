local sampev 		= require 'lib.samp.events'
local memory 		= require "memory"
local ScriptState 	= false

function main()
	if not isSampLoaded() and not isSampfuncsLoaded then return end
	while not isSampAvailable() do wait(0) end
	sampRegisterChatCommand('bbot', Activate)
	wait(-1)
end

function sampev.onShowDialog(id, style, title, btn, btn, text)
	if title:find('Материалы') and ScriptState then
		for line in text:gmatch('[^\r\n]+') do
			if not line:find('100%%') then
				_, num = line:match('{(.-)}(%d+)')
				sampSendDialogResponse(id, 1, num-1, '')
				return false
			end
		end
	end
end

function Activate()
	ScriptState = not ScriptState
	if ScriptState then
		sampAddChatMessage('{FB7B1F}[BUILDERBOT]: {FFFFFF}Скрипт активирован.', -1)
		setCharCoordinates(playerPed, 1481.1748,-1349.2417,113.1293+0.2)
	else
		sampAddChatMessage('{FB7B1F}[BUILDERBOT]: {FFFFFF}Скрипт дективирован.', -1)
	end
end

function sampev.onSetCheckpoint(Coordinates, Radius)
	if ScriptState then
		setCharCoordinatesNoOffset(playerPed, Coordinates.x, Coordinates.y, Coordinates.z+0.2)
	end
end
