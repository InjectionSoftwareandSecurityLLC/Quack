const createWindowsInstaller = require('electron-winstaller').createWindowsInstaller
const path = require('path')

getInstallerConfig()
  .then(createWindowsInstaller)
  .catch((error) => {
    console.error(error.message || error)
    process.exit(1)
  })

function getInstallerConfig () {
  console.log('Creating Windows installer')
  const rootPath = path.join('./')
  const outPath = path.join(rootPath, 'release-builds')

  return Promise.resolve({
    appDirectory: path.join(outPath, 'Quack-win32-x64/'),
    authors: '3ndG4me',
    noMsi: true,
    outputDirectory: path.join(outPath, 'windows-installer'),
    exe: 'Quack.exe',
    setupExe: 'Quack-Install.exe',
    setupIcon: path.join(rootPath, 'assets', 'icons', 'win', '256x256.ico')
  })
}