/**
 * Hyper Window Snap
 * Hyper Window Snap is an AutoHotkey script for moving and resizing windows to into quadrants, especially useful for 4k monitors.
 * Based on Advanced Window Snap by Andrew Moore.
 *
 * @author Andrew Moore <andrew+github@awmoore.com>
 * @author Jeff Axelrod <jeff+github@theaxelrods.com>
 * @version 1.0
 */
 
/**
 * SnapActiveWindow resizes and moves (snaps) the active window to a given position.
 * @param {string} winPlaceVertical   The vertical placement of the active window.
 *                                    Expecting "bottom" or "middle", otherwise assumes
 *                                    "top" placement.
 * @param {string} winPlaceHorizontal The horizontal placement of the active window.
 *                                    Expecting "left" or "right", otherwise assumes
 *                                    window should span the "full" width of the monitor.
 * @param {string} winSizeHeight      The height of the active window in relation to
 *                                    the active monitor's height. Expecting "half" size,
 *                                    otherwise will resize window to a "third".
 */
 
SplitSnapActiveWindow(winPlaceVertical, winPlaceHorizontal, winSizeHeight) {
  oldClipboard = clipboardAll
  clipboard =
  while(clipboard == "") {
    SendInput ^l^c
  }
  SendInput ^w^n
  WinWaitNotActive
  SendInput %clipboard%{enter}
  clipboard := %oldClipboard%
	SnapActiveWindow(winPlaceVertical, winPlaceHorizontal, winSizeHeight)
}

SnapActiveWindow(winPlaceVertical, winPlaceHorizontal, winSizeHeight) {
    heightOffset := 7
    widthOffset := 0
    xOffset := 0
    
    activeWin := WinExist("A")
    activeMon := GetMonitorIndexFromWindow(activeWin)
		WinGet, MinMaxState, MinMax, A
		If (MinMaxState) {
			WinRestore, A
			
		}
	
    SysGet, MonitorWorkArea, MonitorWorkArea, %activeMon%

    if (winSizeHeight == "half") {
        height := (MonitorWorkAreaBottom - MonitorWorkAreaTop)/2 + heightOffset
    } else if (winSizeHeight == "full") {
        height := (MonitorWorkAreaBottom - MonitorWorkAreaTop) + heightOffset
	} else if (winSizeHeight == "third") {
        height := (MonitorWorkAreaBottom - MonitorWorkAreaTop)/3
    }

    if (winPlaceHorizontal == "left") {
        posX  := MonitorWorkAreaLeft - xOffset
        width := (MonitorWorkAreaRight - MonitorWorkAreaLeft)/2 + widthOffset
    } else if (winPlaceHorizontal == "right") {
        posX  := MonitorWorkAreaLeft + (MonitorWorkAreaRight - MonitorWorkAreaLeft)/2 - xOffset
        width := (MonitorWorkAreaRight - MonitorWorkAreaLeft)/2 + widthOffset
    } else {
        posX  := MonitorWorkAreaLeft - xOffset
        width := MonitorWorkAreaRight - MonitorWorkAreaLeft + widthOffset
    }

    if (winPlaceVertical == "bottom") {
        posY := MonitorWorkAreaBottom - height + heightOffset
    } else if (winPlaceVertical == "middle") {
        posY := MonitorWorkAreaTop + height
    } else {
        posY := MonitorWorkAreaTop
    }
	
    WinMove,A,,%posX%,%posY%,%width%,%height%
}

shrinkActiveWindow(command) {
	WinGet activeWin, ID, A
	activeMon := GetMonitorIndexFromWindow(activeWin)

	SysGet, MonitorWorkArea, MonitorWorkArea, %activeMon%
	WinGetPos, posX, posY, width, height, A

	if (command == "halfbottom") {
		height := height/2
		posY := posY + height
	}
   if (command == "halftop") {
      height := height/2
   }
   if (command == "halfright") {
      width := width/2
		posX := posX + width
	}
   if (command == "halfleft") {
      width := width/2
   }
   if (command == "halftopleft") {
      height := height/2
      width := width/2
   }
   if (command == "halftopright") {
      height := height/2
      width /= 2
		posX := posX + width
   }

   WinMove,A,,%posX%,%posY%,%width%,%height%
}

max(x,y) 
{
return x > y ? x : y
}

min(x,y) 
{
return x < y ? x : y
}

activateWindow(num) {
	WinGet activeWin, ID, A
	activeMon := GetMonitorIndexFromWindow(activeWin)
	SysGet, MonitorWorkArea, MonitorWorkArea, %activeMon%
	CoordMode, Mouse, Screen
	Switch num {
		Case 7:
			MouseMove MonitorWorkAreaRight / 4, MonitorWorkAreaBottom / 4, 0
		Case 8:
			MouseMove MonitorWorkAreaRight / 2, MonitorWorkAreaBottom / 4, 0
		Case 9:
			MouseMove 3 * MonitorWorkAreaRight / 4, MonitorWorkAreaBottom / 4, 0
		Case 4:
			MouseMove MonitorWorkAreaRight / 4, MonitorWorkAreaBottom / 2, 0
		Case 6:
			MouseMove 3 * MonitorWorkAreaRight / 4, MonitorWorkAreaBottom / 2, 0
		Case 1:
			MouseMove MonitorWorkAreaRight / 4, 3 * MonitorWorkAreaBottom / 4, 0
		Case 2:
			MouseMove MonitorWorkAreaRight / 2, 3 * MonitorWorkAreaBottom / 4, 0
		Case 3:
			MouseMove 3 * MonitorWorkAreaRight / 4, 3 * MonitorWorkAreaBottom / 4, 0
	}
	Sleep, 100
	MouseGetPos,,, hwnd 
	WinActivate, ahk_id %hwnd%
}

moveActiveWindow(command) {
    WinGet activeWin, ID, A
    activeMon := GetMonitorIndexFromWindow(activeWin)

    SysGet, MonitorWorkArea, MonitorWorkArea, %activeMon%
	 WinGetPos, posX, posY, width, height, A

   if (command == "moveup" || command == "moveupright" || command == "moveupleft") && (posY - height >= 0) {
		  posY := posY - height
	}
   if (command == "movedown" || command = "movedownright" || command = "movedownleft") && (posY + height * 2 <= MonitorWorkAreaBottom) {
		  posY := posY + height
	}
   if (command == "moveright" || command == "moveupright" || command == "movedownright") && (posX + width * 2 <= MonitorWorkAreaRight) {
		  posX := posX + width
	}
	if (command == "moveleft" || commmand == "moveupleft" || command == "movedownleft") && (posX - height >= 0) {
		  posX := posX - width
	}

    WinMove,A,,%posX%,%posY%,%width%,%height%
}

/**
 * GetMonitorIndexFromWindow retrieves the HWND (unique ID) of a given window.
 * @param {Uint} windowHandle
 * @author shinywong
 * @link http://www.autohotkey.com/board/topic/69464-how-to-determine-a-window-is-in-which-monitor/?p=440355
 */
GetMonitorIndexFromWindow(windowHandle) {
    ; Starts with 1.
    monitorIndex := 1

    VarSetCapacity(monitorInfo, 40)
    NumPut(40, monitorInfo)

    if (monitorHandle := DllCall("MonitorFromWindow", "uint", windowHandle, "uint", 0x2))
        && DllCall("GetMonitorInfo", "uint", monitorHandle, "uint", &monitorInfo) {
        monitorLeft   := NumGet(monitorInfo,  4, "Int")
        monitorTop    := NumGet(monitorInfo,  8, "Int")
        monitorRight  := NumGet(monitorInfo, 12, "Int")
        monitorBottom := NumGet(monitorInfo, 16, "Int")
        workLeft      := NumGet(monitorInfo, 20, "Int")
        workTop       := NumGet(monitorInfo, 24, "Int")
        workRight     := NumGet(monitorInfo, 28, "Int")
        workBottom    := NumGet(monitorInfo, 32, "Int")
        isPrimary     := NumGet(monitorInfo, 36, "Int") & 1

        SysGet, monitorCount, MonitorCount

        Loop, %monitorCount% {
            SysGet, tempMon, Monitor, %A_Index%

            ; Compare location to determine the monitor index.
            if ((monitorLeft = tempMonLeft) and (monitorTop = tempMonTop)
                and (monitorRight = tempMonRight) and (monitorBottom = tempMonBottom)) {
                monitorIndex := A_Index
                break
            }
        }
    }

    return %monitorIndex%
}


MaximizeOrCenterActiveWindow(command)  {
	WinGet activeWin, ID, A
	WinGet,WinState,MinMax, A
	
	activeMon := GetMonitorIndexFromWindow(activeWin)
	SysGet, MonitorWorkArea, MonitorWorkArea, %activeMon%
	WinGetPos, posX, posY, width, height, A
	
	
	heightOffset := 7
    widthOffset := 15
    xOffset := 7
	
	max_height := (MonitorWorkAreaBottom - MonitorWorkAreaTop) + heightOffset
	max_width := MonitorWorkAreaRight - MonitorWorkAreaLeft + widthOffset

	
	if( width == max_width && height == max_height && posX == 0 && posY == 0)
	{
		WinMove,A,,(A_ScreenWidth/2)-(A_ScreenWidth/4), (A_ScreenHeight/2)-(A_ScreenHeight/4),A_ScreenWidth/2,A_ScreenHeight/2
	}
	else{
		WinMove,A,,0, 0, max_width, max_height
	}
}