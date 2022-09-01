

Remove-Item -Path 'c:\AVD\master.zip' -Force | Out-Null

Write-Host '*** AVD Customisation *** CONFIG *** Deleting Language folder. ***'
if (test-path -path 'C:\AVD\Virtual-Desktop-Optimization-Tool') {
Get-ChildItem -Path 'C:\AVD\Virtual-Desktop-Optimization-Tool' -Recurse | Remove-Item -Recurse -Force
Remove-Item -Path 'C:\AVD\Language' -Force | Out-Null
}

#Upgrade all Application Packages Installed
choco upgrade all /y

Write-Host '*** AVD Customisation ********************* END *************************'

Write-Host '*** AVD Customisation *** INSTALL *** AVD Optimisation Script ***'
# Note: This will download and extract the AVD optimization script.
if (!(test-path -path c:\AVD)) {new-item -path c:\AVD -itemtype directory}
Invoke-WebRequest -Uri 'https://github.com/The-Virtual-Desktop-Team/Virtual-Desktop-Optimization-Tool/archive/refs/heads/main.zip' -OutFile 'c:\AVD\master.zip' -ErrorAction Stop
Expand-Archive -Path 'C:\AVD\master.zip' -DestinationPath 'C:\AVD\'  -Force
#create AVD optimisation Script

Start-Sleep -Seconds 10

#Overwriting the AppxPackage.json to configure which UWP are removed during optimisation
(Get-Content -path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json -Raw) -replace 'Enabled' , 'Disabled' | Set-Content -path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json;

((Get-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json -Raw) -replace 'Microsoft.MSPaint', 'Microsoft.MSPaint_DoNotRemove') | Set-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json
((Get-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json -Raw) -replace 'Microsoft.MicrosoftStickyNotes', 'Microsoft.MicrosoftStickyNotes_DoNotRemove') | Set-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json
((Get-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json -Raw) -replace 'Microsoft.Windows.Photos', 'Microsoft.Windows.Photos_DoNotRemove') | Set-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json
((Get-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json -Raw) -replace 'Microsoft.WindowsAlarms', 'Microsoft.WindowsAlarms_DoNotRemove') | Set-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json
((Get-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json -Raw) -replace 'Microsoft.WindowsCalculator', 'Microsoft.WindowsCalculator_DoNotRemove') | Set-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json
((Get-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json -Raw) -replace 'Microsoft.WindowsCamera', 'Microsoft.WindowsCamera_DoNotRemove') | Set-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json
((Get-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json -Raw) -replace 'Microsoft.WindowsSoundRecorder', 'Microsoft.WindowsSoundRecorder_DoNotRemove') | Set-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json
((Get-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json -Raw) -replace 'Microsoft.ScreenSketch', 'Microsoft.ScreenSketch_DoNotRemove') | Set-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\AppxPackages.json

((Get-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\Services.json -Raw) -replace 'UsoSvc', 'UsoSvc_DoNotStop') | Set-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\Services.json
((Get-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\Services.json -Raw) -replace 'DiagTrack', 'DiagTrack_DoNotStop') | Set-Content -Path C:\AVD\Virtual-Desktop-Optimization-Tool-main\2009\ConfigurationFiles\Services.json

#Create Optimisation script
if (!(test-path -path c:\AVD\optimise.ps1)) {new-item -path c:\AVD -name Optimise.ps1 -ItemType File -Value '
Get-ChildItem c:\AVD\Virtual-Desktop-Optimization-Tool-main\*.* | Unblock-File
Set-Location c:\AVD\Virtual-Desktop-Optimization-Tool-main
if ((gwmi win32_computersystem).partofdomain -eq $false) {exit 0}
if (Test-Path "C:\AVD\DONOTDELETE.log") {exit 0}
Set-ExecutionPolicy -ExecutionPolicy ByPass -Force
change logon /drainuntilrestart
.\Windows_VDOT.ps1 -Optimizations All -AcceptEULA -Verbose *> "C:\AVD\DONOTDELETE.log" -Restart 
'}

