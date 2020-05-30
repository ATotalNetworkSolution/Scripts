<#
This script retrieves netstat information, ports and IP addresses remote computers
Ver 1.8 2020-02-26 - Changed TimeStamp to Variable as it was creating two files for some computers and the minute was changing during the file creation
Ver 1.7 2020-02-26 - Includes TimeStamp
Ver 1.6 2020-02-26 - Filters out 127.* to 0.0.0.0 and 0.0.0.0 to 127.*
Ver 1.5 2020-02-25 - Filters out 127.* to 127.*
Ver 1.5 2020-02-25 - Filters out 0.0.0.0 to 0.0.0.0
Ver 1.4 2020-02-25 - Changed to use Invoke-command to run on remote computers
Ver 1.3 2020-02-25 - Added Write-Output line
Ver 1.2 2020-02-25 - Added For-each loop to do multiple computers
Ver 1.1 2020-02-25 - Determined PowerShell had to be run as Administrator, added that instruction
Ver 1.0 2020-02-25 - Runs properly on local PC
 
Written by Randy Dover, Airnet Group, Inc. support@airnetgroup.com
Script may be modified, by credit may not be removed

.NOTATIONS 
A list of computers the directory and file listings are to be retrieved from needs to be saved in C:\Temp\, with the name of "ServerNames.txt"
    Each server must be on its own line with no comma or other punctuation

#>

Clear-Host
Write-Host " "
Write-Host "Before proceeding, Make sure you have run PowerShell as Administrator. If not, exit now and launch as Administrator" -ForegroundColor Yellow
Write-Host "Save the list of computers to get files and folder on in a file named ComputerNames.txt into the C:\Temp folder" -ForegroundColor Yellow
Write-Host "The list of computers in the ComputersNames.txt file should be on their own line with no punctuation" -ForegroundColor Yellow

[void](Read-Host 'Press Enter to continue…')

$cred = Get-Credential
$Computers = Get-Content -Path C:\Temp\ComputerNames.txt
#Clear-Host

Foreach ($computer in $Computers)
{

Invoke-Command -ComputerName $computer {Get-NetTCPConnection} | ForEach-Object {
    $conn = $_

 

    if($conn.LocalAddress -eq "0.0.0.0" -and $conn.RemoteAddress -eq "0.0.0.0")
    {
        return
    }
    if($conn.LocalAddress.StartsWith("127.") -and $conn.RemoteAddress.StartsWith("127."))
    {
        return
    }
    if($conn.LocalAddress -eq "0.0.0.0" -and $conn.RemoteAddress.StartsWith("127."))
    {
        return
    }
    if($conn.LocalAddress.StartsWith("127.") -and $conn.RemoteAddress-eq "0.0.0.0")
    {
        return
    }

    $process = Get-Process -Id $conn.OwningProcess

     $DateTimeVariable = get-date -Format "yyyy-MM-dd-HH-mm"
     Write-Host $conn.LocalAddress, $conn.LocalPort, $conn.RemoteAddress, $conn.RemotePort, $conn.State, $conn.AppliedSetting, $conn.OwningProcess, $process.ProcessName
     Write-Output "$($conn.LocalAddress), $($conn.LocalPort), $($conn.RemoteAddress), $($conn.RemotePort), $($conn.State), $($conn.AppliedSetting), $($conn.OwningProcess), $($process.ProcessName)" >> C:\Temp\"$Computer"_IP_and_Port_Listing_"$DateTimeVariable".txt
}
}