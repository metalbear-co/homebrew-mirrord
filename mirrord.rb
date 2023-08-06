# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.55.2/mirrord_mac_universal.zip"
    sha256 "e70f3484fd52f2508fa37ec4566f6424f6a0ee93a57b0df9894c242619198689"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.55.2/mirrord_linux_aarch64.zip"
      sha256 "54325459fa113c912519510eaf73f96e0c1615a85f28a43607d33a6474ea8554"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.55.2/mirrord_linux_x86_64.zip"
      sha256 "f4b3d5019b17f867c68dc9678a630b8ed25805905f989f5a50407a81f25bb74a"

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
