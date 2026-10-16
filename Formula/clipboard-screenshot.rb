class ClipboardScreenshot < Formula
  desc "Copy every new macOS screenshot to the clipboard automatically"
  homepage "https://github.com/jeanpfs/clipboard-screenshot"
  url "https://github.com/jeanpfs/clipboard-screenshot/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7b0f563ae33e1cb221e9d0cd01b078f672247a40cb7edadb31906948a638a6f0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos

  def install
    libexec.install "install.sh", "uninstall.sh", "watcher.sh", "launchd"

    (bin/"clipboard-screenshot-install").write <<~SH
      #!/bin/zsh
      cd "#{libexec}" && exec ./install.sh "$@"
    SH
    (bin/"clipboard-screenshot-uninstall").write <<~SH
      #!/bin/zsh
      cd "#{libexec}" && exec ./uninstall.sh "$@"
    SH
    chmod 0755, [bin/"clipboard-screenshot-install", bin/"clipboard-screenshot-uninstall"]
  end

  def caveats
    <<~EOS
      Homebrew only places the scripts. To start watching for screenshots, run:
        clipboard-screenshot-install

      To stop and restore your previous screenshot settings, run:
        clipboard-screenshot-uninstall
      before `brew uninstall clipboard-screenshot`.
    EOS
  end

  test do
    assert_predicate libexec/"install.sh", :executable?
    assert_predicate bin/"clipboard-screenshot-install", :executable?
  end
end
