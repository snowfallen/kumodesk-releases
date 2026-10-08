cask "kumodesk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.20"
  sha256 arm:   "d903165594e91108c7940c3a700d78250f20e595bee53ee14e9d79b22dfc3fe4",
         intel: "926bc526342dc32f35f574e40e7eebdb121c00aa49fdb5c7810fd8eaa5fbdb98"

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
