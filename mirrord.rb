# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.33.0/mirrord_mac_universal.zip"
    sha256 "ddbe0fe3202c296ee594dd513a313691e7a95be3bc8fb6a0d596249f0875f89b"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.33.0/mirrord_linux_aarch64.zip"
      sha256 "aaf975254a8b0fb6a89f1fb228e7222f7c2a63aa3ed8af20e1e5086703594fd3"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.33.0/mirrord_linux_x86_64.zip"
      sha256 "ff02f9cab259c790bd23018f28ae71f6275ce140278f8c8116afc068099129f9"

      def install
        bin.install "mirrord"
      end
    end
  end

  test do
    output = shell_output("mirrord --version")
    assert_match "mirrord #{version}\n", output
  end
end
