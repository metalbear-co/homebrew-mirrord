# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.50.2/mirrord_mac_universal.zip"
    sha256 "258fd6d9e5484ffc1f8cef5dbde9b6c055dd9920e83ef6e4bbc55b2f01ba11ac"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.50.2/mirrord_linux_aarch64.zip"
      sha256 "fb1c05745c63c15446c5a7236c0d638449637655b46d1b9066f96b3d2afee109"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.50.2/mirrord_linux_x86_64.zip"
      sha256 "2fd8ef8842e037692560ba8de934d97c56ffc60608d57148a51c9ecbefd6cb3d"

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
