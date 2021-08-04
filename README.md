# Azure-Virtual-Desktop

The AVDCustomisation script will do the following:

- Download and install the UK language pack (based on https://docs.microsoft.com/en-us/azure/virtual-desktop/language-packs)
- Download and install the latest release of FSLogix (note: FSLogix comes pre installed on the EMS marketplace images, But this will ensure it is upgraded to the latest version)
- Configure registry with AVD best practice settings (as stated in https://docs.microsoft.com/en-us/azure/virtual-desktop/set-up-customize-master-image)
- Optional installation of Chocolatey Package Manager
- Download and configuration of the AVD Optimisation Scripts (https://github.com/The-Virtual-Desktop-Team/Virtual-Desktop-Optimization-Tool
- Creates a local copy of the FSLogix Redirections.xml in C:\AVD\FSLogix (this can be referenced using Group Policy)
- Configures Microsoft Defender Exclusions

Note: Teams (per machine), Onedrive (per machine) and FSLogix are pre installed on the EMS Builds
