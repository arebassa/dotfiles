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


; Snap to corners for diagonals, or top, bottom, left, right of screen (Landscape)
!^+#j::SnapActiveWindow("top","left","full")
!^+#l::SnapActiveWindow("top","right","full")
!^+#,::SnapActiveWindow("bottom","full","half")
!^+#i::SnapActiveWindow("top","full","half")

; Snap in quarters 
!^+#u::SnapActiveWindow("top","left","half")
!^+#o::SnapActiveWindow("top","right","half")
!^+#m::SnapActiveWindow("bottom","left","half")
!^+#.::SnapActiveWindow("bottom","right","half")


; Hyper + k: Maximize current window
!^+#k::MaximizeOrCenterActiveWindow("")
return


; Shrink window
!^+2::shrinkActiveWindow("halftopleft")