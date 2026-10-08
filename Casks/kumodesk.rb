cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.25"
  sha256 arm:   "236fb7a5a19d0e852888d2d9675b15e12ee1bbb78848ba22a8195d49429f1b2d",
         intel: "5705ae4eb6bec6e0593d5bc91ad9609f5b68ac47d619645d344f4498d321de63"

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
