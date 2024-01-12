
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  softwareName  = 'xenserver-pv-tools*'
  url           =  'http://downloadns.citrix.com.edgesuite.net/17481/managementagentx86.msi'
  url64bit      =  'http://downloadns.citrix.com.edgesuite.net/17480/managementagentx64.msi'
  checksum      =  'B0FA92E6B361B63EDC91AA59DA5FAF22EA16584975CC2CCBA4A8FB322431FA2C'
  checksum64    =  '74473FB1A1CA9BCFEE933310B1A83A971698B0405AAF6EF45BB32393925F6286'
  checksumType  = 'sha256'
  checksumType64= 'sha256'

  silentArgs    = "/qn ALLOWDRIVERINSTALL=YES /log `"$env:TEMP\chocolatey\$($packageName)\$($packageName).Install.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
