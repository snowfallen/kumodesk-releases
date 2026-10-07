cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.9"
  sha256 arm:   "9c72892c2f5456ccc9a920980b259b5a5e90171ad0346b6f6ec6a914f8b4e813",
         intel: "486c031030b266f2145fbdff515659b970859ae2d00be31f1440b5a0df3fceff"

  url "https://github.com/snowfallen/kumodesk-releases/releases/download/v#{version}/kumodesk-#{version}-#{arch}.dmg"
  name "Kumodesk"
  desc "Infinite board for your windows"
  homepage "https://github.com/snowfallen/kumodesk-releases"

  app "Kumodesk.app"

  # The app is not signed yet; without this macOS refuses to start it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Kumodesk.app"]
  end

  zap trash: "~/Library/Application Support/kumodesk"
end
