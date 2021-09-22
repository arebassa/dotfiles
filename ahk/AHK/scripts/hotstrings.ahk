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



:c:typecb::
clip := Clipboard ; 
Loop, Parse, clip, ,  ; Loop through the backup
{
	Transform, OutputVar, Asc, %A_LoopField%
	Send, {ASC %OutputVar%}
}
return

:c:sumamry::
SendInput summary
return

:c:td::
FormatTime, CurrentDateTime,, yyyyMMdd
SendInput %CurrentDateTime%
return

:c:TD::
FormatTime, CurrentDateTime,, dd'/'MM'/'yyyy
SendInput %CurrentDateTime%
return

:c:ttd::
FormatTime, CurrentDateTime,, yyyyMMddHHmmss
SendInput %CurrentDateTime%
return

:c:TTD::
FormatTime, CurrentDateTime,, dd/MM/yyyy HH:mm:ss
SendInput %CurrentDateTime%
return 

::@tard::
Sleep, 100
FormatTime, CurrentDateTime,, yyyyMMddHHmmss
InputBox, directory, Create a new tarball, What would you like to tar?,,400,125
InputBox, tarball, Create a new tarball, Name of the tar file?,,400,125,,,,,%directory%
SendInput tar -cvjf %CurrentDateTime%-%tarball%.tar.bz2 %directory%
return

::@for::
Sleep, 100
InputBox, command, For bucle, What command would you like to execute?,,400,125
InputBox, action, Action to execute, What action would you like to execute on each command result?,,400,125
SendInput for i in $(%command%); do %action% $i; done
return

::@awk::
Sleep, 100
InputBox, fn, AWK Fields numbers, File name to process?,,400,125
InputBox, fs, AWK Fields numbers, Field separator used?,,400,125
SendRaw head -n1 %fn% | awk 'BEGIN`{FS ="%fs%"} {for(i=1;i<=NF;i++){sub(/^[ \t\r\n]+/, "", $i); sub(/[ \t\r\n]+$/, "", $i); $i = i ": " $i; print $i}}'
return

::mvk::
FormatTime, CurrentDateTime,, yyyyMMdd
SendInput {BS}{{},.%CurrentDateTime%{}}{Home}mv {End}
return

::cpk::
FormatTime, CurrentDateTime,, yyyyMMdd
SendInput {BS}{{},.%CurrentDateTime%{}}{Home}cp {End}
return

::cpdk::
FormatTime, CurrentDateTime,, yyyyMMdd
SendInput {BS}{{},.%CurrentDateTime%{}}{Home}cp -r {End}
return

::!c::
SendInput pumtur52{!}Costaisa2025
return

::!spre::
SendInput IzG0l2022.,**
return

::!rpre::
SendInput M0k2o21.,--
return

::!spro::
SendInput IzG0l2021.,--
return

::!rpro::
SendInput M0k2o28.,**
return
