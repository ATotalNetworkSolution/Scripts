<#
This script installs Microsoft Management Agent and InstallDependencyAgent-Windows.exe to remote computers
Ver 2.2 20191231
Written by Randy Dover, Airnet Group, Inc. support@airnetgroup.com
Script may be modified, by credit may not be removed

Some code borrowed from Niklas Akerlund 2015-10-13 https://vniklas.djungeln.se/2015/10/13/playing-with-automation-of-oms-agent-deployment/

.NOTATIONS 
Workspace ID must be retrieved from Azure Log Analytics and saved in C:\Installs\AzureAgents with name of "Workspace_ID.txt"
The Primary Key must be retrieved from Azure Log Analytics and saved in C:\Installs\AzureAgents with name of "Primary_Key.txt"
Optional: The Secondary Key must be retrieved from Azure Log Analytics and saved in C:\Installs\AzureAgents with name of "Secondary_Key.txt"
A list of servers the agents are to be installed on needs to be saved in C:\Installs\AzureAgents, with the name of "Computers.txt"
    Each server must be on its own line with no comma or other punctuation
The file "Send-File.ps1" must be inluded in the C:\Installs\AzureAgents folder
    That file can be retrieved from: https://gallery.technet.microsoft.com/scriptcenter/Send-Files-or-Folders-over-273971bf
This script will download the required agent files on to the machine where this script is called
The script will install the Microsoft  Management Agent (MMA) and Install Dependency Agent (IDA) and connect them to the workspace in Azure

#>

#The next line calls the Send-File Powershell script which will allow the files to be pushed to the target machines 
. .\Send-File.ps1

#This section gives instruction to copy the required files to the Installation folder
Clear-Host
Write-Host " "
Write-Host "Before proceeding, connect to Azure LogAnalytics > Advanced Settings" -ForegroundColor Yellow
Write-Host "Save the Workspace ID to a file named Workspace_ID.txt into the C:\Installs\AzureAgents folder" -ForegroundColor Yellow
Write-Host "Save the Primary Key to a file named Primary_Key.txt into the C:\Installs\AzureAgents folder" -ForegroundColor Yellow
Write-Host "Save the Secondary Key to a file named Secondary_Key.txt into the C:\Installs\AzureAgents folder" -ForegroundColor Yellow
Write-Host "     The Secondary Key is optional" -ForegroundColor Yellow
Write-Host "Place the Send-File.ps1 file into the C:\Installs\AzureAgents folder" -ForegroundColor Yellow
Write-Host "Save the list of computers to be installed on in a file named computers.txt into the C:\Installs\AzureAgents folder" -ForegroundColor Yellow
[void](Read-Host 'Press Enter to continue…')

$cred = Get-Credential 

#This section sets the variables
$Computers = Get-Content -Path C:\Installs\AzureAgents\Computers.txt 
$InstallFolder = "C:\Installs\AzureAgents"
$MMAFileName = "MMASetup-AMD64.exe"
$MMAFile32Name = "MMASetup-i386.exe"
$IDAFileName = "InstallDependencyAgent-Windows.exe"
$MMAFileAndPath = $InstallFolder + "\" + $MMAFileName
$MMAFile32AndPath = $InstallFolder + "\" + $MMAFile32Name
$IDAFileAndPath = $InstallFolder + "\" + $IDAFileName
$targetpath = "C:\Installs\AzureAgents"
$WorkSpaceID = Get-Content -Path C:\Installs\AzureAgents\Workspace_ID.txt
$WorkSpaceKey = Get-Content -Path C:\Installs\AzureAgents\Primary_Key.txt
$MMAinstallstring = $targetpath +'\MMASetup-AMD64.exe /C:"setup.exe /qn ADD_OPINSIGHTS_WORKSPACE=1 '+  "OPINSIGHTS_WORKSPACE_ID=$workspaceID " + "OPINSIGHTS_WORKSPACE_KEY=$workspaceKey " +'AcceptEndUserLicenseAgreement=1"'
$IDAinstallstring = $targetpath +'\InstallDependencyAgent-Windows.exe /S /AcceptEndUserLicenseAgreement:1'

#This section downloads the required agents
# Download OMS Log Analytics monitoring agent
Write-Verbose "downloading monitoring agent..."
$URL = "https://go.microsoft.com/fwlink/?LinkId=828603"
Invoke-WebRequest -Uri $URl -OutFile $MMAFileAndPath | Out-Null
Write-Verbose "Downloaded!"

# Download OMS Log Analytics 32-bit monitoring agent
Write-Verbose "downloading 32-bit monitoring agent..."
$URL = "https://go.microsoft.com/fwlink/?LinkId=828604"
Invoke-WebRequest -Uri $URl -OutFile $MMAFile32AndPath | Out-Null
Write-Verbose "Downloaded!"

# Download OMS Log Analytics dependency agent
Write-Verbose "downloading dependency agent..."
$URL = "https://aka.ms/dependencyagentwindows"
Invoke-WebRequest -Uri $URl -OutFile $IDAFileAndPath | Out-Null
Write-Verbose "Downloaded!"

#This section does the actual install of the agents 
foreach ($computer in $computers){
    $pssessionMMA = New-PSSession -ComputerName $computer -Credential $cred
  
    Send-File -Path $MMAFileAndPath -Destination $targetpath -Session $pssessionMMA
 
    Invoke-Command -Session $pssessionMMA -ScriptBlock {
 
        CMD.exe /C $using:MMAinstallstring
    }
    Remove-PSSession -Session $pssessionMMA
 
   $pssessionIDA = New-PSSession -ComputerName $computer -Credential $cred

   Send-File -Path $IDAFileAndPath -Destination $targetpath -Session $pssessionIDA

 Invoke-Command -Session $pssessionIDA -ScriptBlock {
 
        CMD.exe /C $using:IDAinstallstring
    }
    Remove-PSSession -Session $pssessionIDA
}

Write-Host " "
Write-Host "Agents have been installed" -ForegroundColor Yellow
Write-Host "Please scroll up and create screen shots of all the computers that were processed via the script" -ForegroundColor Yellow
Write-Host " "
[void](Read-Host 'Press Enter to continue…')