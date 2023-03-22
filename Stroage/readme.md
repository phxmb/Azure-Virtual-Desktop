AzureFilesPremiumResize.ps1

This script will resize an Azure Files Premium File Share so that it only has 20% free space (percentage is configurable). It is recommended that this script is run daily or weekly from an Azure automation account (or similar) to prevent the file share running out of space or costing more than it needs to.

The primary purpose is to use with the FSLogix file share for AVD environment, although it can be used for other purposes.

Do not run more than once every 24 hours as it is only possible to reduce the file share once per day.

Test before using in production.!
