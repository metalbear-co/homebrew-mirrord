# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.13.1/mirrord_mac_universal.zip"
    sha256 "0769f0fe38c9f27fcb6a5f089ee18a40cc4e1d7644b42baef0dc711dfe8da471"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.13.1/mirrord_linux_aarch64.zip"
      sha256 "43f54f1f27c989c98a3f9300d4c0ac806b5fe59e8738c135b809198f71b17a3e"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.13.1/mirrord_linux_x86_64.zip"
      sha256 "f7b2bf167af85944eab0fea07d51eb22d62827e80ea190da3b7a4b9e3d0a3113"

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
