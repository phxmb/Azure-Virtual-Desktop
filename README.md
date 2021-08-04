# Azure-Virtual-Desktop

**AVCustomisationV1.ps1**

The AVDCustomisation.ps1 script will do the following:

- Download and install the UK language pack (based on https://docs.microsoft.com/en-us/azure/virtual-desktop/language-packs)
- Download and install the latest release of FSLogix (note: FSLogix comes pre installed on the EMS marketplace images, But this will ensure it is upgraded to the latest version)
- Configure registry with AVD best practice settings (as stated in https://docs.microsoft.com/en-us/azure/virtual-desktop/set-up-customize-master-image)
- Optional installation of Chocolatey Package Manager
- Download and configuration of the AVD Optimisation Scripts (https://github.com/The-Virtual-Desktop-Team/Virtual-Desktop-Optimization-Tool
- Creates a local copy of the FSLogix Redirections.xml in C:\AVD\FSLogix (this can be referenced using Group Policy)
- Configures Microsoft Defender Exclusions

Note: Teams (per machine), Onedrive (per machine) and FSLogix are pre installed on the EMS Builds

**M365AFE-Visio-Project.ps1**

The M365AFE-Visio-Project.ps1 script will do the following:

- Creates a C:\M365 directory
- Downloads and extracts the Office Deployment tool (https://www.microsoft.com/en-us/download/details.aspx?id=49117)
- Creates a customisation.xml file in C:\M365
- Installs Microsoft 365 Apps for Enterprise (based on the parameters in the customisation.xml file)

The contents of the xml file can be created using https://config.office.com/
Create the xml file and past the output into the script

Select all the applications you want. Deselected applications will be removed.

From my testing, it does not appear to remove OneDrive (per machine) or Teams (per machine)
