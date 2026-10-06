cask "kumodesk" do
  arch arm: "-arm64", intel: ""

  version "0.1.3"
  sha256 arm:   "5bca3c660c1910695e2ca8d7908eda16ffd12909d0a8cf593500b50c95bff93f",
         intel: "72fe22448cf7abd3342b0db8b970c50d8a995d758dd9fefc0ba81fa1a8596cd5"

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
