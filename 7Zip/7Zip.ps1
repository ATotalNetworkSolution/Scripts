#This artifact install 7Zip version 18.01
# 7z1801-x64.msi will need to be copied to blob storage for this Artifact
#SAS is the blobstorage access for Airnet, it can be changed to match specific environment
$sas = "?sv=2017-04-17&sr=c&sig=fev9XOiKXTl4h2Y0OeLS6Agbdtt8DyNRmZd96u0WzWQ%3D&st=2018-02-28T14%3A34%3A14Z&se=2019-02-28T14%3A34%3A14Z&sp=rwd"
#The next line is the filename variable, it can be changed to match desired install file
$file = "7z1801-x64.msi"
#The next line calls the "get" operartion to pull the file
$BlobOperation = "Get"
#The next line provides the destination location
$outPath = "$($env:ALLUSERSPROFILE)\$($file)"

#The next line is the URI for the container, in this instance, it is Airnet's, it can be changed to match specific environment
$container = "https://airnetpsinstalls.blob.core.windows.net/artifacts"
#The next line is the UNC for the container example, in this instance, it is Airnet's, it can be changed to match specific environment
#$container = "\\rd-devtst2-2008\Installs\7Zip"

#The next line provides the full URI and credentials to the file if using BlobStorage
$blobURI = "$($container)/$($file)$($sas)"
#The next line provides the full UNC if using UNC fileshare location
#$blobURI = "$($container)/$($file)"

#The next line copies the file from source to destination
Invoke-RestMethod -Uri $blobURI -OutFile $outPath
#The next line changes into the destination location
cd $env:ALLUSERSPROFILE
#The next line is the specific installation instruction
Start-Process msiexec -ArgumentList /i, $file, /qn, /norestart -Wait
#The next line deletes the install file after installation
Remove-Item $file