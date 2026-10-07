cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.13"
  sha256 arm:   "5bff42c5c2cc3b73eaef4d4b77842bb6e68d092afd501511a71c0b8ae935a2ef",
         intel: "441c38a84cd1f4177b8148edc81a5a76d6afe1e52f5488ddb8ff7de0c04a9f24"

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
