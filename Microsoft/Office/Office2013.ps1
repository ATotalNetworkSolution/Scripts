<#      
This script installs Office2013 from UNC Share

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
    #$Username = "airnetadmin"
$Domain=’RD-devtst1-2008’
$RemoteServer="RD-devtst1-2008"
$ClearTextPassword = ConvertTo-SecureString -String $PasswordParam -AsPlainText -Force
$UserNameDomain=$Domain+’\’+$UserNameParam
$FullPathDirectory="\\RD-devtst1-2008\Installs\Office2013"
$UserCred = New-Object System.Management.Automation.PSCredential -ArgumentList $UserNameDomain, $ClearTextPassword
$File="setup.exe"
$FileXML="\\RD-devtst1-2008\Installs\Office2013\ProPlus.WW\Config.xml"
$FileMSP="\\RD-devtst1-2008\Installs\Office2013\ProPlus.WW\Office2013.msp"
$PathandFile = $FullPathDirectory+'\'+$File
$Switches="/adminfile"
$OfficeArguments = "/adminfile $FileMSP"

$env:SEE_MASK_NOZONECHECKS = 1

#New Drive Letter section:
$drives = gdr -PSProvider FileSystem | Select -ExpandProperty Name 
$psdriveletter = ([char]'E'..[char]'Z' | %{[char]$_ }) | Where {$drives -notContains $_} | Select -First 1 
New-PSDrive -Name $psdriveletter -PSProvider FileSystem -Root $FullPathDirectory -Credential $UserCred | Out-Null
set-location $psdriveletter':' -PassThru

    #The Start-Process line is used specifically for MSI FILES
    #(Start-Process -FilePath "$PathandFile" -ArgumentList $Switches -Wait)
#Start -wait line is used specifically for EXE FILES
Start-Process -FilePath $PathandFile -ArgumentList $OfficeArguments -Wait

Remove-Item env:SEE_MASK_NOZONECHECKS
#set-location c: -PassThru
#Remove-PSDrive -Name $psdriveletter -Force