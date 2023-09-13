# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.67.0/mirrord_mac_universal.zip"
    sha256 "18f2d56cd8f7104fbf1ab114ef47f2f18774e48517fc545da1c7b65686657f2e"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.67.0/mirrord_linux_aarch64.zip"
      sha256 "5f4416b8fa81d791f26ec830f4f4ca01efd903acda6e755ba4b19b8184e7d5ef"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.67.0/mirrord_linux_x86_64.zip"
      sha256 "0c51d5d69914ea1e5558f0347b9e111178070dc221a7af4ace2bb12418187161"

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
