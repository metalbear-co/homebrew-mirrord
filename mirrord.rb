# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.51.0/mirrord_mac_universal.zip"
    sha256 "6f2d584149ac2afb9aa9619fed61f0f43735a02959ea2c0437b4f5bde7014b81"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.51.0/mirrord_linux_aarch64.zip"
      sha256 "06b091c9507ddcbed33afc811e00356bc64e6336f8204de4d63dd2b38083e202"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.51.0/mirrord_linux_x86_64.zip"
      sha256 "a2622919c8a498f4d71982ded53c32f0eab8bd27dfc8d1b2efb134240f610b55"

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
