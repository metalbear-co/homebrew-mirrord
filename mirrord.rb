# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.38.1/mirrord_mac_universal.zip"
    sha256 "15b81d0b90d405491830aea519eb1a541b92a587c3358ab1657e5da17e696c94"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.38.1/mirrord_linux_aarch64.zip"
      sha256 "692abe1d535d708efc16846085c240db22e7dd81baad5d73acda3d8fe1743dc7"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.38.1/mirrord_linux_x86_64.zip"
      sha256 "166a46e53d6f0285a088528986a807674bce8cc07e6971c3c50f6ce935f6c15a"

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
