cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.16"
  sha256 arm:   "55e2be471b5b7fee887c06ec49ddea432e8a5cab6d3792e3aef38e003aeb7928",
         intel: "16f68bf4328167d2a4e75f9531933a412ac7f43a2107410bfffcce99a5fe8a25"

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
