# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.15.2/mirrord_mac_universal.zip"
    sha256 "fcb17c6c0d1530375435478979e899ad6213ca14fcc0a7a4ecd694a2c662fb43"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.15.2/mirrord_linux_aarch64.zip"
      sha256 "553ec1610a755e382fc163d5d3fa838f92be9a0da7dc43610ad35977d5beaf2b"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.15.2/mirrord_linux_x86_64.zip"
      sha256 "71c62032616264818575bb00cd1ce0b278fddf5c82de2233732d88954bb40ccb"

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
