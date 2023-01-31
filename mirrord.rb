# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.21.0/mirrord_mac_universal.zip"
    sha256 "ccd3ba1d41c3c491e34e5aa494a5cf28bdb0e76ca97445d0ba0260f424d59433"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.21.0/mirrord_linux_aarch64.zip"
      sha256 "5b324a16fdfa58bd311c5ad734a253bac36794deeb835816f4fa76d71b8371d8"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.21.0/mirrord_linux_x86_64.zip"
      sha256 "b96397b43b7963fee8c4c10da439ca24b984477fb71ed26474f1e2cbd58e9f63"

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
