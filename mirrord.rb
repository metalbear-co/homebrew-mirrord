# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.50.1/mirrord_mac_universal.zip"
    sha256 "3c8fe07a5bd4bcb682809481d2e1a813ab67df3f902b56945ddbc64d6001a30f"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.50.1/mirrord_linux_aarch64.zip"
      sha256 "6ad4976d8cc131b343bdb2bb1b1aa85579284a3af65578b2e0b770fa29b57bc4"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.50.1/mirrord_linux_x86_64.zip"
      sha256 "7e8065a2e52ae95bd7ec2562b83437d3e894b15c78b5079bf35f130880bcffa3"

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
