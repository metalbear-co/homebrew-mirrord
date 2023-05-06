# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.41.0/mirrord_mac_universal.zip"
    sha256 "2c5eac939271979f38a5a61be98af786ff055dbab9a968ef09510916ebd257e0"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.41.0/mirrord_linux_aarch64.zip"
      sha256 "8b861c7f96b3f471ae33a43bbe59c07f5ae4cdf970acb5683b0d6d3c5a00ef2f"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.41.0/mirrord_linux_x86_64.zip"
      sha256 "acf0f43cc55b1728a022e6440e49939034d7cc74bf7221cf5552439fadab41d2"

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
