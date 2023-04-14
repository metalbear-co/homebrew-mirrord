# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.37.0/mirrord_mac_universal.zip"
    sha256 "3438e740aff85edc0a800636af2de351390ce5bb2a521f0a97b785e3cd4340fc"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.37.0/mirrord_linux_aarch64.zip"
      sha256 "78fe87b5c24294523afbb958a8f3292a6c21986e7aadc666b8dc8c74bb21de69"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.37.0/mirrord_linux_x86_64.zip"
      sha256 "5cff88414922f17aeb2867a2f1d8d78121d5a805b928776d6c20d9df1437176a"

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
