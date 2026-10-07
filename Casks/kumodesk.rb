cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.12"
  sha256 arm:   "e332eebe878e945d213c7c4ab19c6bbbf6195e03ec93404123e35664619a43a7",
         intel: "899c64f9dc90424dcd01476991fc11095795ac2f5942cd2c7ef3048d7834c71f"

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
