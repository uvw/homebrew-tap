class Claudes < Formula
  desc "Manage Claude Code sessions: list, pin, restart, pause, and resume"
  homepage "https://github.com/uvw/claudes"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.4.0/claudes_0.4.0_darwin_arm64.tar.gz"
      sha256 "e3198ca7228630757dc42048e27f3b1438785cc1b07622d0c022b598d18e9844"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.4.0/claudes_0.4.0_darwin_amd64.tar.gz"
      sha256 "ad335b8bc17b57c6f42aef57ad14f9c824df5d1b24593326c6fd1bd53a3a8baf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.4.0/claudes_0.4.0_linux_arm64.tar.gz"
      sha256 "a047ee97deb5aabf120a054cd113a8c70edba8c4df97b78caf41f80d96753829"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.4.0/claudes_0.4.0_linux_amd64.tar.gz"
      sha256 "9104a8c01ba05dbab60f7e25aca8926f1f0d50f4fc154276ef7ccbc78841cc65"
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
