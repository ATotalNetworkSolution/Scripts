# This Artifact provides functionality for BGInfo
# Three files, Bginfo64.exe, BGInfoStartup.cmd and bginfo.bgi will need to be copied to blob storage for this Artifact
# Content of is BGInfoStartup.cmd is "C:\Installs\BGInfo\Bginfo64.exe C:\Installs\BGInfo\bginfo.bgi /silent /nolicprompt /timer:0"
# BGInfo.bgi file is default
#SAS is the blobstorage access for Airnet
$sas = "?sv=2017-04-17&sr=c&sig=fev9XOiKXTl4h2Y0OeLS6Agbdtt8DyNRmZd96u0WzWQ%3D&st=2018-02-28T14%3A34%3A14Z&se=2019-02-28T14%3A34%3A14Z&sp=rwd"
#The next line sets the Installation source folder variable
$file = "Bginfo64.exe"
$file2 = "BGInfoStartup.cmd"
$file3 = "bginfo.bgi"
$container = "https://airnetpsinstalls.blob.core.windows.net/artifacts"
$blobURI = "$($container)/$($file)$($sas)"
$blobURI2 = "$($container)/$($file2)$($sas)"
$blobURI3 = "$($container)/$($file3)$($sas)"
$outpath = "C:\Installs\BGInfo\$($file)"
$outpath2 = "C:\Installs\BGInfo\$($file2)"
$outpath3 = "C:\Installs\BGInfo\$($file3)"
#The next line calls the "get" operation to pull the file
$BlobOperation = "Get"
#The next line provides the destination location


#The next line add the registry entry to accept the EULA
reg add HKEY_CURRENT_USER\Software\Sysinternals\BGInfo /v EulaAccepted /t REG_DWORD /d 1 /f
#The next three lines creates the folders and copies the files needed
New-Item -ItemType directory -Path C:\Installs
New-Item -ItemType directory -Path C:\Installs\BGInfo
(New-Object Net.WebClient).DownloadFile($bloburi,$outpath)
(New-Object Net.WebClient).DownloadFile($bloburi2,$outpath2)
(New-Object Net.WebClient).DownloadFile($bloburi3,$outpath3)
#The next copies the BGInfo launcher to Startup
Copy-Item C:\Installs\BGInfo\BGInfoStartup.cmd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
