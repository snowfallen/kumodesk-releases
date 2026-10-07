cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11"
  sha256 arm:   "adfc5bb9b78ef7d25a7ddd26caeec63c9614da3c1131663ce2c8f29bbca2533e",
         intel: "84b800897f3515abb1f91b424c2a4b676048d741e5084891c0da7674bc361c9f"

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
