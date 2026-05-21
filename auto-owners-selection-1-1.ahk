#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Screen

; Base coordinates are designed for 1920x1080 and scaled to the selected resolution.
global scaleX := 2.0
global scaleY := 2.0
global resLabel := "4K (3840x2160)"

ShowResolutionMenu()
return

ShowResolutionMenu() {
    Gui, ResSel:New, +AlwaysOnTop +OwnDialogs, NTE Auto Owner's Selection - Resolution
    Gui, ResSel:Font, s10, Segoe UI
    Gui, ResSel:Add, Text, x20 y15 w320, Select your in-game resolution (fullscreen):
    Gui, ResSel:Add, Button, x20 y45 w320 h36 gSet1080p, 1080p  (1920 x 1080)
    Gui, ResSel:Add, Button, x20 y90 w320 h36 gSet2K,    2K  (2560 x 1440)
    Gui, ResSel:Add, Button, x20 y135 w320 h36 Default gSet4K, 4K  (3840 x 2160)
    Gui, ResSel:Add, Text, x20 y180 w320, After selecting, press P to run 34 iterations.
    Gui, ResSel:Show, w360 h210
}

Set1080p:
    scaleX := 1.0
    scaleY := 1.0
    resLabel := "1080p (1920x1080)"
    Gui, ResSel:Destroy
    TrayTip, NTE Auto Owner's Selection, Selected %resLabel%`nPress P to start, 3
    return

Set2K:
    scaleX := 2560 / 1920
    scaleY := 1440 / 1080
    resLabel := "2K (2560x1440)"
    Gui, ResSel:Destroy
    TrayTip, NTE Auto Owner's Selection, Selected %resLabel%`nPress P to start, 3
    return

Set4K:
    scaleX := 3840 / 1920
    scaleY := 2160 / 1080
    resLabel := "4K (3840x2160)"
    Gui, ResSel:Destroy
    TrayTip, NTE Auto Owner's Selection, Selected %resLabel%`nPress P to start, 3
    return

ResSelGuiClose:
ResSelGuiEscape:
    ExitApp

Click(x, y) {
    global scaleX, scaleY
    MouseClick, left, % Round(x * scaleX), % Round(y * scaleY)
}

p::
Loop, 34
{
    Send, f
    Sleep, 1500
    Click(1725, 1009)
    Sleep, 5700
    Click(756, 997)
    Sleep, 700
    Click(985, 994)
    Sleep, 2000
    Click(160, 977)
    Sleep, 700
    Click(658, 793)
    Sleep, 700
    Click(408, 645)
    Sleep, 2000
    Click(1260, 976)
    Sleep, 700
    Click(1007, 641)
    Sleep, 700
    Click(133, 778)
    Sleep, 7000
    Click(235, 646)
    Sleep, 1000
    Click(49, 62)
    Sleep, 1500
    Click(1165, 830)
    Sleep, 1500
}
return
