cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.35"
  sha256 arm:   "d245f183bb3d77ad06882492ce3fa81e73b1e1c2c9e3ed6d0d3bc7e0df90c226",
         intel: "f0c301a48a85f104f827bdff7526d69fcfc01fe95487ce6089e57839b945ba8d"

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
