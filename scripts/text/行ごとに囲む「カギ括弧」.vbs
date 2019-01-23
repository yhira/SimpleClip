Function EditText(s)
	Dim aryStrings
	Dim strRes, strLF

	aryStrings = Split(s, vbCrLf)
	For lngLoop = 0 To UBound(aryStrings)
		If lngLoop = UBound(aryStrings) Then
			strLF = ""
		Else
			strLF = vbCrLf
		End If
	    strRes = strRes & "Åu" & aryStrings(lngLoop) & "Åv" & strLF
	Next

	EditText = strRes
End Function