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


SetTitleMatchMode, 2

; Include scripts
#Include %A_ScriptDir%\AHK\scripts\utils\HyperWindowSnap.ahk
#Include %A_ScriptDir%\AHK\scripts\hotstrings.ahk
#Include %A_ScriptDir%\AHK\scripts\apps_shortcuts.ahk
#Include %A_ScriptDir%\AHK\scripts\windows_management.ahk
