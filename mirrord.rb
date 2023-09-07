# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.65.1/mirrord_mac_universal.zip"
    sha256 "a719f3ea0ac091a27fa032644f444095692d43a47e0156f6668f9cfcd9eeacc2"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.65.1/mirrord_linux_aarch64.zip"
      sha256 "65defe29e0fbed449a67f54dd37803c121aba6ce519475275822f35db5a013b4"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.65.1/mirrord_linux_x86_64.zip"
      sha256 "136471bf70a4fd9ebbcc9054d3c07d96e4e223fac93e1669e8b7b47b30974d21"

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
