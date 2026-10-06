cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.7"
  sha256 arm:   "67d18d8429fa64b03f67acf346df4eb7868de6ebbf8205b7c6654e4640c96710",
         intel: "48260c082343e05f26d4fdd91d0b0e79596304786dc7f6dc79a22e9abbd46c14"

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
