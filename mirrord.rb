# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.55.1/mirrord_mac_universal.zip"
    sha256 "e05217336b36324899b796d5e9f47ba18fa2f8c176ce32eeff5210dea9bf9332"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.55.1/mirrord_linux_aarch64.zip"
      sha256 "feaaf276f7ab6135e1ec18ac70c1e6bae9117176f4342a49d9d97333da97fd11"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.55.1/mirrord_linux_x86_64.zip"
      sha256 "125c6e1adc5f02401d4253fd90ec0cd685629c119ea90ca92ce2bfb4fceb0abd"

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
