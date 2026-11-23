class Claudes < Formula
  desc "Manage Claude Code sessions: list, pin, restart, pause, and resume"
  homepage "https://github.com/uvw/claudes"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.8.0/claudes_0.8.0_darwin_arm64.tar.gz"
      sha256 "2d996b9c48d245e3a627c2181d6183fcd0cb7ff8aef08b292b05e9a231393f99"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.8.0/claudes_0.8.0_darwin_amd64.tar.gz"
      sha256 "35de0661d3c61cac5ca15cb77e4ec748f30ab1ce04a4aaae57554f5dbb31b1a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.8.0/claudes_0.8.0_linux_arm64.tar.gz"
      sha256 "21aee323adf781da2e1886e95d31e9c271a9cd27837c621a8c2c37dbec5b61a4"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.8.0/claudes_0.8.0_linux_amd64.tar.gz"
      sha256 "3aa40871b757f27435d4dc18dd75578b0cdeab3b4c290d28340cea00374f716e"
    end
  end

  def install
    bin.install "claudes"
    generate_completions_from_executable(bin/"claudes", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claudes --version")
  end
end
