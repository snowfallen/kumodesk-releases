cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.30"
  sha256 arm:   "17ba627ba4e072846a37fdf361ba2efea38c6452e559087f1edc284a9af2213b",
         intel: "033d9b57ae373964a92119f3f068b3e49839cc28cf02fb096c6c7f02a235b8a8"

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
