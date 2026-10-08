cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.24"
  sha256 arm:   "6e91d071f39c2419e50f504030b7e3ae9ce9d442a3cfe2d291752045911c6053",
         intel: "99d5986b452c4de222c6fe18b8800e602ffd89bc7064d460bdac59f7507d14e7"

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
