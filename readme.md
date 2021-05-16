# Drive Inventory
##  Description
This script reads our basic parameters (like serial number or drive size) of a connected USB-Drive and writes it to a json file in the user space. On the drive itself, a LostAndFound.txt-File will be stored.
## Motivation
I have loads of USB Pendrives and HDDs I use for backups and file transfers. Therefore, i am struggeling to keep an overview over those devices, and what's stored on them. This script should help me create an inventory of my storage devices.
Additionally, I asked myself what happens when one of my pendrives would get lost. So LostAndFound.txt-File should help the finder to return it to me.
## Getting Started
- *Plugin* USB-Drive
- Make sure it has been assigned to *Drive D:*
- If Device has been plugged for the first time, *run script* `inventoryAdd.ps1`
- Otherwise run `inventory.ps1` to update the inventory
Data is stored in the user profile at: `%appdata%\.inventory\`

## Environment
This program has been devolped under the following environment:
- Win10: 2004
- Powershell Version: 5.1.19041.906

##  What's in Program?
- Get-WmiObject: Gets instances of Windows Management Instrumentation (WMI).
- Get-CimInstance: Gets the CIM instances of a class. CIM is a Common Information Model (CIM) like the Windows Management Instrumentation (WMI) service.
- New-Object: Create a new object to arrange the information and enrich it with new information.
- hash: A Hash-Table assigns value pair, e.g. DriveType Codes to better understable String.
- Test-Path: Before working with a path, check if it exits already. Return TRUE if it does.
