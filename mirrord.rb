# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.45.2/mirrord_mac_universal.zip"
    sha256 "f3da2ed51aca0d438b805a1928f1483a6a5ae7bc86e54f2fd4cd2a1037934d30"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.45.2/mirrord_linux_aarch64.zip"
      sha256 "1db86d331fe19987932f285fc6affba9cb11c094b442f761a4be574aa50eb4fc"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.45.2/mirrord_linux_x86_64.zip"
      sha256 "8818e046346e97a8689c9aae0b68d64e88687f91e981deff88aed064d1a79a13"

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
