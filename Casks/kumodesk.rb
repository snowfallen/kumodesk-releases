cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.4"
  sha256 arm:   "328cd120d2f4896a3ce22f210f2f4da3973d9faec5f5e290ead1ad1da43ad5b0",
         intel: "426dfc001da73736616fe600a3c5ba78c442387171693fd47a53032bc2ea0a24"

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
