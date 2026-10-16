cask "bossa" do
  arch arm: "arm64"

  version "0.1.1"
  sha256 "b4ed5a2913ebd610f16f572a251b51c616bf5a0a0dbe79d2200e9d42c8576277"

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
