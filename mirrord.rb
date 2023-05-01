# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.40.0/mirrord_mac_universal.zip"
    sha256 "bbf13fe32164b0261062393da44fe08736fe7d5ddbddae26a57c3277d0e6a656"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.40.0/mirrord_linux_aarch64.zip"
      sha256 "c6f6ba16771c46d5e1647e3168594efd9a2ee4db32b689a7edc3f94e342e2873"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.40.0/mirrord_linux_x86_64.zip"
      sha256 "900ac9968feecc03a4f05954d1ea9ea71e2c16f403b9130d37f6bd71b86a899d"

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
