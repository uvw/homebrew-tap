class Claudes < Formula
  desc "Manage Claude Code sessions: list, pin, restart, pause, and resume"
  homepage "https://github.com/uvw/claudes"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.5.0/claudes_0.5.0_darwin_arm64.tar.gz"
      sha256 "d84dbf8d59cfe7306362534a5699ff1d01e99f42a0a54c2f3f204e3e59801670"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.5.0/claudes_0.5.0_darwin_amd64.tar.gz"
      sha256 "bf11ac46f2e756f7584179f258f403428956cab25bdcddf12a0d201b3370ef58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/uvw/claudes/releases/download/v0.5.0/claudes_0.5.0_linux_arm64.tar.gz"
      sha256 "bce48a0fb846f496d9fc9262be5e20d9b13e00bef5792437e1e2ec2ba80563ce"
    end
    on_intel do
      url "https://github.com/uvw/claudes/releases/download/v0.5.0/claudes_0.5.0_linux_amd64.tar.gz"
      sha256 "940b3a5184c6f35965c77ef630f99098a0273c9eef83525b397917ae0db276e5"
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
