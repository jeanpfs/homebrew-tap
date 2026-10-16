cask "bossa" do
  arch arm: "arm64"

  version "0.1.0"
  sha256 "7619ef1f95be9a2eb29fec8a3840e35457056c3f85cfdcc87cff2b8bc480f4d4"

  url "https://github.com/jeanpfs/bossa/releases/download/v#{version}/Bossa-#{version}-macos-#{arch}.zip"
  name "Bossa"
  desc "Unofficial menu-bar app for Bose QC Ultra headphones"
  homepage "https://github.com/jeanpfs/bossa"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Bossa.app"

  zap trash: [
    "~/Library/Application Support/Bossa",
    "~/Library/Preferences/dev.jeanpfs.bossa.plist",
  ]

  caveats <<~EOS
    Bossa is ad-hoc signed and not notarized. If Gatekeeper blocks the first launch, run:
      xattr -dr com.apple.quarantine /Applications/Bossa.app
  EOS
end
