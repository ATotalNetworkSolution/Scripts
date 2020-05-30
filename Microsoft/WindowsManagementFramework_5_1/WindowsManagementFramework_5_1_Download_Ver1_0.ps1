<#
This script downloads WindowsManagementFramework 5.1
Ver 1.0 2020-05-26 First iteration of downloading WindowsManagementFramework 5.1

Written by Randy Dover, Airnet Group, Inc. support@airnetgroup.com
Script may be modified, by credit may not be removed


.NOTATIONS 
https://www.microsoft.com/en-us/download/details.aspx?id=54616
#>

#Variable section
$InstallsDir = "C:\Installs"
$WinMgmtFrameworkDir = "C:\Installs\WindowsManagementFramework_5_1"
$WinMgmtFrameworkFile = "Win8.1AndW2K12R2-KB3191564-x64.msu"
$FileAndPath = $WinMgmtFrameworkDir + "\" + $WinMgmtFrameworkFile

#This section creates the C:\Installs folder, if it does not exist
if (-not (Test-Path -LiteralPath $InstallsDir)) {
    
    try {
        New-Item -Path $InstallsDir -ItemType Directory -ErrorAction Stop | Out-Null #-Force
    }
    catch {
        Write-Error -Message "Unable to create directory '$InstallsDir'. Error was: $_" -ErrorAction Stop
    }
    "Successfully created directory '$InstallsDir'."

}
else {
    "Directory already existed"
}

#This section creates the C:\Installs\WinMgmtFramework_Framework_4_8 folder, if it does not exist
if (-not (Test-Path -LiteralPath $WinMgmtFrameworkDir)) {
    
    try {
        New-Item -Path $WinMgmtFrameworkDir -ItemType Directory -ErrorAction Stop | Out-Null #-Force
    }
    catch {
        Write-Error -Message "Unable to create directory '$WinMgmtFrameworkDir'. Error was: $_" -ErrorAction Stop
    }
    "Successfully created directory '$WinMgmtFrameworkDir'."

}
else {
    "Directory already existed"
}

# Download WinMgmtFramework 4.8.0
Write-Verbose "downloading WinMgmtFramework_Framework_4_8..."
$URL = "https://go.microsoft.com/fwlink/?linkid=839516"
Invoke-WebRequest -Uri $URl -OutFile $FileAndPath | Out-Null
Write-Verbose "Downloaded!"

Unblock-File $FileAndPath