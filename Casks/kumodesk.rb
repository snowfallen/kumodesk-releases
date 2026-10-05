cask "kumodesk" do
  arch arm: "-arm64", intel: ""

  version "0.1.1"
  sha256 arm:   "1f9b13730278ebe39179b95bdeccfb5c81d179e99c3b7ec5f389a88ab044e3b1",
         intel: "9831322f601b4893a5795fc04e48192dc65e7c6e19b3f1a7971981bc85e55a51"

  url "https://github.com/snowfallen/kumodesk-releases/releases/download/v#{version}/kumodesk-#{version}#{arch}.dmg"
  name "kumodesk"
  desc "Infinite board for your windows"
  homepage "https://github.com/snowfallen/kumodesk-releases"

  app "kumodesk.app"

  # The app is not signed yet; without this macOS refuses to start it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/kumodesk.app"]
  end

  zap trash: "~/Library/Application Support/kumodesk"
end
