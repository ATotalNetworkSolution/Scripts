#This script turns off UAC
#The next line creates an entry in the Registry
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force

#The next line forces a reboot, as UAC changes require a reboot to take effect
restart-computer -force