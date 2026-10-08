cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.15"
  sha256 arm:   "8d6bd4f5267cb32607cd995c5e0b8a43dd1d51b7521db6c742bbd0d7d24d7546",
         intel: "e6220924a78653e893d566536035db7df1b6de263ef039f92008ee3e91cd2f1b"

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
