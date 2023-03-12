# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.32.1/mirrord_mac_universal.zip"
    sha256 "7287c22ff429aa0099b21d4dab76e0010597f2f0abb784f086a75a3737388d82"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.32.1/mirrord_linux_aarch64.zip"
      sha256 "6ebb5d91a423ad2ea29f57ce2e3679391c2346addde20358fd0482b12fa223b5"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.32.1/mirrord_linux_x86_64.zip"
      sha256 "58125b9089ca44b16079e9defb8da8f30d20788b2e5b0de688a3e5615c618752"

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
