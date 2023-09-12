# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.66.0/mirrord_mac_universal.zip"
    sha256 "c3162cefe851b8ddfeb0f5d800203904a9e8ea5ba9c3bae23ed4092de889e2ea"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.66.0/mirrord_linux_aarch64.zip"
      sha256 "9d1c23e488e514c8f31777b3c847d890a7e3b9ecea3d0f1865303438c13227c6"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.66.0/mirrord_linux_x86_64.zip"
      sha256 "0b9b868d9eae3319dd1fd145810031786eacd1a4bd5a54cfcdc91c2c7bc54e00"

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
