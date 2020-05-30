<#
This script downloads dotNet_4_8_0
Ver 1.0 2020-05-26 First iteration of downloading .Net 4.8.0

Written by Randy Dover, Airnet Group, Inc. support@airnetgroup.com
Script may be modified, by credit may not be removed


.NOTATIONS 

#>

#Variable section
$InstallsDir = "C:\Installs"
$DotNetDir = "C:\Installs\dotNET_Framework_4_8"
$DotNetFile = "ndp48-x86-x64-allos-enu.exe"
$FileAndPath = $DotNetDir + "\" + $DotNetFile

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

#This section creates the C:\Installs\dotNET_Framework_4_8 folder, if it does not exist
if (-not (Test-Path -LiteralPath $DotNetDir)) {
    
    try {
        New-Item -Path $DotNetDir -ItemType Directory -ErrorAction Stop | Out-Null #-Force
    }
    catch {
        Write-Error -Message "Unable to create directory '$DotNetDir'. Error was: $_" -ErrorAction Stop
    }
    "Successfully created directory '$DotNetDir'."

}
else {
    "Directory already existed"
}

# Download dotNet 4.8.0
Write-Verbose "downloading dotNET_Framework_4_8..."
$URL = "https://go.microsoft.com/fwlink/?linkid=2088631"
Invoke-WebRequest -Uri $URl -OutFile $FileAndPath | Out-Null
Write-Verbose "Downloaded!"

Unblock-File $FileAndPath