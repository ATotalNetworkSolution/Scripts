REM This script will force the re-registry of DLLs and have the target computer check in with the WSUS Sever
REM =========================================================================================
REM Ver 1.0 2009-02-05
REM Written by Randy Dover, A-Total Network Solution, randy.dover @ atotalnetworksolution.com
REM Script may be modified, but credit may not be removed
REM =========================================================================================

REM you will need to put the name of your WSUS server in the code below in place of WSUSServerName

net stop wuauserv
net stop bits
c:
cd \windows
regsvr32 msxml3.dll
regsvr32 msxml3.dll
regsvr32 wuapi.dll
regsvr32 wuaueng.dll
regsvr32 wuaueng1.dll
regsvr32 wucltui.dll
regsvr32 wups.dll
regsvr32 wups2.dll
regsvr32 wuweb.dll
Del windowsupdate.log
ren softwaredistribution softwaredistribution.old

REM Change "WSUSServerName" in the next two lines to the name of your WSUS Server
REG ADD HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate /v WUServer /d "http://WSUSServerName:8530" /f
REG ADD HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate /v WUStatusServer /d "http://WSUSServerName:8530" /f

REG ADD HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU /v UseWUServer /t REG_DWORD /d 1 /f
REG ADD HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /t REG_DWORD /d 3 /f
REG ADD HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /t REG_DWORD /d 0 /f
REG ADD HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU /v ScheduledInstallDay /t REG_DWORD /d 0 /f
REG ADD HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU /v ScheduledInstallTime /t REG_DWORD /d 03 /f
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUState /t REG_DWORD /d 2 /f
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 3 /f
pause

net start wuauserv
%windir%\system32\wuauclt.exe /detectnow
%windir%\system32\wuapp.exe
