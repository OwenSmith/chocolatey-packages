
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$updateUrl 	= 'https://pvupdates.vmd.citrix.com/updates.9.3.2.110.json'
$userAgent 	= 'choco-install'

$json = Invoke-RestMethod -Uri $updateUrl -UserAgent $userAgent

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  softwareName  = 'xenserver-pv-tools*'
  url           = $json.x86.url
  url64bit      = $json.x64.url
  checksum      = $json.x86.checksum
  checksum64    = $json.x64.checksum
  checksumType  = 'sha256'
  checksumType64= 'sha256'

  # MSI
  silentArgs    = "/qn ALLOWDRIVERINSTALL=YES /log `"$env:TEMP\chocolatey\$($packageName)\$($packageName).Install.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
