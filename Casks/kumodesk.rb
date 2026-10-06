cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.6"
  sha256 arm:   "e83ae6e6ff0a02650eadfabbc9a597dbc95cc14dcaa1f9e177ee4869b730eaf8",
         intel: "40997e4e11a64022d9111d8322ccf29d531a226749ae159c2d86bd7b614bcf29"

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
