Write-Host '*** AVD Customisation *** INSTALL *** Install C++ Redist for RTCSvc (Teams Optimized) ***'
Invoke-WebRequest -Uri 'https://aka.ms/vs/16/release/vc_redist.x64.exe' -OutFile 'c:\temp\vc_redist.x64.exe' -ErrorAction Stop
Invoke-Expression -Command 'C:\temp\vc_redist.x64.exe /install /quiet /norestart'
Start-Sleep -Seconds 15

Write-Host '*** AVD Customisation *** INSTALL *** Install RTCWebsocket to optimize Teams for AVD ***'
New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Teams' -Force | Out-Null
New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Teams' -Name 'IsWVDEnvironment' -Value '1' -PropertyType DWORD -Force | Out-Null
Invoke-WebRequest -Uri 'https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RWQ1UW' -OutFile 'c:\temp\MsRdcWebRTSvc.msi' -ErrorAction Stop
Invoke-Expression -Command 'msiexec /i c:\temp\MsRdcWebRTSvc.msi /quiet /l*v C:\temp\MsRdcWebRTSvc.log ALLUSER=1'
Start-Sleep -Seconds 15

Write-Host '*** AVD Customisation *** INSTALL *** Install Teams in Machine mode ***'
Invoke-WebRequest -Uri 'https://teams.microsoft.com/downloads/desktopurl?env=production&plat=windows&arch=x64&managedInstaller=true&download=true' -OutFile 'c:\temp\Teams.msi' -ErrorAction Stop
Invoke-Expression -Command 'msiexec /i C:\temp\Teams.msi /quiet /l*v C:\AVD\teamsinstall.log ALLUSER=1 ALLUSERS=1 OPTIONS="noAutoStart=true"'
Write-Host '*** AVD Customisation *** CONFIG TEAMS *** Configure Teams to start at sign in for all users. ***'
New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run -Name Teams -PropertyType Binary -Value ([byte[]](0x01,0x00,0x00,0x00,0x1a,0x19,0xc3,0xb9,0x62,0x69,0xd5,0x01)) -Force
Start-Sleep -Seconds 30
