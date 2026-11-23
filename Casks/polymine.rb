cask "polymine" do
  version "0.1.0"

  on_arm do
    url "https://github.com/uvw/polymine/releases/download/v#{version}/Polymine_#{version}_aarch64.dmg"
    sha256 "9c5756259eba8e776037322b530a54c3b429b647c6eaaed1fa06ab7e2a173e8f"
  end
  on_intel do
    url "https://github.com/uvw/polymine/releases/download/v#{version}/Polymine_#{version}_x64.dmg"
    sha256 "ceb509909d95f2da5fcca5cb6d62567088b6a356ccc9de5cd89e8b54acafc3b0"
  end

  name "Polymine"
  desc "Minesweeper on many tilings, with an assistant that plays for real"
  homepage "https://github.com/uvw/polymine"

  # The app installs its own updates, so brew upgrade skips it unless --greedy.
  auto_updates true

  app "Polymine.app"
  binary "#{appdir}/Polymine.app/Contents/MacOS/polymine-cli"

  zap trash: [
    "~/Library/Application Support/Polymine",
    "~/Library/Application Support/dev.uvw.polymine",
    "~/Library/Logs/dev.uvw.polymine",
  ]

  caveats <<~CAVEATS
    Polymine isn't signed or notarized yet, so macOS blocks its first launch.
    Open it once, then go to System Settings > Privacy & Security and click
    Open Anyway. Or run:
      xattr -dr com.apple.quarantine "#{appdir}/Polymine.app"
  CAVEATS
end
