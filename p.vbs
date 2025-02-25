'Yes I know, skid level "virus"
Set objShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

Set file = fso.CreateTextFile("./o.vbs", True)

file.WriteLine("MsgBox ""You have been hacked!"", vbCritical, ""Error""")

file.Close

For i = 1 To 10
	WScript.Sleep(90)
	objShell.Run "wscript ./o.vbs", 1, False
Next
For i = 1 To 3
	objShell.Run "https://shattereddisk.github.io/rickroll/rickroll.mp4"
Next
For i = 1 To 50
	WScript.Sleep(15)
	objShell.SendKeys("¯")
Next
