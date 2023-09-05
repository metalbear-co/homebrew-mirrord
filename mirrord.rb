# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.64.2/mirrord_mac_universal.zip"
    sha256 "9cf0351935f90025a0e7745307abc7fc79e68e6cb5984a568433a0f2d49a1111"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.64.2/mirrord_linux_aarch64.zip"
      sha256 "97c984b527a7cd88b38c6122c0d98e3418bb1db36ca9a0745f33bf6111121b9d"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.64.2/mirrord_linux_x86_64.zip"
      sha256 "1dd705bde87367a01d0fa7d9a1950ebff7790004293233c2de9f96f2152375ef"

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
