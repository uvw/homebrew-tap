class Claudes < Formula
  desc "Manage Claude Code sessions: list, pin, restart, pause, and resume"
  homepage "https://github.com/uvw/claudes"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.6.0/claudes_0.6.0_darwin_arm64.tar.gz"
      sha256 "11e9ef3b52af862dda99d9a971d9151c6b41cc631e4dc70f257527834edea6a8"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.6.0/claudes_0.6.0_darwin_amd64.tar.gz"
      sha256 "0b80fed6eeb192798f27bbff5c69d96d919d643bd771e23d7243b59efe69db34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.6.0/claudes_0.6.0_linux_arm64.tar.gz"
      sha256 "45a5eae9e8dcf1b6549a635457afada5daf679dcc7738d2109efd0c242f7b591"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.6.0/claudes_0.6.0_linux_amd64.tar.gz"
      sha256 "00e285ff03781d4c7a8f2d250bc373ac480670b9ab7529be1eeb7408cec4b92c"
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
