cask "polymine" do
  version "0.2.0"

  on_arm do
    url "https://github.com/uvw/polymine/releases/download/v#{version}/Polymine_#{version}_aarch64.dmg"
    sha256 "9eeec162b66a9df91366c6bab5b29bca2fe94e86f0624c9ff205e2fcbcf78fde"
  end
  on_intel do
    url "https://github.com/uvw/polymine/releases/download/v#{version}/Polymine_#{version}_x64.dmg"
    sha256 "df09a92110caa92fa6235d31778d6fbc6cd5f97249ca01194cdc0d37ed169714"
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
