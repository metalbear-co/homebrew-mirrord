# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.59.0/mirrord_mac_universal.zip"
    sha256 "538855a68dc2cef5705a3434aead80a6c1ae937025d117e77185202d0cc3efa5"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.59.0/mirrord_linux_aarch64.zip"
      sha256 "0282e4d691382057739168c378ed36beb03665ac813a7f127b6c5ce720e0d68a"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.59.0/mirrord_linux_x86_64.zip"
      sha256 "814fcc93bc123845a0ef106cdd5bd1ecc6a3c185c592594ef7ea4ef5377ab15d"

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
