# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.46.0/mirrord_mac_universal.zip"
    sha256 "9d225a0767e6e2bce80871531aab478524bc5adc1ccae8a7391d52774c987a3e"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.46.0/mirrord_linux_aarch64.zip"
      sha256 "a7f5b98a13d31f3a3e9068dc751148239aae8e4ec9f2d0aa388c999b8faafe74"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.46.0/mirrord_linux_x86_64.zip"
      sha256 "2ce437b0e043cc7ce8b7f3ad7f0628cea50db0af1600d2da081b7c6777a38b4d"

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
