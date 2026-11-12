cask "purah" do
  version "0.7.20"
  sha256 "39a16b720b897bc7dd2cd538f515958de21db9c5da96a7c7efad6ee2ada30bff"

  url "https://github.com/rheatin/Purah/releases/download/v#{version}/Purah-v#{version}-macOS.zip"
  name "Purah"
  desc "Magnetic edge rails for files, notes, music and scripts"
  homepage "https://github.com/rheatin/Purah/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Purah.app"

  # Homebrew quarantines cask downloads on purpose so Gatekeeper can judge them.
  # Purah is self-signed rather than notarized, so that verdict is always
  # "cannot be opened" — the flag is cleared here, which leaves the app in the
  # same state as one built on this machine. Delete this block the day a
  # Developer ID certificate signs a release.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Purah.app"]
  end

  caveats <<~EOS
    Purah is self-signed, not notarized by Apple, and this tap clears the
    download quarantines Homebrew applies for that reason. The DMG from
    https://github.com/rheatin/Purah/releases/latest goes through Gatekeeper
    as usual if you would rather approve it yourself.
  EOS
end
