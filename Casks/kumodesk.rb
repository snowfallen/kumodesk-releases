cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.36"
  sha256 arm:   "405832c4f8c9653aa94fdfc438e589f40eb6c521e17b18e811a0d418f74996e2",
         intel: "8c80986a3d9a576788828e1214671f185b81baa151c40708e0befdca71c29813"

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
