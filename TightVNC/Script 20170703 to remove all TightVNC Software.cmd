@ECHO OFF
REM This script should remove the following TightVNC Server
REM =========================================================================================
REM Ver 1.0 July 3, 2017
REM Written by Randy Dover, A-Total Network Solution, randy.dover @ atotalnetworksolution.com
REM Script may be modified, but credit may not be removed
REM =========================================================================================


REM Stop Any VNC Services
ECHO Stopping Services.
NET STOP tvnserver


REM Kill Any Possible Left Over VNC Processes
ECHO Killing any possibly left over VNC processes.
TASKKILL /F /IM tvnserver.exe


REM Uninstalls TightVNC Product
ECHO Deleting Program
REM Next line uninstalls 2.7.10
MsiExec.exe /X{D903B276-81AE-4AED-AEF9-45DACFBF16CE} /qn /norestart
REM Next line uninstalls 2.8.8
MsiExec.exe /X{C148910C-51F8-4D36-BFBD-87A64B139006} /qn /norestart
MsiExec.exe /X{DEE0B752-52D8-4615-9BEE-1EDA46628960} /qn /norestart

REM Delete Any VNC Services
ECHO Deleting Services
SC DELETE tvnserver

REM Removes Any VNC HKEY_CLASSES_ROOT Registry Keys
ECHO Removing HKEY_CLASSES_ROOT VNC Keys.
REG DELETE HKCR\VncViewer.Config /F

REG DELETE HKCR\Installer\Features\C019841C8F1563D4FBDB786AB4310960 /F
REG DELETE HKCR\Installer\Features\257B0EED8D255164B9EEE1AD64269806 /F
REG DELETE HKCR\Installer\Products\C019841C8F1563D4FBDB786AB4310960 /F
REG DELETE HKCR\Installer\Products\257B0EED8D255164B9EEE1AD64269806 /F

REM Removes Any VNC HKEY_CURRENT_USER Registry Keys
ECHO Removing HKEY_CURRENT_USER VNC Keys.
REG DELETE "HKCU\GlavSoft LLC." /F
REG DELETE "HKCU\Software\GlavSoft LLC." /F
REG DELETE HKCU\Software\TightVNC /F

REM Removes Any VNC Registry Keys
ECHO Removing HKEY_CURRENT_USER Shortcut Keys VNC Keys.
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /f
REM This section probably not needed
REM ===============================================================
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Application Mode)\TightVNC Server - Control Interface.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Application Mode)\TightVNC Server - Offline Configuration.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Application Mode)\TightVNC Server - Offline Configuration.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Service Mode)\Start TightVNC Service.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Service Mode)\Stop TightVNC Service.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Service Mode)\TightVNC Service - Control Interface.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Service Mode)\TightVNC Service - Offline Configuration.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Service Mode)\Unregister TightVNC Service.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\Users\mm-admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Application Mode)\Run TightVNC Server.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\Users\mm-admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Application Mode)\TightVNC Server - Control Interface.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\Users\mm-admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Application Mode)\TightVNC Server - Control Interface.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\Users\mm-admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Service Mode)\Register TightVNC Service.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\Users\mm-admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Service Mode)\Start TightVNC Service.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\Users\mm-admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Service Mode)\Start TightVNC Service.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\Users\mm-admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Service Mode)\TightVNC Service - Control Interface.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\Users\mm-admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Service Mode)\TightVNC Service - Offline Configuration.lnk" /f
	REM REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage\NewShortcuts\ /V "C:\Users\mm-admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Service Mode)\Unregister TightVNC Service.lnk" /f
REM ===============================================================

REG DELETE HKLM\SOFTWARE\Classes\Installer\Features\672B309DEA18DEA4EA9F54ADFCFB61EC /F
REG DELETE HKLM\SOFTWARE\Classes\Installer\Products\672B309DEA18DEA4EA9F54ADFCFB61EC /F
REM The above two lines are questionable, may be different key

ECHO Removing HKEY_LOCAL_MACHINE VNC Keys.
echo Y | REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders\ /V "C:\Program Files\TightVNC\\" /F
echo Y | REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders\ /V "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TightVNC\\" /F
echo Y | REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders\ /V "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Application Mode)\\" /F
echo Y | REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders\ /V "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TightVNC\TightVNC Server (Service Mode)\\" /F
echo Y | REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders\ /V "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TightVNC\\" /F
echo Y | REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\Folders\ /V "C:\ProgramData\TightVNC\\" /F
REG DELETE HKLM\SOFTWARE\TightVNC /F
REG DELETE HKLM\SOFTWARE\Wow6432Node\TightVNC /F


REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\1DC63F8F3EE91194C81AB8B0B63B1457 /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\23E07D66B2EFAC946AC4C3DC7C7AFB59 /F

REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\645D7903BEBBB504A950A7D60C9FA206 /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6975D4B1BD939814DBC0B9FB941B9D6C /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\6FBBCC49FD7E8D946AFD603682DBD542 /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\885CB6A2BE01A3D49A3909E855D2044E /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\A9D878D6F06F3C74DA17D42B2B61BD30 /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\B99A60EF9080991479955EA50F445F73 /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\C019841C8F1563D4FBDB786AB4310960 /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\D1546053D3B0F094F807186397FF7D66 /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\EABBAACD2754E5F4A8160A5C98044493 /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\F3DE28297F2A727409B92016D4AE32AE /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\FC8B75ECC8444C84DAAB7101977F419C /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\672B309DEA18DEA4EA9F54ADFCFB61EC /F

REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\C019841C8F1563D4FBDB786AB4310960 /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\257B0EED8D255164B9EEE1AD64269806 /F

REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v tvncontrol /F

REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{C148910C-51F8-4D36-BFBD-87A64B139006} /F
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{D903B276-81AE-4AED-AEF9-45DACFBF16CE} /F

REG DELETE HKLM\SOFTWARE\TightVNC /F


REM Removes entries from all control sets
ECHO Removing ControlSet VNC keys.
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\eventlog\Application\tvnserver" /F
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{2267BB49-110B-4833-AA56-FC3F2A395929}" /F
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{2FFA4F35-C055-4C5F-B852-8672661C236D}" /F
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{3081CA02-48E1-4AB8-B5B2-FE7826CD05BA}" /F
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{5F23248B-0C8C-4644-89BA-7D2B8B32C404}" /F
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{79B4D0C3-81F7-45D0-B8E4-089D6079B507}" /F
REG DELETE "HKLM\SYSTEM\ControlSet001\Services\tvnserver" /F
REG DELETE "HKLM\SYSTEM\ControlSet002\Services\eventlog\Application\tvnserver" /F
REG DELETE "HKLM\SYSTEM\ControlSet002\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{2267BB49-110B-4833-AA56-FC3F2A395929}" /F
REG DELETE "HKLM\SYSTEM\ControlSet002\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{2FFA4F35-C055-4C5F-B852-8672661C236D}" /F
REG DELETE "HKLM\SYSTEM\ControlSet002\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{3081CA02-48E1-4AB8-B5B2-FE7826CD05BA}" /F
REG DELETE "HKLM\SYSTEM\ControlSet002\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{5F23248B-0C8C-4644-89BA-7D2B8B32C404}" /F
REG DELETE "HKLM\SYSTEM\ControlSet002\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{79B4D0C3-81F7-45D0-B8E4-089D6079B507}" /F
REG DELETE "HKLM\SYSTEM\ControlSet002\Services\tvnserver" /F
REG DELETE "HKLM\SYSTEM\ControlSet\Services\eventlog\Application\tvnserver" /F
REG DELETE "HKLM\SYSTEM\ControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{2267BB49-110B-4833-AA56-FC3F2A395929}" /F
REG DELETE "HKLM\SYSTEM\ControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{2FFA4F35-C055-4C5F-B852-8672661C236D}" /F
REG DELETE "HKLM\SYSTEM\ControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{3081CA02-48E1-4AB8-B5B2-FE7826CD05BA}" /F
REG DELETE "HKLM\SYSTEM\ControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{5F23248B-0C8C-4644-89BA-7D2B8B32C404}" /F
REG DELETE "HKLM\SYSTEM\ControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /V "{79B4D0C3-81F7-45D0-B8E4-089D6079B507}" /F
REG DELETE "HKLM\SYSTEM\ControlSet\Services\tvnserver" /F

REM Removes entries from HKEY_Users\Default
ECHO Removing ControlSet VNC keys.
REG DELETE "HKEY_USERS\.DEFAULT\Software\GlavSoft LLC." /F


REM For Vista and beyond
ECHO Deleting VNC files from Post Vista profiles.
FOR /F "tokens=*" %%X IN ('DIR /B /AD "C:\Users\"') DO (
	DEL /F /Q "C:\Users\%%X\Desktop\UltraVNC Viewer.lnk"
	DEL /F /Q "C:\Users\%%X\Desktop\UltraVNC Server.lnk"
	DEL /F /Q "C:\Users\%%X\Desktop\UltraVNC Settings.lnk"
	DEL /F /Q "C:\Users\%%X\Desktop\VNC Viewer.lnk"
	DEL /F /Q "C:\Users\%%X\Start Menu\Programs\UltraVNC.lnk"
	DEL /F /Q "C:\Users\%%X\Start Menu\Programs\UltraVNC Server.lnk"
	DEL /F /Q "C:\Users\%%X\Start Menu\Programs\UltraVNC Viewer.lnk"
	DEL /F /Q "C:\Users\%%X\Start Menu\Programs\UltraVNC Settings.lnk"

	RD /S /Q "C:\Users\%%X\Start Menu\Programs\TightVNC"
	RD /S /Q "C:\Users\%%X\Start Menu\Programs\UltraVNC"
)


REM 'All Users' of Vista and Beyond
ECHO Deleting VNC files from ProgramData.
DEL /F /Q "C:\ProgramData\Desktop\UltraVNC Viewer.lnk"
DEL /F /Q "C:\ProgramData\Desktop\UltraVNC Server.lnk"
DEL /F /Q "C:\ProgramData\Desktop\UltraVNC Settings.lnk"
DEL /F /Q "C:\ProgramData\Desktop\VNC Viewer.lnk"
DEL /F /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\UltraVNC.lnk"
DEL /F /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\UltraVNC Server.lnk"
DEL /F /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\UltraVNC Viewer.lnk"
DEL /F /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\UltraVNC Settings.lnk"

RD /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TightVNC"
RD /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\UltraVNC"

REM Removes VNC Files
ECHO Deleting Program Files.
RD /S /Q "%ProgramFiles%\UltraVNC"
RD /S /Q "%ProgramFiles%\TightVNC"

RD /S /Q "%ProgramFiles% (x86)\UltraVNC"
RD /S /Q "%ProgramFiles% (x86)\TightVNC"
