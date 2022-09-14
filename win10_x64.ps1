# Windows 10 powershell script to automate install of applications for new Win10 machines

# install chocolatey
Write-Output "Checking existence of Chocolatey..."

# Install packages via chocolatey
choco install powertoys -y
choco install 7zip -y
choco install beyondcompare -y
choco install android-studio -y
choco install audacity -y
choco install dotnet -y
choco install filezilla -y
choco install firefox -y
choco install barrier -y
choco install git -y
choco install git-lfs -y
choco install java -y
choco install jr8 -y
choco install k-lite -y
choco install libreoffice -y
choco install notepadplusplus -y
choco install postman -y
choco install putty -y
choco install vcredist -y
choco install veeam-agent -y
choco install vscode -y
choco install winlibs -y
choco install epicgameslauncher -y
choco install cmake --installargs 'ADD_CMAKE_TO_PATH=System' -y
choco install unity-hub -y --ignore-checksums
