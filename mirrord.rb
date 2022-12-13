# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.13.5/mirrord_mac_universal.zip"
    sha256 "ae98356aef919eeac72cc4968158de2e24700edff7dac9535c9d2ab1415b374a"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.13.5/mirrord_linux_aarch64.zip"
      sha256 "fb2464b5e22372f31f0899852dedca1643f096f252b07dd73ba9f221cc9b1f04"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.13.5/mirrord_linux_x86_64.zip"
      sha256 "039fcc8f7a97d58f16aed828d63d1863aec375766cef6dd58835ee5dd06421d9"

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
