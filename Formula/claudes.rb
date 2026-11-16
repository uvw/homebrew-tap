class Claudes < Formula
  desc "Manage Claude Code sessions: list, pin, restart, pause, and resume"
  homepage "https://github.com/uvw/claudes"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.2.0/claudes_0.2.0_darwin_arm64.tar.gz"
      sha256 "c57e932e9fb8d1e14ca7f049fd4cafe44fc097fb1063bef5fdd6ee4374462eee"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.2.0/claudes_0.2.0_darwin_amd64.tar.gz"
      sha256 "9fb62c32aa3e8c889b01e447f08a885558b149952d1478d2776c79eedd6633ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.2.0/claudes_0.2.0_linux_arm64.tar.gz"
      sha256 "65732fb5b66cf723fc92ce89e3df40660fe713b1d73e80c1f5f9df5b5b444f62"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.2.0/claudes_0.2.0_linux_amd64.tar.gz"
      sha256 "0051bc68902a3ef66d4253fd780a5fa02d205e5571ee91f5934463b0f6e13ac9"
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
