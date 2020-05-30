<#
This script gathers a listing of all software installed from remote computers
Ver 2.2 2020-03-11 Changed wording in note section regarding the WinRM service
Ver 2.1 2020-03-11 Added code to start WinRM service on remote PC
Ver 2.0 2020-03-11 Working on Remote, creates output file

Written by Randy Dover, Airnet Group, Inc. support@airnetgroup.com
Script may be modified, but credit may not be removed

.NOTATIONS 
A list of computers the directory and file listings are to be retrieved from needs to be saved in C:\Temp\, with the name of "ComputerNames.txt"
    Each server must be on its own line with no comma or other punctuation
When prompted for credentials enter Domain Admin level credentials.
NOTE: This script should work on servers when run as administrator with Domain Admin level credentials
    This script will start the WinRM, but does not change the Starup Type.
#>

#Instruction to run PowerShell as Admin section
Clear-Host
Write-Host " "
Write-Host "Before proceeding, Make sure you have run PowerShell as Administrator. If not, exit now and launch as Administrator" -ForegroundColor Yellow
Write-Host "Save the list of computers to get the installed applications in a file named ComputerNames.txt in the C:\Temp folder" -ForegroundColor Yellow
Write-Host "The list of computers in the ComputersNames.txt file should be on their own line with no punctuation" -ForegroundColor Yellow
Write-Host ""

[void](Read-Host 'Press Enter to continue…')

#Instruction to enter Domain Admin level section
Clear-Host
Write-Host "" -ForegroundColor Yellow
Write-Host "You are about to be prompted for Username and Password, enter Domain Admin level credentials" -ForegroundColor Yellow
Write-Host "" -ForegroundColor Yellow

[void](Read-Host 'Press Enter to continue…')
Clear-Host
$cred = Get-Credential
$Computers = Get-Content -Path C:\Temp\ComputerNames.txt
Clear-Host

Foreach ($computer in $Computers)
{
$service = Get-WmiObject -computername $computer -class win32_service -filter "Name='WinRM'"
$service.startservice()
Invoke-command -ComputerName $computer -ScriptBlock {Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate, InstallLocation} |  ConvertTo-CSV -NoTypeInformation | Add-Content -Path C:\Temp\"$Computer"_ApplicationListing.CSV
}