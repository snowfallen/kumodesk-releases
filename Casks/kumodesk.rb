cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.23"
  sha256 arm:   "cb8069f243f418c4d4ae0a226c286510d2cdda4a72964d65c2a0627ce48ee13a",
         intel: "523ccb3c4783222334b7acff6e480c7295c54afec7e8739020edcfde2ae6fc46"

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
