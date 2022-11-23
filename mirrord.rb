# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.11.2/mirrord_mac_universal.zip"
    sha256 "a29cf52a3210fa72ec4120c0fe7cdde651ac7d0dafe9988306506f67fb848995"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.11.2/mirrord_linux_aarch64.zip"
      sha256 "a00db7125fa6db52a6a9f5cf6cc234279dfbc2f52926afac236f6794d7a9ee34"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.11.2/mirrord_linux_x86_64.zip"
      sha256 "46b1770c519a2d476d5d58a7efd501b58c5607677a747c5ef0aa10f5146df8bc"

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
