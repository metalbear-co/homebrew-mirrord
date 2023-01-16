# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.19.1/mirrord_mac_universal.zip"
    sha256 "68d53388a343083109362fab1ed75eadc7976f18cdd6b615e328f6c6238e8efc"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.19.1/mirrord_linux_aarch64.zip"
      sha256 "e4d6d8345a6bda2fa9f5befb4829e288b9229e2788dc656e7da7713f176986b2"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.19.1/mirrord_linux_x86_64.zip"
      sha256 "971584e775a07495de8437e937214d3e3fa324cde8de28cf010f64d683d87120"

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
