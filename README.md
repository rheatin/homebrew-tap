# Purah Homebrew Tap

```bash
brew install --cask rheatin/tap/purah
```

That single command taps this repository and installs [Purah](https://github.com/rheatin/Purah).

Purah is **self-signed, not notarized by Apple** — there is no paid Developer
Account behind it. Homebrew applies the macOS quarantine flag to cask downloads
so Gatekeeper can judge them, and an unnotarized app can never pass that check,
so the cask clears the flag after install. If you would rather let Gatekeeper
evaluate the download yourself, install from the
[DMG](https://github.com/rheatin/Purah/releases/latest) instead.

Upgrades work with `brew upgrade --cask purah`, or through Purah's own in-app
updater.
