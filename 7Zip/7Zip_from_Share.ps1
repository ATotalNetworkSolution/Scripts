<#      
This script installs 7Zip64 from UNC Share
Ver 3.0 Change drive letter section
Ver 3.1 Included UserName Parameter and Password Parameter

Written by Randy Dover, A-Total Network Solution, randy.dover@atotalnetworksolution.com
Script may be modified, by credit may not be removed

.NOTATIONS 
        Change these variables to make it fit into your scenario 
         
        Change $Username to desired username
        Change $Domain to desired name of domain or of the machinename
        Change Value of ClearTextPassword variabe to desired password in clear text
        Change $FullPathDirectory to UNC Name \\Servername\Folder\Subfolder
        Change $File to executable name
        Change $Switches to switches needed by executable, these vary depending on executable
    
#>

#Variable section
Param (
    [Parameter(Mandatory=$True)]
    [String]$UserNameParam,
    [Parameter(Mandatory=$True)]
    [String]$PasswordParam
)
$Domain=’InputDomainName’
$RemoteServer="InputServerName"
$ClearTextPassword = ConvertTo-SecureString -String $PasswordParam -AsPlainText -Force
$UserNameDomain=$Domain+’\’+$UserNameParam
$FullPathDirectory="\\ServerName\Folder\Subfolder"
$UserCred = New-Object System.Management.Automation.PSCredential -ArgumentList $UserNameDomain, $ClearTextPassword
$File="7z1900-x64.msi"
$PathandFile = $FullPathDirectory+'\'+$File
$Switches="/qn", "/passive", "/norestart"

$env:SEE_MASK_NOZONECHECKS = 1

#New Drive Letter section:
$drives = gdr -PSProvider FileSystem | Select -ExpandProperty Name 
$psdriveletter = ([char]'E'..[char]'Z' | %{[char]$_ }) | Where {$drives -notContains $_} | Select -First 1 
New-PSDrive -Name $psdriveletter -PSProvider FileSystem -Root $FullPathDirectory -Credential $UserCred | Out-Null
set-location $psdriveletter':' -PassThru
#The Start-Process line is used specifically for MSI FILES
(Start-Process -FilePath "$PathandFile" -ArgumentList $Switches -Wait)
    #Start -wait line is used specifically for EXE FILES
    #start -wait $psdriveletter':'"$File" /q

Remove-Item env:SEE_MASK_NOZONECHECKS
set-location c: -PassThru
Remove-PSDrive -Name $psdriveletter -Force