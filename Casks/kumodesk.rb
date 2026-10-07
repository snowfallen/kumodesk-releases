cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.10"
  sha256 arm:   "14050b879b33f3766f6f72815901696410fb29f9031ef62a7d6a12ef4228f190",
         intel: "b94287fad035dc95aa03a96b07880d314583b33819985f10343d408126d86d44"

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
