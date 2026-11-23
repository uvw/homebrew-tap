cask "polymine" do
  version "0.1.1"

  on_arm do
    url "https://github.com/uvw/polymine/releases/download/v#{version}/Polymine_#{version}_aarch64.dmg"
    sha256 "c5a7fe5cf1add1576b9d4dfe0c9f32f43a7cdbf240ec30eb67f543ebde2c0892"
  end
  on_intel do
    url "https://github.com/uvw/polymine/releases/download/v#{version}/Polymine_#{version}_x64.dmg"
    sha256 "e95d5106a6b4ba3c59f015cbf20353ff22bcb12594d51b9be13a931c57ce8481"
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
