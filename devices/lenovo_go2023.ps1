# Windows 11 powershell script to automate install of applications for new Lenovo Legion Go

# install chocolatey
Write-Host "Checking existence of Chocolatey..."
if( $null -eq (Get-Command "choco.exe" -ErrorAction SilentlyContinue) )
{
    Write-Host "Could not find chocolatey (choco.exe) installation."
    Exit 1
}
$choco_location=(Where-Object choco)
Write-Host "Chocolatey found in $choco_location"

# Install packages via chocolatey
choco install powertoys -y
choco install 7zip -y
choco install git -y
choco install git-lfs -y
choco install vlc -y
choco install k-litecodecpackfull -y
choco install libreoffice -y
choco install vscode -y
choco install beyondcompare --version 4.4.7.20240301 -y
choco install googledrive -y
choco install gdrive -y
#choco install android-studio -y
#choco install audacity -y
choco install dotnet -y
choco install filezilla -y
choco install firefox -y
#choco install thunderbird -y
choco install javaruntime -y
choco install jdk8 -y
choco install putty -y
choco install vcredist-all -y
choco install winlibs -y
choco install steam-client -y --ignore-checksums
choco install epicgameslauncher -y
choco install cmake --installargs 'ADD_CMAKE_TO_PATH=System' -y
choco install spotify -y
