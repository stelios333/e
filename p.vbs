'Yes I know, skid level "virus"
Set objShell = CreateObject("WScript.Shell")
For i = 1 To 10
	WScript.Sleep(90)
	objShell.Run "mshta vbscript:MsgBox(""You have been hacked!"",16,""Error"")(window.close)", 1, False
Next
For i = 1 To 3
	objShell.Run "https://shattereddisk.github.io/rickroll/rickroll.mp4"
Next
