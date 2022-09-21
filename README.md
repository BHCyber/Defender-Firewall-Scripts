# Windows Defender Firewall Scripts
Misc. scripts to perform activities for Windows Defender Firewall.

A collection of scripts useful for: 
1. CyberSecurity Threat Hunters and and incident responder to ease the investigation of the activities.
2. SecOps to ease some managment activities.
3. Automation of activities via SOAR.
4. Enriching of EDR respones scripts library. 


List of scripts:
1.WDFLogs2cvs.vbs
- Description: Transfer the log file of the Windows Defnder Firewall to CSV file with header
- Args in Order:
  - String: Windows Firewall Log File Path 
  - String: CSV Output File Path" 
  - Integer: 0 = Create New File or 1 = Apped To Existing File
- Example: WDFLogs2cvs.vbs "C:\Windows\System32\LogFiles\Firewall\pfirewall.log" "D:\outputFolder\output.csv" 0
