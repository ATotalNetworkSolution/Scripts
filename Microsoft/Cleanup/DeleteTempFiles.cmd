REM This script deletes Temp files
REM =========================================================================================
REM Ver 1.0 2017-09-25
REM Written by Randy Dover, A-Total Network Solution, randy.dover @ atotalnetworksolution.com
REM Script may be modified, but credit may not be removed
REM =========================================================================================

REM pause
REM dir "%windir%\temp"
REM pause
del /f /s /q "%windir%\temp"
 REM FOR /D %%X IN ("%windir%\temp\*") DO RMDIR /S /Q "%%X"
REM pause

REM dir "%temp%\"
REM pause
del /f /s /q "%temp%\"
 REM FOR /D %%X IN ("%temp%\*") DO RMDIR /S /Q "%%X"
del /f /s /q %temp%\. 
REM pause

cd \Windows\Logs\cbs
forfiles.exe /d -10 /c "cmd.exe /c del @file"
REM pause

cd \Windows\System32\LogFiles\HTTPERR
forfiles.exe /d -30 /c "cmd.exe /c del @file"
REM pause

cd \Windows\ServiceProfiles\LocalService\AppData\Local\Temp
forfiles.exe /d -5 /c "cmd.exe /c del @file"
REM  pause

attrib -s -h -a /s /d c:\users\%username%\appdata
del /f /s /q "\Users\%username%\AppData\Local\Temp"
del /f /s /q C:\Users\%username%\AppData\Local\GoToMeeting
rd /s /q C:\Users\%username%\AppData\Local\GoToMeeting
