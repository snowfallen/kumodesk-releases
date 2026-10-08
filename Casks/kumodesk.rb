cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.22"
  sha256 arm:   "53002eca6d7e202fec39f9baf9ce8e85d971933c9351d20f00c0e4b70de7b5db",
         intel: "1f8ab1efd02fcb281cf67f687fb472b5954c37f1aff0793f9811b58dfbedf224"

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
