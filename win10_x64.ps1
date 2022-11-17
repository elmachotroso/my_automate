# Windows 10 powershell script to automate install of applications for new Win10 machines

# install chocolatey
Write-Host "Checking existence of Chocolatey..."
if( $null -eq (Get-Command "choco.exe" -ErrorAction SilentlyContinue) )
{
    Write-Host "Could not find chocolatey (choco.exe) installation."
    Exit 1
}
$choco_location=(where choco)
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
choco install beyondcompare -y
choco install android-studio -y
choco install audacity -y
choco install dotnet -y
choco install filezilla -y
choco install firefox -y
choco install thunderbird -y
choco install barrier -y
choco install javaruntime -y
choco install jdk11 -y
choco install postman -y
choco install putty -y
choco install vcredist-all -y
choco install veeam-agent -y
choco install winlibs -y
choco install epicgameslauncher -y
choco install cmake --installargs 'ADD_CMAKE_TO_PATH=System' -y
choco install unity-hub -y --ignore-checksums
