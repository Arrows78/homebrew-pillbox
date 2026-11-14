cask "pillbox" do
  version "0.7.0"
  sha256 "655a94e716422f754db76c83749b21b3966c99b61244c341ed6cbc4e1e7adea9"

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
