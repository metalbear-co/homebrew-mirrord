# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.54.0/mirrord_mac_universal.zip"
    sha256 "c9b5f4f81dc6f0b1da8f251332281825e5954b74ed7e930a5957d1e133723531"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.54.0/mirrord_linux_aarch64.zip"
      sha256 "48bda405c386d0b144e622f3043298b77d22970c11ccdf692b2c20776b307481"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.54.0/mirrord_linux_x86_64.zip"
      sha256 "3d26730b802e4f437eb56e035950755db5a9eb2ff16c8a5eeea2919ac7180ce8"

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
