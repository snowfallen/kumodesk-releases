cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.21"
  sha256 arm:   "cd6e35f64c00fea8829fc2b43a32f51f638be4096e5b8baf096ec8e61aa59952",
         intel: "322d0866969e881874703e9ea81c2ba6a987610486374b16a94cf364a0ec6470"

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
