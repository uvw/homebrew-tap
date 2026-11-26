class Claudes < Formula
  desc "Manage Claude Code sessions: list, pin, restart, pause, and resume"
  homepage "https://github.com/uvw/claudes"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.9.1/claudes_0.9.1_darwin_arm64.tar.gz"
      sha256 "63d2adf3952cb55a06d7f4bf3ec68d48156f9ed7d0469335928b0af97e0b30aa"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.9.1/claudes_0.9.1_darwin_amd64.tar.gz"
      sha256 "0809f2f0bb39ce2a1f7ffc567371739a47a54f5033e9264b4af2fefc2527b5f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.9.1/claudes_0.9.1_linux_arm64.tar.gz"
      sha256 "c9ba698c4fddc6e53be38a5ec047b2705f990986ed620b6a4b0043f599430a3a"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.9.1/claudes_0.9.1_linux_amd64.tar.gz"
      sha256 "3f9a99cab0313c15757749a69d058a8c4e63a8abc426f54908724d549babf028"
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
