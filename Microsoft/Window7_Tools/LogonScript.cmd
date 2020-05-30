@echo off
net use u: \\cscb-cifs\%Username% /persistent:yes
net use S: \\cscb-cifs\Shared /persistent:yes
net use W: \\cscb-cifs\WorkGroups /persistent:yes

rem pause
