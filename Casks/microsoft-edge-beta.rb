cask 'microsoft-edge-beta' do
  version '77.0.235.27'
  sha256 '418fb2aad9a88519e8516ff009957ff546e3086a96864f20917a9eda2dbe7d47'

  # officecdn-microsoft-com.akamaized.net was verified as official when first introduced to the cask
  url "https://officecdn-microsoft-com.akamaized.net/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/MicrosoftEdgeBeta-#{version}.pkg"
  appcast 'https://officecdn-microsoft-com.akamaized.net/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/0409EDBT01-chk.xml',
          configuration: "#{version.major}.#{version.patch}"
  name 'Microsoft Edge Beta'
  homepage 'https://www.microsoftedgeinsider.com/'

  auto_updates true

  pkg "MicrosoftEdgeBeta-#{version}.pkg"

  uninstall pkgutil: 'com.microsoft.edgemac.Beta'

  zap launchctl: [
                   'com.microsoft.autoupdate.helper',
                   'com.microsoft.update.agent',
                 ],
      pkgutil:   'com.microsoft.package.Microsoft_AutoUpdate.app',
      trash:     [
                   '/Library/PrivilegedHelperTools/com.microsoft.autoupdate.helper',
                   '~/Library/Preferences/com.microsoft.edgemac.Beta.plist',
                   '/Library/Application Support/Microsoft',
                   '~/Library/Application Support/Microsoft Edge Beta',
                 ]
end
