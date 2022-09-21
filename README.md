# Windows Defender Firewall Scripts
Misc. scripts to perform activities for Windows Defender Firewall.

A collection of scripts useful for: 
1. CyberSecurity Threat Hunters and and incident responder to ease the investigation of the activities.
2. SecOps to ease some managment activities.
3. Automation of activities via SOAR.
4. Enriching of EDR respones scripts library. 


List of scripts:

| Script Name | Language | Description | Args | Example|
| ------------|:--------:| -----------:| ----:| ------:|
| WDFLogs2cvs.vbs | VBScript | Transfer the log file of the Windows Defnder Firewall to CSV file with header | WDFLogs2cvs.vbs "WindowsFirewallLogFilePath" "CSVOutputFilePath" [0 = CreateNewFile | 1 = AppedToExistingFile] | WDFLogs2cvs.vbs "C:\Windows\System32\LogFiles\Firewall\pfirewall.log" "D:\outputFolder\output.csv" 0
