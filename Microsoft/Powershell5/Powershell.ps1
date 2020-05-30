#This script updates Powershell 
#SAS is the blobstorage access for Airnet, it can be changed to match specific environment
$sas = "?sv=2017-04-17&sr=c&sig=fev9XOiKXTl4h2Y0OeLS6Agbdtt8DyNRmZd96u0WzWQ%3D&st=2018-02-28T14%3A34%3A14Z&se=2019-02-28T14%3A34%3A14Z&sp=rwd"
#The next line is the filename variable, it can be changed to match desired install file
$file = "Win7AndW2K8R2-KB3134760-x64.msu"
$BlobOperation = "Get"
$outPath = "$($env:ALLUSERSPROFILE)\$($file)"
$container = "https://airnetpsinstalls.blob.core.windows.net/artifacts"
$blobURI = "$($container)/$($file)$($sas)"

#Invoke-RestMethod -Uri $blobURI -OutFile $outPath
(New-Object Net.WebClient).DownloadFile($bloburi,$outpath)
cd $env:ALLUSERSPROFILE
#The next line works, but has the /norestart switch
start -wait 'c:\windows\system32\wusa.exe '$file' /quiet /norestart'
Remove-Item $file

#The next line "sleeps" or pauses for 10 minutues before forcing the computer to restart
Start-Sleep -s 600
#The next line forces the computer to reboot after the install of the PowerShell update, commented out upon testing the above with /norestart removed
restart-computer -force

#The next line sets the set-executionpolicy to remotesigned
set-executionpolicy remotesigned