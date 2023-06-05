# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.45.0/mirrord_mac_universal.zip"
    sha256 "1e11c21c3f70053e2e3bf16edf930c563770e9a1f33fb05ce24294b3613ca889"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.45.0/mirrord_linux_aarch64.zip"
      sha256 "3e971a9e1a25407667ef9d52473bf59eaa02a8844ac655b3b82ed8b1502fb860"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.45.0/mirrord_linux_x86_64.zip"
      sha256 "48ff9f60feb8ed10c6a9464e56e8572b0a064d8c14b4fa1657c7228330be5a3c"

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
