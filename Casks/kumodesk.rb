cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.26"
  sha256 arm:   "a4a7160dc93c788f317ff49089d3115de744e0a5204b018cea98b4dc35a6493d",
         intel: "98c9cc9a214cb1c5227e96fb7352b5a893177daf7053634d6ca99cc90bb6de3d"

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
