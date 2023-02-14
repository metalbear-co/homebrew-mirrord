# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.25.0/mirrord_mac_universal.zip"
    sha256 "02b6c14994f0f04077f479c7d3bfd2451d9b8b952ce8f31c7c8fb3e7f13f885e"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.25.0/mirrord_linux_aarch64.zip"
      sha256 "4420302a958fe1df3dd223069236e32e2b0842596e7e57bf71b830099aee099c"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.25.0/mirrord_linux_x86_64.zip"
      sha256 "1dfd1a7f23b6de9e2b2d7ce8ab193860a83a056df797223b69bae39b05883971"

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
