@echo off
REM This section clears the C:\Windows\Temp folder
REM =========================================================================================
REM Ver 1.0 2017-12-13
REM Written by Randy Dover, A-Total Network Solution, randy.dover @ atotalnetworksolution.com
REM Script may be modified, but credit may not be removed
REM =========================================================================================

copy "%windir%\temp\patch_deploy_demo.txt" c:\installs\microsoft
IF EXIST c:\windows\temp\ del /f /s /q c:\windows\temp\
md C:\Windows\Temp
copy c:\installs\microsoft\patch_deploy_demo.txt "%windir%\temp"\

forfiles /p "\inetpub\logs\LogFiles" /s /m *.* /D -5 /C "cmd /c del /Q@path"

REM pause

REM This section clears select \Users\AppData\Local folder
IF EXIST "C:\Users\" (
  for /D %%x in ("C:\Users\*") do (               
    forfiles /p "%%x\AppData\Local\Temp" /s /m *.* /D -7 /C "cmd /c del /Q @path"
    forfiles /p "%%x\AppData\Local\Microsoft\Windows\Temporary Internet Files" /s /m *.* /D -7 /C "cmd /c del /Q @path"
    forfiles /p "%%x\AppData\Local\Microsoft\Windows\WER" /s /m *.* /D -3 /C "cmd /c del /Q @path"
    rd /s /q "%%x\AppData\Local\Microsoft\Windows\WER"
    rd /s /q "%%x\AppData\Local\Microsoft\Windows\INetCache\IE"
    rd /s /q "%%x\AppData\Local\GoToMeeting"
  )
)

REM The following is a pause command that allows you to see the effects of the clean script, it is REMd out so this script can be run as a scheduled task.
REM pause
