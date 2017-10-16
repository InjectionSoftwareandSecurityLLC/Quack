echo Building MacOS
electron-packager . --overwrite --platform=darwin --arch=x64 --icon=assets/icons/mac/icon.icns --prune=true --out=release-builds
echo Building Windows
electron-packager . --overwrite  --platform=win32 --arch=x64 --icon=assets/icons/win/256x256.ico --prune=true --out=release-builds --version-string.CompanyName=CE --version-string.FileDescription=CE --version-string.ProductName="Quack"
echo Building Linux
electron-packager . --overwrite  --platform=linux --arch=x64 --icon=assets/icons/png/256x256.png --prune=true --out=release-builds
echo Packaging MacOS
electron-installer-dmg ./release-builds/Quack-darwin-x64/Quack.app Quack --out=release-builds --overwrite --icon=assets/icons/mac/256x256.icns
echo Packing Windows
node win-package.js
echo Packaging Linux
electron-installer-debian --src release-builds/Quack-linux-x64/ --arch amd64 --config debian.json