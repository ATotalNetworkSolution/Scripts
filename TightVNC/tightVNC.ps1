# This Artifact installs TightVNC vers 2.8.8 and sets password 
# tightvnc-2.8.8-gpl-setup-64bit.msi file will need to be copied to blob storage for this Artifact
$sas = "?sv=2017-04-17&sr=c&sig=fev9XOiKXTl4h2Y0OeLS6Agbdtt8DyNRmZd96u0WzWQ%3D&st=2018-02-28T14%3A34%3A14Z&se=2019-02-28T14%3A34%3A14Z&sp=rwd"
$file = "tightvnc-2.8.8-gpl-setup-64bit.msi"
$outPath = "$($env:ALLUSERSPROFILE)\$($file)"
$container = "https://airnetpsinstalls.blob.core.windows.net/artifacts"
$blobURI = "$($container)/$($file)$($sas)"

Invoke-RestMethod -Uri $blobURI -OutFile $outPath
cd $env:ALLUSERSPROFILE
msiexec /i $file /quiet /norestart ADDLOCAL=Server SET_RUNCONTROLINTERFACE=1 VALUE_OF_RUNCONTROLINTERFACE=0 SET_QUERYACCEPTONTIMEOUT=1 VALUE_OF_QUERYACCEPTONTIMEOUT=1 SET_QUERYTIMEOUT=1 VALUE_OF_QUERYTIMEOUT=15 SET_VIEWONLYPASSWORD=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=HAL9000
Remove-Item $file