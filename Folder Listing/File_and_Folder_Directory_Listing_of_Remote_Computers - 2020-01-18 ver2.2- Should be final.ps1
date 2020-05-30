<#
This script gathers a directory and file listing from remote computers
Ver 2.2 2020-01-17
Written by Randy Dover, Airnet Group, Inc. support@airnetgroup.com
Script may be modified, by credit may not be removed

.NOTATIONS 
A list of computers the directory and file listings are to be retrieved from needs to be saved in C:\Temp\, with the name of "ServerNames.txt"
    Each server must be on its own line with no comma or other punctuation

#>

Clear-Host
Write-Host " "
Write-Host "Before proceeding, Make sure you have run PowerShell as Administrator. If not, exit now and launch as Administrator" -ForegroundColor Yellow
Write-Host "Save the list of computers to get files and folder on in a file named ComputersNames.txt into the C:\Temp folder" -ForegroundColor Yellow

[void](Read-Host 'Press Enter to continue…')

$cred = Get-Credential
$Computers = Get-Content -Path C:\Temp\ComputerNames.txt
#Clear-Host
Foreach ($computer in $Computers)
{
$Drives = Get-WmiObject -Class Win32_logicaldisk -ComputerName $computer -Credential $cred

    
#Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '3'"
    ForEach ($Drive in $Drives)
    {
        
        $DriveLetter = $Drive.DeviceID -replace ":","$"
        $DriveLetterFL = $Drive.DeviceID -replace ":"," "

        Get-ChildItem \\$computer\$DriveLetter\* -recurse | out-File C:\Temp\"$Computer$DriveLetterFL"FileListing.txt
    }
}
