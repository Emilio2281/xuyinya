script_name("AutoCaptcha")
script_authors("t1ckz")
script_dependencies("CLEO")
require "lib.moonloader"
local sampev = require 'lib.samp.events'
require "lib.sampfuncs"
local key = require 'vkeys'

local valuecap = 22
function main()
sampfuncsLog("AutoCaptcha. verison: 0.1(���������: "..valuecap.." ����)")
end

function sampev.onShowDialog(dialogId, style, caption, b1, b2,text)
--sampfuncsLog(text)
if string.find(text, "� ����� ���� �� ������ �������?") then -- 22 �����
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} GTA SAMP(3)",0xFFFFFF)
end
if string.find(text, "�������� ����� 15") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 2) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} 15(2)",0xFFFFFF)
end
if string.find(text, "����� ������ ���?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 1) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} 2018(1)",0xFFFFFF)
end
if string.find(text, "����� ����� ���� ��� ����� ����?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 1) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} �����(1)",0xFFFFFF)
end
if string.find(text, "�� ����� ������� �� ������ �������?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 1) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} Emerald(1)",0xFFFFFF)
end
if string.find(text, "������� ���� � ����� TANYA") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 4) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} 5(4)",0xFFFFFF)
end
if string.find(text, "������� ���� � ����� ROMEO") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} 5(3)",0xFFFFFF)
end
if string.find(text, "��� ����� GTA SAMP?") then
sampSendDialogResponse(673, 1, 0, 4) 
enableDialog(true)
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} ����(4)",0xFFFFFF)
end
if string.find(text, "��� ����� ������ ���������?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} ����(3)",0xFFFFFF)
end
if string.find(text, "������ ����� �����?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} �������(3)",0xFFFFFF)
end
if string.find(text, "��� ���������� �������?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 2) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} ������(2)",0xFFFFFF)
end
if string.find(text, "��� ������ ������� ������ �����?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 2) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} �����(2)",0xFFFFFF)
end
if string.find(text, "������� ������ �� ���� �������?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 1) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} ����(1)",0xFFFFFF)
end
if string.find(text, "������� ����� ����� � ����� ���?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 2) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} 24(2)",0xFFFFFF)
end
if string.find(text, "�������� ����� ���") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} ���(3)",0xFFFFFF)
end
if string.find(text, "���������� ����� �� ������ 2 ���� �����?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 4) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} 8(4)",0xFFFFFF)
end
if string.find(text, "�� ��� ������?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 1) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} �� ������(1)",0xFFFFFF)
end
if string.find(text, "��� ����� ������� ���������� ���?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} �������(3)",0xFFFFFF)
end
if string.find(text, "� ������� ���� ����� �������� �������?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} � ������� ���(3)",0xFFFFFF)
end
if string.find(text, "��� ������ �� ������?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 2) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} ������(2)",0xFFFFFF)
end
if string.find(text, "������� ����� ��� ���� ����?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 2) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} 7(2)",0xFFFFFF)
end
if string.find(text, "���������� ����� �� ������ 6 ����� 3?") then
enableDialog(true)
sampSendDialogResponse(673, 1, 0, 3) 
sampCloseCurrentDialogWithButton(0)
sampAddChatMessage("����� ��� ������ � ����:{007dff} 3(3)",0xFFFFFF)
end
end

function enableDialog(bool)
    local memory = require 'memory'
    memory.setint32(sampGetDialogInfoPtr()+40, bool and 1 or 0, true)
    sampToggleCursor(bool)
end 