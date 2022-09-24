'MIT License
'
'Copyright (c) 2022 BASEL HMIDAN
'
'Permission is hereby granted, free of charge, to any person obtaining a copy
'of this software and associated documentation files (the "Software"), to deal
'in the Software without restriction, including without limitation the rights
'to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
'copies of the Software, and to permit persons to whom the Software is
'furnished to do so, subject to the following conditions:'
'
'The above copyright notice and this permission notice shall be included in all
'copies or substantial portions of the Software.
'
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
'OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
'SOFTWARE.
'

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
