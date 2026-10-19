cask "bossa" do
  arch arm: "arm64"

  version "0.1.2"
  sha256 "e3a861cbf76386971dda4266ddf7f8b12c3da1dde9f8cc618fff5e746e8efc8b"

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
