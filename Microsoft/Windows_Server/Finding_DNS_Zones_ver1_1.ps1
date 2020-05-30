<#
This script retrieves DNS Zones and outputs them to files
Ver 1.1 Improved internal documentation and outputted instructions
Ver 1.0 2020-03-06 - Creates C:\Temp folder
 
Written by Jamie Godsey and Randy Dover, Airnet Group, Inc. support@airnetgroup.com
Script may be modified, by credit may not be removed

.NOTATIONS 
Script must be run on a server that has the DNS role installed
The Get-DNSZone cmdlet is installed automatically on Servers greater than 2012. If server OS is prior, may have to install the DNSServer module
#>

Clear-Host
Write-Host " "
Write-Host "This script MUST be run on a server that has the DNS role installed on it." -ForegroundColor Yellow
Write-Host "If you are not running this script on a server that has the DNS role installed on it, exit now." -ForegroundColor Yellow

[void](Read-Host 'Press Enter to continue…')

#This section checks to see if C:\Temp folder exists and creates it if it doesn't
$path = "C:\Temp"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

#This section gets the DNS Zone info and outputs the zones to files
$Zones = @(Get-DnsServerZone)
ForEach ($Zone in $Zones) 
     {
        Write-Host "`n$($Zone.ZoneName)" -ForegroundColor "Yellow"
        $Zone | Get-DnsServerResourceRecord | Out-File C:\Temp\“$($Zone.ZoneName).csv"
     }
