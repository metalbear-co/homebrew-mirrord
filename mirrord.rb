# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.65.0/mirrord_mac_universal.zip"
    sha256 "96fc8b5f6a9e0b1c2ec237a9ffb485d407995a7d7d9651c035363f85c7664010"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.65.0/mirrord_linux_aarch64.zip"
      sha256 "6a707bf6005c0277f46305e9e16d02da65505c4da62d80ff87be3e16e3c28fb6"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.65.0/mirrord_linux_x86_64.zip"
      sha256 "f2041dfae6929dfb06611ba7550bbd83a44682e84c596be0256dbd8b32322d7d"

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
