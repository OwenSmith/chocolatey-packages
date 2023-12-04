
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  softwareName  = 'xenserver-pv-tools*'
  url           =  'http://downloadns.citrix.com.edgesuite.net/17462/managementagentx86.msi'
  url64bit      =  'http://downloadns.citrix.com.edgesuite.net/17461/managementagentx64.msi'
  checksum      =  'AD7CC72E77F1F63AD5028F00C50AAD0A06D4003DDB97F30F5B835162F751A46C'
  checksum64    =  '14C0C488E1F631291220D0660811413C0CC7537D7497DE93E76CF8790DC4A986'
  checksumType  = 'sha256'
  checksumType64= 'sha256'

  silentArgs    = "/qn ALLOWDRIVERINSTALL=YES /log `"$env:TEMP\chocolatey\$($packageName)\$($packageName).Install.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
