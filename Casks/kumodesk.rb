cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.33"
  sha256 arm:   "b6a09d578cde2b49a8afbdef65c64727a8c9d5cc1b34e4dd5e9d19222184fd57",
         intel: "e3a02320d7faa621406b92fcf0f843ac0787f21a8b9fb6243e6bc54e78f9f5f0"

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
