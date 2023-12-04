
$updateUrl 	= 'https://pvupdates.vmd.citrix.com/updates.9.3.1.91.json'
$userAgent 	= 'choco-install'

$json = Invoke-RestMethod -Uri $updateUrl -UserAgent $userAgent

Write-Host "UpdateUrl = "$updateUrl
Write-Host "  url           = "$json.x86.url
Write-Host "  url64bit      = "$json.x64.url
Write-Host "  checksum      = "$json.x86.checksum
Write-Host "  checksum64    = "$json.x64.checksum
