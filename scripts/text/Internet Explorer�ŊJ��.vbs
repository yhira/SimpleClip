Function EditText(s)
	Set WshShell = CreateObject("WScript.Shell")
	Call WshShell.Run( chr(&H22) & "C:\Program Files\Internet Explorer\iexplore.exe" & chr(&H22) & " " & chr(&H22) & s & chr(&H22) )

	EditText =  ""
End Function
