# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.63.0/mirrord_mac_universal.zip"
    sha256 "a3febcee92ea3b9cc47bfff43972096410ff1c8bcdeeaaf920c95c6f083c4f23"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.63.0/mirrord_linux_aarch64.zip"
      sha256 "5e9c42139408b7964009e0acacd2354d2505537f61a5786a384973c6355c5a4c"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.63.0/mirrord_linux_x86_64.zip"
      sha256 "ed9a5719d09ae4cf80edc99785907fbf193e603f49049201f9ab7f8ac2eca0ec"

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
