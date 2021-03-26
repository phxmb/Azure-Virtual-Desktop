Write-Host '*** WVD Customisation *** INSTALL *** Install ApexOne antivirus ***'
Invoke-WebRequest -Uri 'https://tc5ui5.manage.trendmicro.com:443/officescan/download/agent_cloud_x64.msi' -OutFile 'c:\wvd\agent.msi'
Invoke-Expression -Command 'msiexec /i c:\wvd\agent.msi /qn ADDLOCAL=ALL /l*v c:\wvd\apexone_install.log'
