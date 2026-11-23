class Claudes < Formula
  desc "Manage Claude Code sessions: list, pin, restart, pause, and resume"
  homepage "https://github.com/uvw/claudes"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.8.1/claudes_0.8.1_darwin_arm64.tar.gz"
      sha256 "37d7b34adc86166160df11b8e91f6da09782d7f1fe775df63f8c1b2faefa19f2"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.8.1/claudes_0.8.1_darwin_amd64.tar.gz"
      sha256 "1fdb050edf562bf8b5e0eff00b39e00c384eb59c735e73c009738c472da1cf10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.8.1/claudes_0.8.1_linux_arm64.tar.gz"
      sha256 "3e58432e9809f0ab2f84835e41f77a87b2793a375e0d51fc5492a80231701f79"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.8.1/claudes_0.8.1_linux_amd64.tar.gz"
      sha256 "ca8e32bae32b3669960e6a681fc5f00e5cbdbe43ff4d33c5d18dd1a658875ae2"
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
