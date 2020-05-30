<#      
==============================================================================================
This script installs the Telnet client
Ver 1.0 2018-02-28 First attempt

Written by Randy Dover, A-Total Network Solution, randy.dover@atotalnetworksolution.com
Script may be modified, by credit may not be removed

.NOTATIONS 
==============================================================================================    
#>

[CmdletBinding()]
dism /online /Enable-Feature /FeatureName:TelnetClient