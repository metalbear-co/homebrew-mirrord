# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.62.0/mirrord_mac_universal.zip"
    sha256 "306b026f763f8b54f3439517dc0769f9c4e0f14a84e9a0c3ccb03add0083d1c8"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.62.0/mirrord_linux_aarch64.zip"
      sha256 "afc365e0304bb2bf22616f2d112e031344940e54267c02f4efff11fe5400242f"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.62.0/mirrord_linux_x86_64.zip"
      sha256 "0ecaef0f51195e4333c38010c9f1ba2bc276cc07617bdf0a339e6496fa7737fa"

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
