<#      
This script installs AdobeReader DC from UNC Share
Ver 1.0 Included UserName Parameter and Password Parameter

.NOTATIONS 
        Change these variables to make it fit into your scenario 
         
        Change $Domain to desired name of domain or of the machinename
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
$Domain=’RD-devtst1-2008’
$RemoteServer="RD-devtst1-2008"
$ClearTextPassword = ConvertTo-SecureString -String $PasswordParam -AsPlainText -Force
$UserNameDomain=$Domain+’\’+$UserNameParam
$FullPathDirectory="\\RD-devtst1-2008\Installs\AdobeReader"
$UserCred = New-Object System.Management.Automation.PSCredential -ArgumentList $UserNameDomain, $ClearTextPassword
$file = "AcroRead.msi"
$fileMST = "AcroRead.mst"
$PathandFile = $FullPathDirectory+'\'+$File
$Switches="/qn", "/passive", "/norestart", "/t $FileMST"
$env:SEE_MASK_NOZONECHECKS = 1

#New Drive Letter section:
$drives = gdr -PSProvider FileSystem | Select -ExpandProperty Name 
$psdriveletter = ([char]'E'..[char]'Z' | %{[char]$_ }) | Where {$drives -notContains $_} | Select -First 1 
New-PSDrive -Name $psdriveletter -PSProvider FileSystem -Root $FullPathDirectory -Credential $UserCred | Out-Null
set-location $psdriveletter':' -PassThru
#The Start-Process line is used specifically for MSI FILES
Start-Process -FilePath $file -ArgumentList $Switches -Wait

Remove-Item env:SEE_MASK_NOZONECHECKS
set-location c: -PassThru
Remove-PSDrive -Name $psdriveletter -Force