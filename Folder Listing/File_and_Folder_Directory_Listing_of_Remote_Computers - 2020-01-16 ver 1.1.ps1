<#
This script gathers a directory and file listing from remote computers
Ver 1.2 2020-01-15
Written by Randy Dover, Airnet Group, Inc. support@airnetgroup.com
Script may be modified, by credit may not be removed

.NOTATIONS 
A list of computers the directory and file listings are to be retrieved from needs to be saved in C:\Temp\, with the name of "ServerNames.txt"
    Each server must be on its own line with no comma or other punctuation

#>

function viewRemoteFiles($server) {

    Write-Host "viewRemoteFiles($server) - entry"

    $scriptStr = "ls -r $remoteBaseDir | ForEach-Object { `$_.FullName }"
    $scriptBlock = [scriptblock]::Create($scriptStr)

    Invoke-Command -ComputerName $server -Credential $MySecureCreds -ScriptBlock $scriptBlock

    Write-Host "c:\temp\viewRemoteFiles($server) - exit"
}


#https://social.technet.microsoft.com/Forums/scriptcenter/en-US/a6fd08e3-6025-4466-8fa8-f27afb157c4a/powershell-remote-list-of-folder-contents-within-profiles?forum=ITCG
$ErrorActionPreference = "SilentlyContinue"
$Computers = Get-Content -Path C:\Temp\ServerNames.txt
Clear Host
Foreach ($computer in $computers)
{
$Path = "\\$i\Network\"
Get-Childitem $Path | Foreach-Object{
	#$ProfName = $_
	get-childitem "$Path\"
	}| out-File -append C:\Temp\ServerFileListing.txt}

$cred = Get-Credential
$Computers = Get-Content -Path C:\Temp\ServerName.txt
#Clear Host
Foreach ($computer in $computers)
{

Get-ChildItem \\"$computers"\$drive* -recurse | out-File C:\Temp\"$computers"FileListing.txt

}

#airnetoffice\admin_rdover

$cred = Get-Credential
Get-ChildItem \\fs1\Network\* -Credential $cred -recurse | out-File C:\Temp\"$computer"FileListing2.txt

$cred = Get-Credential
$Computers = Get-Content -Path C:\Temp\ServerName.txt
Get-ChildItem \\$computers\f$\* -recurse | out-File C:\Temp\"$computers"FileListing.txt

$cred = Get-Credential
$Computers = Get-Content -Path C:\Temp\ServerName.txt
#Clear-Host
Foreach ($computer in $computers)
{
$Drives = Get-WmiObject -Class Win32_logicaldisk

#Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '3'"
ForEach ($DeviceID in $drives)
{
Get-ChildItem \\$computers\* -recurse | out-File C:\Temp\$computersFileListing.txt
}
}

$cred = Get-Credential
$DriveInformation = @()
{
$Computers = Get-Content -Path C:\Temp\ServerName.txt | % {
Foreach ($computer in $computers)
{ 
    $invoke = Invoke-Command -Credential $cred -ComputerName $_ {
        [System.IO.DriveInfo]::getdrives() | ? {$_.DriveType -eq 'Fixed'} | 
            % {  gci $_.Name -Recurse | ? } }
    }
    $DriveInformation += $Invoke
$DriveInformation | out-file C:\Temp\$ComputersFileListing.txt 
}
}