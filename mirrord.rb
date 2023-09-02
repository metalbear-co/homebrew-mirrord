# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.64.0/mirrord_mac_universal.zip"
    sha256 "58251b0e4fdac02bbc376684705aa3cfde667fecc28b37e2b5380403e8b54236"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.64.0/mirrord_linux_aarch64.zip"
      sha256 "f41ce00ed0f68deb4f863e26d91d5a7143795122f4343fb28fb12b3779602dba"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.64.0/mirrord_linux_x86_64.zip"
      sha256 "3e09722da662e29a21430ac322d70f0ca2cdf0ef9c1fdd06d40854ea9481a97b"

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
