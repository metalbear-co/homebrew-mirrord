# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.13.2/mirrord_mac_universal.zip"
    sha256 "e83c398fceaf7aee93a34fe34fa2a58ed2266a840df4145d37c67b5a4b51eb0f"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.13.2/mirrord_linux_aarch64.zip"
      sha256 "914ac7e664ff8427f2dcb42aee45a4f70ab02d3039096f95195eb7f12bd6c6ab"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.13.2/mirrord_linux_x86_64.zip"
      sha256 "bfaebe8436dd88e08ee895473d9a54a2c2aa893fd11ad1671c6ac92565fb1c7b"

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
