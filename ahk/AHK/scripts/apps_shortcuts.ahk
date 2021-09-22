#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;================================
;============HOT KEYS============
;================================
; !    = alt
; ^    = ctrl
; +    = shift
; #    = win
;
; !^+  = Meh
; !^+# = Hyper



#IfWinActive ahk_exe chrome.exe
!l::Send, {Ctrl Down}{PgDn}{Ctrl Up}
!h::Send, {Ctrl Down}{PgUp}{Ctrl Up}
#IfWinActive

!^+e::
 WinActivate, ahk_exe explorer.EXE
 return

!^+t::
#If, WinActive("ahx_exe explorer.EXE")
  WinActivate, ahk_exe WindowsTerminal.exe
  return
#If