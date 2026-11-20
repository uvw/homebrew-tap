class Claudes < Formula
  desc "Manage Claude Code sessions: list, pin, restart, pause, and resume"
  homepage "https://github.com/uvw/claudes"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.7.0/claudes_0.7.0_darwin_arm64.tar.gz"
      sha256 "9af48f000d24dd1d0bdb3bfbd789f745ced4a6727733332ea6939d22fb9df6bc"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.7.0/claudes_0.7.0_darwin_amd64.tar.gz"
      sha256 "ec2fba027b0bdbc89ba84e08c7be9db2d4f5447c51885c95bce535d7e207b111"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.7.0/claudes_0.7.0_linux_arm64.tar.gz"
      sha256 "0004500b0a74c09d1aac3cb18c286d0e9870b2967e84b4aa61381c2182bb6e57"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.7.0/claudes_0.7.0_linux_amd64.tar.gz"
      sha256 "ff33fc33231edb00d123be100229792c0511be2259b5d1b12766f5640914eb49"
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
