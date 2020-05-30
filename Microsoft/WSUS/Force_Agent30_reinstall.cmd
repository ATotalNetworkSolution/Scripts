REM This script will force the re-install of WSUS agent 3.0
REM =========================================================================================
REM Ver 1.0 2009-02-04
REM Written by Randy Dover, A-Total Network Solution, randy.dover @ atotalnetworksolution.com
REM Script may be modified, but credit may not be removed
REM =========================================================================================
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:32BIT
net stop wuauserv
REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v LastWaitTimeout /f
REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v DetectionStartTime /f
Reg Delete "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v NextDetectionTime /f
rd c:\windows\softwaredistribution /S /Q
\\ServerName\ShareName\Folder\Subfolder\windowsupdateagent-7.6-x86.exe /wuforce /quiet
net start wuauserv

GOTO END

:64BIT
net stop wuauserv
pause
REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v LastWaitTimeout /f
pause
REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v DetectionStartTime /f
pause
Reg Delete "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v NextDetectionTime /f
pause
rd c:\windows\softwaredistribution /S /Q
\\ServerName\ShareName\Folder\Subfolder\windowsupdateagent-7.6-x64.exe /wuforce /quiet
pause
net start wuauserv

GOTO END

:END
Exit
