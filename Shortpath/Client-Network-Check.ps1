set-location $env:temp
Invoke-WebRequest -Uri https://github.com/Azure/RDS-Templates/raw/master/AVD-TestShortpath/Test-Shortpath.ps1 -OutFile Test-Shortpath.ps1
Unblock-File -Path .\Test-Shortpath.ps1
.\Test-Shortpath.ps1
