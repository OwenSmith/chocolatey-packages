
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  softwareName  = 'xenserver-pv-tools*'
  url           =  'http://downloadns.citrix.com.edgesuite.net/17489/managementagent-9.3.3-x86.msi'
  url64bit      =  'http://downloadns.citrix.com.edgesuite.net/17488/managementagent-9.3.3-x64.msi'
  checksum      =  '223BD7DB91CB02D139E4882FEAA3288A7BBF5E6795B5B4A79E9D7A9F7B1F3B49'
  checksum64    =  'AB2D190509427101418BABABA363C9D31DC25E5490449872B39AA5CD370031E1'
  checksumType  = 'sha256'
  checksumType64= 'sha256'

  silentArgs    = "/qn ALLOWDRIVERINSTALL=YES /log `"$env:TEMP\chocolatey\$($packageName)\$($packageName).Install.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
