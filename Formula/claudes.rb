class Claudes < Formula
  desc "Manage Claude Code sessions: list, pin, restart, pause, and resume"
  homepage "https://github.com/uvw/claudes"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.2.1/claudes_0.2.1_darwin_arm64.tar.gz"
      sha256 "dcceb3cf6cd90131319f73e10b928a6fec7ff26482a306ffbb81ccf546f8d0e0"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.2.1/claudes_0.2.1_darwin_amd64.tar.gz"
      sha256 "2de902bd7b7b7b76eae8e7140b94329fcfef2bb804ac1b4c7692c2796b821ec9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.2.1/claudes_0.2.1_linux_arm64.tar.gz"
      sha256 "8095106d6ddbf5500b2b2e9fe76554abaee0f6eefab38885cb8f2a8ed0b1e8e9"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.2.1/claudes_0.2.1_linux_amd64.tar.gz"
      sha256 "b292c2848905d234a97ba4a2ac39b6f5bd95f69ab9510ec7dc3bd6e5bdb512b7"
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
