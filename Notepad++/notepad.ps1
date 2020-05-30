# This Artifact installs Notepad++ Ver 7.2.2
# NDP462-KB3151800-x86-x64-AllOS-ENU.exe will need to be copied to blob storage for this Artifact
$sas = "?sv=2017-04-17&sr=c&sig=fev9XOiKXTl4h2Y0OeLS6Agbdtt8DyNRmZd96u0WzWQ%3D&st=2018-02-28T14%3A34%3A14Z&se=2019-02-28T14%3A34%3A14Z&sp=rwd"
$file = "npp.7.2.2.Installer.x64.exe"
$BlobOperation = "Get"
$outPath = "$($env:ALLUSERSPROFILE)\$($file)"
$container = "https://airnetpsinstalls.blob.core.windows.net/artifacts"
$blobURI = "$($container)/$($file)$($sas)"

Invoke-RestMethod -Uri $blobURI -OutFile $outPath
cd $env:ALLUSERSPROFILE
start -wait $file /S
Remove-Item $file