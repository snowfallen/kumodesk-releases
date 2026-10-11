cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.27"
  sha256 arm:   "70641836d1274aea4280c44851c679692b96309a63e7521210e6fe392701ac44",
         intel: "673208de92f69b02a30ec4759de1695f11779f55d33155e17dc5db5b5be3c794"

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
