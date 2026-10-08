cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.19"
  sha256 arm:   "21c6256a57f89331d998f3928812c6a8f8c6551f17a60eb49600b6abb46a2c34",
         intel: "14b66cc2d7c8f9a8b954c5c213513927d2c00384750177ea74548753fcd34b82"

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
