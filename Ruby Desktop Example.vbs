Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
WshShell.Run chr(34) & "start.cmd" & Chr(34), 0
Set WshShell = Nothing