@echo off
REM This section clears the C:\Windows\Temp folder
REM =========================================================================================
REM Ver 1.0 2017-09-26
REM Written by Randy Dover, A-Total Network Solution, randy.dover @ atotalnetworksolution.com
REM Script may be modified, but credit may not be removed
REM =========================================================================================

REM There are sometimes files in the C:\Windows\Temp folder you want to keep. The following line will copy that file to C:\Temp. 
REM Remove the "REM" if needed, and provide the name of the file desired.
copy "%windir%\temp\FileName.ext" C:\Temp

REM This section deletes the C:\Windows\Temp folder and re-creates it
IF EXIST c:\windows\temp\ del /f /s /q c:\windows\temp\
md C:\Windows\Temp

REM The next line re-copies the file from above back to the C:\Windows\Temp folder. Remove the "REM" if needed.
REM copy C:\Temp\FileName.ext "%windir%\temp"\

REM The next line provides a pause to to see the effects of deleting the C:\Windows\Temp folder
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

REM The next line provides a pause to to see the effects of clearing the AppData folder
REM pause
