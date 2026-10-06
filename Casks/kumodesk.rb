cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.5"
  sha256 arm:   "1bd443a223154b76455677518962d528dbdf65b1a9bd6ce50f6db6f60a336623",
         intel: "ad5a060f8f3e792242f7a222ca4db6331218964dfc089fe2dd1e0eecc22f7146"

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
