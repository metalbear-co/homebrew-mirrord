# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.41.1/mirrord_mac_universal.zip"
    sha256 "664f7e86768615b20cd7290359d3d04f0a21a187fd649b24a48909abc849a1fa"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.41.1/mirrord_linux_aarch64.zip"
      sha256 "88dd1f6900fe41b59fc96c54d15663894f0550fd99d8a2d9d08d732b48c82a41"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.41.1/mirrord_linux_x86_64.zip"
      sha256 "f722680329a8c180736a64391c1e1715c2857cd1a173459922cb4a22b1a73929"

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
