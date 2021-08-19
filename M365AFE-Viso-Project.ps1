if (!(test-path -path c:\m365)) {new-item -path c:\m365 -itemtype directory} 

Set-Location c:\m365

Start-BitsTransfer -Source 'https://download.microsoft.com/download/2/7/A/27AF1BE6-DD20-4CB4-B154-EBAB8A7D4A7E/officedeploymenttool_14131-20278.exe' -Destination 'c:\m365\OfficeDeploymentTool.exe' -Priority High -TransferPolicy Always -ErrorAction Continue -ErrorVariable $ErrorBits
Start-Process -FilePath 'C:\m365\OfficeDeploymentTool.exe' -ArgumentList '/extract:c:\m365\ /quiet' -Wait

    if (!(test-path -path c:\m365\Configuration.xml)) {new-item -path c:\m365 -name configuration.xml -ItemType File -Value '
    <Configuration ID="09b09eef-987f-456e-8adc-5611943f0cb8">
  <Info Description="" />
  <Add OfficeClientEdition="64" Channel="Current">
    <Product ID="O365ProPlusRetail">
      <Language ID="MatchOS" />
      <ExcludeApp ID="Groove" />
      <ExcludeApp ID="Lync" />
      <ExcludeApp ID="OneDrive" />
      <ExcludeApp ID="Teams" />
    </Product>
    <Product ID="VisioProRetail">
      <Language ID="MatchOS" />
      <ExcludeApp ID="Groove" />
      <ExcludeApp ID="Lync" />
      <ExcludeApp ID="OneDrive" />
      <ExcludeApp ID="Teams" />
    </Product>
    <Product ID="ProjectProRetail">
      <Language ID="MatchOS" />
      <ExcludeApp ID="Groove" />
      <ExcludeApp ID="Lync" />
      <ExcludeApp ID="OneDrive" />
      <ExcludeApp ID="Teams" />
    </Product>
  </Add>
  <Property Name="SharedComputerLicensing" Value="1" />
  <Property Name="SCLCacheOverride" Value="0" />
  <Property Name="AUTOACTIVATE" Value="0" />
  <Property Name="FORCEAPPSHUTDOWN" Value="TRUE" />
  <Property Name="DeviceBasedLicensing" Value="0" />
  <Updates Enabled="TRUE" />
  <RemoveMSI />
  <AppSettings>
    <Setup Name="Company" Value="Company Name" />
    <User Key="software\microsoft\office\16.0\excel\options" Name="defaultformat" Value="51" Type="REG_DWORD" App="excel16" Id="L_SaveExcelfilesas" />
    <User Key="software\microsoft\office\16.0\powerpoint\options" Name="defaultformat" Value="27" Type="REG_DWORD" App="ppt16" Id="L_SavePowerPointfilesas" />
    <User Key="software\microsoft\office\16.0\word\options" Name="defaultformat" Value="" Type="REG_SZ" App="word16" Id="L_SaveWordfilesas" />
  </AppSettings>
  <Display Level="Full" AcceptEULA="TRUE" />
</Configuration>'
    }

Start-Sleep -Seconds 10

Start-Process -FilePath 'C:\m365\setup.exe' -ArgumentList '/configure c:\m365\configuration.xml' -Wait

