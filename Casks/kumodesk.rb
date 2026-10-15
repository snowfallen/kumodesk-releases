cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.34"
  sha256 arm:   "33223e6921ccad952ad8afee4ff13a0fb8a9eb7be83c5744d8224b762f22cf6f",
         intel: "b05908347b18271f65ebfda9d3df037ae75939fa6e7ff051d1323ba3feffc9c1"

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
