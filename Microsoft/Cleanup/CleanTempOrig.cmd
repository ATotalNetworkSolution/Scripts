@echo off

IF EXIST c:\windows\temp\ del /f /s /q c:\windows\temp\

DEL /f /s /q %temp%\

del /f /s /q C:\Users\%username%\AppData\Local\Temp\*.*

del /f /s /q C:\Windows\Temp\*.*

del /f /s /q C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Recent Items\*.*

IF EXIST "C:\Users\" (
    for /D %%x in ("C:\Users\*") do ( 
        del /f /s /q "%%x\AppData\Local\Temp\" 
        del /f /s /q "%%x\AppData\Local\Microsoft\Windows\Temporary Internet Files\" 
    )
)