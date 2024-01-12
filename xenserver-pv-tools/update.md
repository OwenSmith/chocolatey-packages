How to Update XenTools versions.

1. Edit getpackages.ps1
    Edit the $UpdateUrl variable to point to the new update.json file

2. Execute getpackages.ps1
    This will output the required URLs and checksums

3. Copy/Paste URLs and checksums into tools\chocolateyinstall.ps1
    Overwrite the previous URLs

4. Modify the version in xenserver-pv-tools.nuspec

5. Add and Commit the changes

6. Push nuspec to public (community) chocolatey repo
    choco push .\xenserver-pv-tools.nupkg --source https://push.chocolatey.org/

7. Push repo changes to github
    git push origin main
