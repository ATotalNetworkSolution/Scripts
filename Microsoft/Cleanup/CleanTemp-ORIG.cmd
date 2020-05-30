@echo off
REM This script removes Temp files from different locations
REM =========================================================================================
REM Ver 1.0 2017-09-25
REM Written by Randy Dover, A-Total Network Solution, randy.dover @ atotalnetworksolution.com
REM Script may be modified, but credit may not be removed
REM =========================================================================================

copy "%windir%\temp"\patch_deploy_demo.txt c:\installs\microsoft

REM IF EXIST c:\windows\temp\ del /f /s /q c:\windows\temp\

DEL /f /s /q %temp%\

REM del /f /s /q C:\Users\%username%\AppData\Local\Temp\*.*
del /f /s /q C:\Users\Will.Barnes\AppData\Local\GoToMeeting
pause
REM del /f /s /q C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent Items\*.*

del /f /s /q C:\Windows\Temp\*.*


IF EXIST "C:\Users\" (
    for /D %%x in ("C:\Users\*") do ( 
        del /f /s /q "%%x\AppData\Local\Temp\" 
        del /f /s /q "%%x\AppData\Local\Microsoft\Windows\Temporary Internet Files\" 
    )
)
copy c:\installs\microsoft\patch_deploy_demo.txt "%windir%\temp"\
