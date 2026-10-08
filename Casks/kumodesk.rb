cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.14"
  sha256 arm:   "5b8a0204c54ea8f3c40c18b582198c02c283f678bad1b39fdeb09aa4ac86c175",
         intel: "3d61986702be86383c4d81233e29f832a5642b5af6d8c00e1fee34f359d47f44"

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
