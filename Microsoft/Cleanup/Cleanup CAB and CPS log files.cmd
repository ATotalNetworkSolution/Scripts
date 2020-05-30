REM  This batch file deletes CAB and CPS log files filling up temporary storage caused by Trusted Installed and Windows Update services.
REM =========================================================================================
REM Ver 1.0 2017-05-16
REM Written by Randy Dover, A-Total Network Solution, randy.dover @ atotalnetworksolution.com
REM Script may be modified, but credit may not be removed
REM =========================================================================================

REM  Stop Windows Update Service
net stop wuauserv

REM  Stop Windows Module Installer
net stop TrustedInstaller

REM  Delete all files/folders WITHIN Temp directory
del /f/s/q C:\Windows\Temp > nul
rmdir /s/q C:\Windows\Temp
md c:\Windows\Temp

REM pause

REM  Rename Folder
cd C:\Windows
Ren  SoftwareDistribution SoftwareDistribution.old

REM  Wait 5 seconds (User can't skip)
timeout /t 5 /nobreak

REM  Delete Folder
RD /S /Q "C:\Windows\SoftwareDistribution.old"

REM pause

REM  Wait 5 seconds (User can't skip)
timeout /t 5 /nobreak

REM  Delete all files/folders WITHIN CBS directory
del /f/s/q C:\Windows\Logs\CBS > nul
rmdir /s/q C:\Windows\Logs\CBS
md C:\Windows\Logs\CBS

rem pause

REM  Wait 5 seconds (User can't skip)
timeout /t 5 /nobreak

REM  Start Windows Update Service
net start wuauserv

REM  Start Windows Module Installer
net start TrustedInstaller

REM  Query the WSUS server for its needed patches
wuauclt.exe /detectnow

REM  Display Text
echo.
echo.
echo.
echo   CAB and Log files have been deleted.
echo.
echo.

REM The next line will pause the script to check the status
pause
