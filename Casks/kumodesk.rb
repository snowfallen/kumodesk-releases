cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.32"
  sha256 arm:   "cb3caaf04f0c344c58cfb69cd0b3c738c79a6c04d5399b5629088841e02dcdfb",
         intel: "6448bc58ff41a88cab9882d4b3df7caec9be8434692b694c81624bfc6f1c1d34"

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
