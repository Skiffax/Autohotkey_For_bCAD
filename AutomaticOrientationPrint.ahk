secondsTip:=1
SetdefaultMouseSpeed 2

SetTitleMatchMode, RegEx
SetTitleMatchMode, slow
stringbCAD:="bCAD"
Stringbcadexe:="b[cC][aA][dD]\."
XImage:=0
YImage:=0
IDwindow:= WinExist("ahk_exe" Stringbcadexe)
WinGetTitle, namewindowbcad, ahk_id %IDwindow%
;MsgBox, %namewindowbcad% IDwindow %IDwindow%
bilo:=false
if (IDwindow<>0)
{
	;MsgBox, %namewindowbcad%
VtorayaPopitka:
	waittime:=10
	waittimewindow:=3
	SetTitleMatchMode, 2
	SetTitleMatchMode, Fast
	
	WinActivate, ahk_id %IDwindow%
	WinGet, nameProcessbCAD, ProcessName, A
	foundPos:=InStr(nameProcessbCAD,"bcad.4")
	if (foundPos=0)
		WinMenuSelectItem,ahk_id %IDwindow%,,����,������
	
	titleWindowWait:="���������"
	WinWait,%titleWindowWait%,,0.5
	if (ErrorLevel)
	{
		;MsgBox, error1 %bilo%
		if (bilo=false)
		{

			;MsgBox, nameProcessbCAD %nameProcessbCAD% foundPos %foundPos%
			if  (foundPos<>0) 
			{
				;MsgBox, if
			;���� � ��� bCAD3, �� ������� ��������� ������ �� 
				waittimeforbcad4:=50
				;MsgBox, Some problem with window %titleWindowWait%
				;sleep, waittimeforbcad4
				;WinActivate, ahk_id %IDwindow%
				SendInput, {Alt}
				sleep, waittimeforbcad4
				Send, f
				;WinActivate, ahk_id %IDwindow%
				sleep, waittimeforbcad4
				;SendInput, f
				sleep, waittimeforbcad4
				Send, p
				;sleep, waittimeforbcad4
				WinWait,%titleWindowWait%,,0.5
				if (ErrorLevel) ;���� ������, �� ������� ������ �����
				{
					Send, Esc
					sleep, waittimeforbcad4
					Send, Esc
					sleep, waittimeforbcad4
					Send, Esc
					sleep, waittimeforbcad4
					Send,!
					sleep, waittimeforbcad4
					Send, �
					sleep, waittimeforbcad4
					Send, �
				}
				;Send, {Enter}
				;sleep, waittimeforbcad4
			}
			else
			{
				;MsgBox, elses
				Send, {Alt}
				Send, {Right}
				Send, {Down}
				Send, {Esc}
				GoTo VtorayaPopitka
			}
			bilo:=true
		}
	}
	WinWait,%titleWindowWait%,,1
	WinActivate, %titleWindowWait%
	Sleep, waittime
	;MsgBox, %titleWindowWait%
	controlNeed:=findNameControl("����������")
	if (controlNeed=0)
	{
		MsgBox, ���������� �� �������
		controlNeed:="Button9" ;����������� ����������
	}
	ControlFocus, %controlNeed%, %titleWindowWait%
	if (ErrorLevel=1)
	{
		ControlGetText, OutputVar1,%controlNeed%
		
		MsgBox, Some problem with: %OutputVar1% (%controlNeed%) in Window %titleWindowWait%
		;Exit
	}
	Send {Space}
	
	;����������, ����� �� ��������� �������� �������
	
	
	;~ ControlGet, OutputVarControl, Hwnd,,,%titleWindowWait%,"�������"
	;~ MsgBox, %OutputVarControl%
	;~ ControlGet, OutputVarControl, Hwnd,,,%titleWindowWait%,"���&����"
	;~ MsgBox, %OutputVarControl%
	
	;���������� ����������
	
	controlKnizhnaya:=findNameControl("�������")
	if (controlKnizhnaya=0)
	{
		MsgBox, ������� �� �������
		controlKnizhnaya:="Button17"
	}
	controlNeed:=controlKnizhnaya ;����������� "�������"
	ControlFocus, %controlNeed%, %titleWindowWait%
	if (ErrorLevel=1)
	{
		ControlGetText, OutputVar1,%controlNeed%
		MsgBox, Some problem with: %OutputVar1% (%controlNeed%) in Window %titleWindowWait%
		Exit
	}
	Send {Space}
	;MsgBox, proverKnizhnaya
	
	
	orientationKnizhnaya:=0
	orientationAlbomnaya:=0
	
	controlMashtab:="Edit13" ;Edit �������
	Sleep, waittime
	ControlGetText, orientationKnizhnaya,%controlMashtab%
	
	
	controlAlbomnaya:=findNameControl("���������")
	if (controlAlbomnaya=0)
	{
		MsgBox, ��������� �� �������
		controlAlbomnaya:="Button17"
	}
	controlNeed:=controlAlbomnaya ;����������� "���������"
	ControlFocus, %controlNeed%, %titleWindowWait%
	if (ErrorLevel=1)
	{
		ControlGetText, OutputVar1,%controlNeed%
		MsgBox, Some problem with: %OutputVar1% (%controlNeed%) in Window %titleWindowWait%
		Exit
	}
	Send {Space}
	;MsgBox, proverAlbomnaya
	Sleep, waittime
	
	ControlGetText, orientationAlbomnaya,%controlMashtab%
	;MsgBox, %orientationKnizhnaya% %orientationAlbomnaya%
	if (orientationKnizhnaya>orientationAlbomnaya)
	{
		orientation:=controlKnizhnaya
	}
	else
	{
		orientation:=controlAlbomnaya
	}
	
	controlNeed:=orientation
	ControlFocus, %controlNeed%, %titleWindowWait%
	if (ErrorLevel=1)
	{
		ControlGetText, OutputVar1,%controlNeed%
		MsgBox, Some problem with: %OutputVar1% (%controlNeed%) in Window %titleWindowWait%
		Exit
	}
	Send {Space}
	
	
	controlNeed:=findNameControl("������")
	if (controlNeed=0)
		controlNeed:="Button19" ;������ ������
	ControlFocus, %controlNeed%, %titleWindowWait%
	;MsgBox, %ErrorLevel%
	if (ErrorLevel=1)
	{
		ControlGetText, OutputVar1,%controlNeed%
		MsgBox, Some problem with: %OutputVar1% (%controlNeed%) in Window %titleWindowWait%
		Exit
	}
	Send {Enter}0 0
	
	
	titleWindowWait:="������"
	WinWait,%titleWindowWait%,,waittimewindow
	WinActivate, %titleWindowWait%
	controlNeed:=findNameControl("��")
	if (controlNeed=0)
		controlNeed:="Button10" ;������ ��
	ControlFocus, %controlNeed%, %titleWindowWait%
	;MsgBox, %ErrorLevel%
	if (ErrorLevel=1)
	{
		ControlGetText, OutputVar1,%controlNeed%
		MsgBox, Some problem with: %OutputVar1% (%controlNeed%) in Window %titleWindowWait%
		Exit
	}
	
	Send {Enter}
	
	;����� �� �������
	secondsTip=1
	TrayTip , ������, �� ��, %secondsTip%
	secondsTip1:=secondsTip * 1000
	Sleep, %secondsTip1%

}
else
{
MsgBox, bCAD �� �������
}

findNameControl(findtextcontrol,caseSensitive:=false)
{
	HWNDactiveWindow:=WinActive("A")
	WinGetTitle, ooooo, ahk_id %HWNDactiveWindow%
	;MsgBox, activeWindow %ooooo%
	WinGet, OutputListControls, ControlList, ahk_id %HWNDactiveWindow%
	Loop, Parse, OutputListControls, `n
	{
		ControlGetText, ProverkaControlText, %A_LoopField%
		ProverkaControlText1:=StrReplace(ProverkaControlText,"&","")
		;MsgBox, %A_LoopField% | %ProverkaControlText% | %ProverkaControlText1%
		if (InStr(ProverkaControlText1,findtextcontrol))
		{
			return %A_LoopField%
		}		
	}
	return 0
}