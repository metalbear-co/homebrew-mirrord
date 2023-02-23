# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.28.4/mirrord_mac_universal.zip"
    sha256 "53dead6ede7be0077941e0695011a057168820b3375398942bf8fb3fdd8b6b3c"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.28.4/mirrord_linux_aarch64.zip"
      sha256 "6998bf9cfabc9087aab49957f3e2b8cf55f989eee3bc4f5b9478f3a74b705991"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.28.4/mirrord_linux_x86_64.zip"
      sha256 "6480f0264d6ffbff86b15dcf67b651d9172b75ef26a61051b6e439d8684efb00"

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
