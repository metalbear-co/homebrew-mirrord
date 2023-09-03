# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.64.1/mirrord_mac_universal.zip"
    sha256 "3f8f29134c5a7e1b0ed9792ff61a7809c91ae770eac5fe3496dbc4202875ee35"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.64.1/mirrord_linux_aarch64.zip"
      sha256 "16111f6bf8b0ab53fbcefd695e7e12fe779a2a5889f80b96c747b12e13e00583"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.64.1/mirrord_linux_x86_64.zip"
      sha256 "86dfecf73316abff3628b73fd56959dee525849ddc0cd1ae1d71e24cda089bb6"

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
