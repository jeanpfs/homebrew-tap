# homebrew-tap

[Homebrew](https://brew.sh) tap for [jeanpfs](https://github.com/jeanpfs)'s macOS tools.

```bash
brew tap jeanpfs/tap
```

| Name | Type | Install | What it is |
|---|---|---|---|
| [bossa](https://github.com/jeanpfs/bossa) | cask | `brew install --cask jeanpfs/tap/bossa` | Unofficial menu-bar app for Bose QC Ultra headphones (Apple Silicon, macOS 26+) |
| [clipboard-screenshot](https://github.com/jeanpfs/clipboard-screenshot) | formula | `brew install jeanpfs/tap/clipboard-screenshot` | Copies every new macOS screenshot to the clipboard |

## Notes

- **bossa** is ad-hoc signed and not notarized. If Gatekeeper blocks the first launch, run `xattr -dr com.apple.quarantine /Applications/Bossa.app` (the cask prints this after install).
- **clipboard-screenshot** only installs the scripts. Run `clipboard-screenshot-install` to start the launchd agent and `clipboard-screenshot-uninstall` to stop it and restore your screenshot settings.

## Updating

Versions are bumped by hand when a new release is published in the app's repository (`brew livecheck jeanpfs/tap/bossa` shows what is outdated).

## License

MIT, see [LICENSE](LICENSE).
