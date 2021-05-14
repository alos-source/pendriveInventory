$myUserPath=$Env:appdata+"\.inventory\" #userprofile+"\SynologyDrive\Dokumente\Projekte\SpeicherInventar\"
$myFileExt=".txt"
$inventarDrive="D:"
$inventarFolder=".inventory"

# read device parameters from drive D: save it to user inventory folder. Only copy, if the drive has been selected for inventory.

$hash = @{

   2 = "RemovableDisk"

   3="FixedLocalDisk"

   4="NetworkDisk"

   5 = "CompactDisk"}

if ((Test-Path $inventarDrive$inventarFolder)) 

{Write-Output "start inventory"


$driveDisk2 = Get-WmiObject win32_logicaldisk
$driveDisk3 = Get-CimInstance Win32_DiskDrive
$content = Get-ChildItem -Path $inventarDrive | Select Name, CreationTime 

$pendrive = New-Object -TypeName PSObject
$pendrive | Add-Member -NotePropertyName Serial -NotePropertyValue $driveDisk3.SerialNumber[1].Trim()
$pendrive | Add-Member -NotePropertyName Model -NotePropertyValue $driveDisk3.Model[1]
$pendrive | Add-Member -NotePropertyName Size -NotePropertyValue $driveDisk3.Size[1]
$pendrive | Add-Member -NotePropertyName VolumeName -NotePropertyValue $driveDisk2.VolumeName[1]
$pendrive | Add-Member -NotePropertyName DriveType -NotePropertyValue $driveDisk2.DriveType[1]
$pendrive | Add-Member -NotePropertyName content -NotePropertyValue $content

$folderType = $hash.item([int]$pendrive.DriveType)

if (!(Test-Path $myUserPath)) {New-Item -Path $myUserPath -ItemType Directory}
if (!(Test-Path $myUserPath\LostAndFound.txt)) {Copy-Item -Path ".\LostAndFound.txt" -Destination $myUserPath}
if (!(Test-Path $myUserPath$folderType)) {New-Item -Path $myUserPath$folderType -ItemType Directory}

$fileInventar=$pendrive.Serial
if (!(Test-Path $myUserPath$folderType\$fileInventar)) {New-Item -Path $myUserPath$folderType\$fileInventar -ItemType Directory}

Write-Output 'Read Drive '$fileInventar
$pendrive | ConvertTo-Json > $myUserPath$folderType\$fileInventar\drive.json

}
else 
{
Write-Output "inventory skipped"
}