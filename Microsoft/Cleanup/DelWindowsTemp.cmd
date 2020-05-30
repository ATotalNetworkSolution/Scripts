REM This script deletes Windows Temp Files
REM =========================================================================================
REM Ver 1.0 2014-08-31
REM Written by Randy Dover, A-Total Network Solution, randy.dover @ atotalnetworksolution.com
REM Script may be modified, but credit may not be removed
REM =========================================================================================

REM cd \
cd C:\Windows\Temp
DEL /F /Q *.*
DEL /F /Q *.
REM rd /S /Q C:\Windows\Temp\*.
REM ERASE /F /S /Q C:\Windows\Temp\*.*
REM ERASE /F /S /Q C:\Windows\Temp\*.
FOR /D %%A IN C:\Windows\Temp DO rd /s /q %%A