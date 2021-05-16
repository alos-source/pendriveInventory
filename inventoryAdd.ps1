$myUserPath=$Env:appdata+"\.inventory\" #userprofile+"\SynologyDrive\Dokumente\Projekte\SpeicherInventar\"
$myFileExt=".txt"
$inventarDrive="D:"
$inventarFolder=".inventory"
$lostAndFoundFile='\lostAndfound.txt'

# create inventory-folder on drive and copy lost&found templateget

if (!(Test-Path $inventarDrive$inventarFolder)) 

{Write-Output "start inventory"

New-Item -Path $inventarDrive$inventarFolder -ItemType Directory

if(!(Test-Path $inventarDrive\LostAndFound.txt)) {Copy-Item -Path $myUserPath"\LostAndFound.txt" -Destination $inventarDrive}

$PSScriptRoot
& "$PSScriptRoot\inventory.ps1"

}
else 
{
Write-Output "inventory already availble"
}