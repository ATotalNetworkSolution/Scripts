<#
This script re-sizes multiple VMs in Azure
Ver 1.1 Runs properly
 
Written by Randy Dover, Airnet Group, Inc. support@airnetgroup.com
Script may be modified, by credit may not be removed

.NOTATIONS 
A list of computers the directory and file listings are to be retrieved from needs to be saved in C:\Temp\, with the name of "ServerNames.txt"
    Each server must be on its own line with no comma or other punctuation

#>
Connect-AzureRmAccount

Get-AzureRmSubscription
Select-AzureRmSubscription -SubscriptionName 'SubscriptionName'

#The following two sections are example code
$ARMVM = Get-AzureRmVM -VMName "VMName1" -ResourceGroupName Name_of_ResouceGroup 
$ARMVM.HardwareProfile.VmSize = "Standard_B2ms"
Update-AzureRmVM -VM $ARMVM -ResourceGroupName Name_of_ResouceGroup -AsJob

$ARMVM = Get-AzureRmVM -VMName "VMName2" -ResourceGroupName Name_of_ResouceGroup 
$ARMVM.HardwareProfile.VmSize = "Standard_B2ms"
Update-AzureRmVM -VM $ARMVM -ResourceGroupName Name_of_ResouceGroup -AsJob


#The following two sections are Real working code
$ARMVM = Get-AzureRmVM -VMName "JHinesJumpBox" -ResourceGroupName rg_for_MgdSvcs_EastUS 
$ARMVM.HardwareProfile.VmSize = "Standard_B2ms"
Update-AzureRmVM -VM $ARMVM -ResourceGroupName rg_for_MgdSvcs_EastUS -AsJob

$ARMVM = Get-AzureRmVM -VMName "JHinesWinEast4" -ResourceGroupName rg_for_MgdSvcs_EastUS 
$ARMVM.HardwareProfile.VmSize = "Standard_B2ms"
Update-AzureRmVM -VM $ARMVM -ResourceGroupName rg_for_MgdSvcs_EastUS -AsJob