REM This script will delete HTTP Error Log files 
REM =========================================================================================
REM Ver 1.0 2017-07-31
REM Written by Randy Dover, A-Total Network Solution, randy.dover @ atotalnetworksolution.com
REM Script may be modified, but credit may not be removed
REM =========================================================================================

REM This section deletes the log files from the HTTPERR folder
REM The second line of this section gives value of 30 days. Change the "-30" to desired number of days
cd \Windows\System32\LogFiles\HTTPERR
forfiles.exe /d -30 /c "cmd.exe /c del @file"
REM The next line will pause the script to check the status
rem pause

REM This section deletes the log files from the AppData folder
REM The second line of this section gives value of 30 days. Change the "-30" to desired number of days
cd \Windows\ServiceProfiles\LocalService\AppData\Local\Temp
forfiles.exe /d -30 /c "cmd.exe /c del @file"
REM The next line will pause the script to check the status
rem pause
