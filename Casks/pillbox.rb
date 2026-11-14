cask "pillbox" do
  version "0.7.1"
  sha256 "236935abe76b8085148a81136f2fc613d05913e1d5fd298040e54990604a32ae"

  url "https://github.com/Arrows78/Pillbox/releases/download/v#{version}/Pillbox-#{version}.zip"
  name "Pillbox"
  desc "Notch island with music, timers, clipboard, files and system alerts"
  homepage "https://github.com/Arrows78/Pillbox"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Pillbox.app"

  # Your own files are never removed.
  zap trash: [
    "~/Library/Application Support/Pillbox",
    "~/Library/Preferences/dev.labs.pillbox.plist",
  ]

  caveats <<~EOS
    Pillbox is signed ad hoc and not notarized, so macOS blocks the first launch.
    Open System Settings > Privacy & Security and click "Open Anyway",
    or run: xattr -dr com.apple.quarantine /Applications/Pillbox.app
  EOS
end
