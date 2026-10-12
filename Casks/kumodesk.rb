cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.28"
  sha256 arm:   "d6e7014f32eee7b04f104af11cbf0f633c0ec7ee6e614323693f969aca2acdf1",
         intel: "6528007d1fceac4c569bda18e7d362820f53e254065d3f3d69ecc1fb35389cfc"

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
