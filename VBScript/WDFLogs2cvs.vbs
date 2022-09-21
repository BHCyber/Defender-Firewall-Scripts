logFilePath = Wscript.Arguments.Item(0)
csvFilePath = Wscript.Arguments.Item(1)
csvAppend = Wscript.Arguments.Item(2)

Set dicLine = CreateObject("Scripting.Dictionary")
Set fso = CreateObject("Scripting.FileSystemObject")
Set logFile = fso.OpenTextFile(logFilePath,1)

csvHeader = "date,time,action,protocol,src-ip,dst-ip,src-port,dst-port,size,tcpflags,tcpsyn,tcpack,tcpwin,icmptype,icmpcode,info,path,pid"
counter = 0

Do Until logFile.AtEndOfStream
  
  logLine = logFile.Readline
  
  IF counter > 5 Then
	dicLine.Add counter, Replace(logLine," ",",") 
  End IF
  
  counter = counter + 1
  
Loop

logFile.Close

  IF StrComp(csvAppend,"1") = 0 Then
	
	Set csvFileAppend = fso.OpenTextFile(csvFilePath,8,True)
	
	For Each logLine in dicLine.Items
		csvFileAppend.Write logLine & vbCrLf
	Next
	
	csvFileAppend.Close
	
  Else
	
	Set csvFileNew = fso.CreateTextFile(csvFilePath,True)
	
	csvFileNew.Write csvHeader & vbCrLf
	
	For Each logLine in dicLine.Items
		csvFileNew.Write logLine & vbCrLf
	Next
	
	csvFileNew.Close
	
  End IF


WScript.Quit 0