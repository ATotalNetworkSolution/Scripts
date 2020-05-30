@echo off
REM This script cleans Temp files
REM =========================================================================================
REM Ver 1.0 2017-09-25
REM Written by Randy Dover, A-Total Network Solution, randy.dover @ atotalnetworksolution.com
REM Script may be modified, but credit may not be removed
REM =========================================================================================

copy "%windir%\temp\patch_deploy_demo.txt" c:\installs\microsoft

REM IF EXIST c:\windows\temp\ del /f /s /q c:\windows\temp\

DEL /f /s /q %temp%\

REM del /f /s /q C:\Users\%username%\AppData\Local\Temp\*.*
del /f /s /q C:\Users\%username%\AppData\Local\GoToMeeting
rd /s /q C:\Users\%username%\AppData\Local\GoToMeeting
pause
REM del /f /s /q C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent Items\*.*
pause
forfiles /p "C:\Users\will.barnes\AppData\Local\Microsoft\Windows\WER\ReportQueue" /s /m *.* /C "cmd /c del /Q @path"
rem forfiles /p "%%x\AppData\Local\Microsoft\Windows\WER\ReportQueue" /s /m *.* /C "cmd /c del /Q @path"
pause

REM del /f /s /q C:\Windows\Temp\*.*


REM IF EXIST "C:\Users\" (
REM     for /D %%x in ("C:\Users\*") do ( 
REM         del /f /s /q "%%x\AppData\Local\Temp\" 
REM         del /f /s /q "%%x\AppData\Local\Microsoft\Windows\Temporary Internet Files\" 
REM     )
REM )
copy c:\installs\microsoft\patch_deploy_demo.txt "%windir%\temp"\
pause
