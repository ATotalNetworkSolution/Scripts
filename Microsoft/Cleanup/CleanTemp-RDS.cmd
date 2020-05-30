@echo off
copy "%windir%\temp\patch_deploy_demo.txt" c:\installs\microsoft

REM IF EXIST c:\windows\temp\ del /f /s /q c:\windows\temp\

DEL /f /s /q %temp%\

REM del /f /s /q C:\Users\%username%\AppData\Local\Temp\*.*
del /f /s /q C:\Users\%username%\AppData\Local\GoToMeeting
rd /s /q C:\Users\%username%\AppData\Local\GoToMeeting
REM del /f /s /q C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent Items\*.*

forfiles /p "C:\Users\stephanie.buscemi\AppData\Local\Microsoft\Windows\WER\ReportQueue" /s /m *.* /C "cmd /c del /Q @path"

echo cache
    forfiles /p "C:\Users\stephanie.buscemi\AppData\Local\Microsoft\Terminal Server Client\Cache" /s /m *.* /D -10 /C "cmd /c del /Q @path"
rem forfiles /p "%%x\AppData\Local\Microsoft\Windows\WER\ReportQueue" /s /m *.* /C "cmd /c del /Q @path"


REM del /f /s /q C:\Windows\Temp\*.*


REM IF EXIST "C:\Users\" (
REM     for /D %%x in ("C:\Users\*") do ( 
REM         del /f /s /q "%%x\AppData\Local\Temp\" 
REM         del /f /s /q "%%x\AppData\Local\Microsoft\Windows\Temporary Internet Files\" 
REM     )
REM )
copy c:\installs\microsoft\patch_deploy_demo.txt "%windir%\temp"\