class Claudes < Formula
  desc "Manage Claude Code sessions: list, pin, restart, pause, and resume"
  homepage "https://github.com/uvw/claudes"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.3.0/claudes_0.3.0_darwin_arm64.tar.gz"
      sha256 "d830e2da189a9e17ff2405a55e18dc29137fdba80218cd5ae16f962f8e2912eb"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.3.0/claudes_0.3.0_darwin_amd64.tar.gz"
      sha256 "6432ae5d3f0185119cfbb0a479377cc62ce3523cec982ed707617f138442d955"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.3.0/claudes_0.3.0_linux_arm64.tar.gz"
      sha256 "5e2f1b50e657191ac973d7323f8a9e4a80b023507352b26a870f34d8d49ce477"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.3.0/claudes_0.3.0_linux_amd64.tar.gz"
      sha256 "214f9c2dcd229d0a1dcbe0e38ea53c967b3d4226808672962aeb738a9d63dd51"
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
