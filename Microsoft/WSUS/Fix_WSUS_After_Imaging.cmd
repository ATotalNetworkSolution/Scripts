rem Fixes problem with client machines not showing up on the server due to imaging method
REM =========================================================================================
REM Ver 1.0 2009-02-04
REM Written by Randy Dover, A-Total Network Solution, randy.dover @ atotalnetworksolution.com
REM Script may be modified, but credit may not be removed
REM =========================================================================================

reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate /v AccountDomainSid /f
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate /v PingID /f
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate /v SusClientId /f

@echo Triggering detection after resetting WSUS client identity
net stop wuauserv
net start wuauserv
wuauclt /resetauthorization /detectnow
