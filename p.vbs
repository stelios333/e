'Yes I know, skid level "virus"
Set objShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

' Get the user's profile folder path
profilePath = objShell.ExpandEnvironmentStrings("%USERPROFILE%")

fileName = "o.vbs"
filePath = fso.BuildPath(profilePath, fileName)
Set file = fso.CreateTextFile(filePath, True)

file.WriteLine("MsgBox ""You have been hacked!"", vbCritical, ""Error""")

file.Close

For i = 1 To 10
	WScript.Sleep(90)
	objShell.Run "wscript "+filePath, 1, False
Next
For i = 1 To 3
	objShell.Run "https://shattereddisk.github.io/rickroll/rickroll.mp4"
Next
For i = 1 To 50
	WScript.Sleep(15)
	objShell.SendKeys("¯")
Next
