rem Installs IVANTI (Formerly HEAT) EMSS agent and puts the computer in the "PCs" group
REM =========================================================================================
REM Ver 1.0 2017-09-20
REM Written by Randy Dover, A-Total Network Solution, randy.dover @ atotalnetworksolution.com
REM Script may be modified, but credit may not be removed
REM =========================================================================================


IF EXIST "%PROGRAMFILES%\HEAT Software\EMSSAgent" (GOTO END) ELSE (GOTO BitCheck)
REM Pause

:BITCHECK
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:64BIT
REM the next line installs ONLY the Patch module
REM "\\ServerName\ShareName\Folder\Subfolder\lmsetupx64.exe" install SERVERIPADDRESs="10.0.1.21" MODULELIST="VULNERABILITYMANAGEMENT" GROUPLIST="PCs"

REM the next line installs the Patch and Anti-Virus modules
"\\ServerName\ShareName\Folder\Subfolder\lmsetupx64.exe" install SERVERIPADDRESs="10.0.1.21" MODULELIST="VULNERABILITYMANAGEMENT|AntiVirus" GROUPLIST="PCs"

REM the next line installs the Patch, Application Control and Anti-Virus modules
REM "\\ServerName\ShareName\Folder\Subfolder\lmsetupx64.exe" install SERVERIPADDRESs="10.0.1.21" MODULELIST="VULNERABILITYMANAGEMENT|ApplicationControl|AntiVirus" GROUPLIST="PCs"
echo.
echo.
echo     Installed HEAT EMSS 64-bit

REM pause
GOTO END


:32BIT
REM the next line installs ONLY the Patch module
REM "\\ServerName\ShareName\Folder\Subfolder\lmsetup.exe" install SERVERIPADDRESs="10.0.1.21" MODULELIST="VULNERABILITYMANAGEMENT" GROUPLIST="PCs"

REM the next line installs the Patch and Anti-Virus modules
"\\ServerName\ShareName\Folder\Subfolder\lmsetup.exe" install SERVERIPADDRESs="10.0.1.21" MODULELIST="VULNERABILITYMANAGEMENT|AntiVirus" GROUPLIST="PCs"

REM the next line installs the Patch, Application Control and Anti-Virus modules
REM "\\ServerName\ShareName\Folder\Subfolder\lmsetup.exe" install SERVERIPADDRESs="10.0.1.21" MODULELIST="VULNERABILITYMANAGEMENT|ApplicationControl|AntiVirus" GROUPLIST="PCs"

echo.
echo.
echo     Installed HEAT EMSS 32-bit

REM pause
GOTO END

:END
REM Pause
Exit
