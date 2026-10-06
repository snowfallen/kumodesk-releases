cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.8"
  sha256 arm:   "5e4c27e65f94e46b6c4ba6e2dcd74371b5c67e1466262f987fd64ddb05d9d8a4",
         intel: "ace08cc4d5dd4dc1f4b858269ee58a201e7963ee6fd1cd19a019febc10697da5"

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
