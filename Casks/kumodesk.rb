cask "kumodesk" do
  arch arm: "-arm64", intel: ""

  version "0.1.2"
  sha256 arm:   "f6cc3894158b546915e12ebf0f077bc6c8e51d5fd3d1648b851cff15615306c0",
         intel: "8386e780e5d0f4eeef3486766d2056c5d18ca0be1587b9237eb7584bd1a5fafb"

  url "https://github.com/snowfallen/kumodesk-releases/releases/download/v#{version}/kumodesk-#{version}#{arch}.dmg"
  name "kumodesk"
  desc "Infinite board for your windows"
  homepage "https://github.com/snowfallen/kumodesk-releases"

  app "kumodesk.app"

  # The app is not signed yet; without this macOS refuses to start it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/kumodesk.app"]
  end

  zap trash: "~/Library/Application Support/kumodesk"
end
