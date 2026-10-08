cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.17"
  sha256 arm:   "e24ccd9a19840904ec7ac6bc29fd07b7e930a4e2bebef6d19ad5916044504190",
         intel: "8e0b328d1a18e5809d0e21ef3f9cc7b831548320ba98515c5df94dd4685aed1f"

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
