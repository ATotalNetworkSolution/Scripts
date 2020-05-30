#airnetoffice\admin_rdover

#Working:
$cred = Get-Credential
$Computers = Get-Content -Path C:\Temp\ComputerName-TS.txt
Get-ChildItem \\$computers\e$\* -recurse | out-File C:\Temp\"$computers"FileListing.txt

$cred = Get-Credential
$Computers = Get-Content -Path C:\Temp\ComputerName-TS.txt
#Clear-Host
Foreach ($computer in $computers)
{
$Drives = Get-WmiObject -Class Win32_logicaldisk -ComputerName $computer -Credential $cred

#Get-WmiObject -Class Win32_logicaldisk -Filter "DriveType = '3'"
ForEach ($DeviceID in $drives)
{
$DriveLetter = "D$"
Get-ChildItem \\$computers\$DriveLetter\* -recurse | out-File C:\Temp\"$Computers$DriveLetterFL"FileListing.txt
}
}

#Working for 1:
$cred = Get-Credential
#$Computers = Get-Content -Path C:\Temp\ComputerName-FS1.txt
#$Computers = Get-Content -Path C:\Temp\ComputerName-RS.txt
$Computers = Get-Content -Path C:\Temp\ComputerName-TS.txt
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


$cred = Get-Credential
$Computers = Get-Content -Path C:\Temp\ComputerNames2.txt
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
