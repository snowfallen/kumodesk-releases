cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.18"
  sha256 arm:   "3133f14f9f157bd4e1974bf6a42dd35ff1ec9ac4c332a13a010c148578b07382",
         intel: "6eb25b63e2b1ad37db88cfefa308994fd0c3c0b0aa4710a312c72062aa1f71d4"

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
