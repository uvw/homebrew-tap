class Claudes < Formula
  desc "Manage Claude Code sessions: list, pin, restart, pause, and resume"
  homepage "https://github.com/uvw/claudes"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.9.0/claudes_0.9.0_darwin_arm64.tar.gz"
      sha256 "c488f684d5a5c7bd30353fcae3ae352c27b72f6a5894bbd038fbc764972427ed"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.9.0/claudes_0.9.0_darwin_amd64.tar.gz"
      sha256 "3eac7ae82026fba76b0dcf16534a0322f2916b8b652f56debde948d18ce45b79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.9.0/claudes_0.9.0_linux_arm64.tar.gz"
      sha256 "fb0e8463cf7ee1ca4158c649a14bf8d4f67c9ac0f04cdcdb2ff9bf2a03a9f1eb"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.9.0/claudes_0.9.0_linux_amd64.tar.gz"
      sha256 "b66a51c472c0b7154f4e69a71f66f77b583352e27ab247f91bad1a3e985978d5"
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
