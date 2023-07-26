# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.53.3/mirrord_mac_universal.zip"
    sha256 "37855c2c9425cf17b9c7bcf0c62ed7339ea3d8ad1656446c414dc2049cb46145"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.53.3/mirrord_linux_aarch64.zip"
      sha256 "3baa353acd0003f72cd47e87a71d47f7e3bee7400c685c7ca7709dd25f58c814"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.53.3/mirrord_linux_x86_64.zip"
      sha256 "e909dee8b0332b3203f9ba9812dd737548031f4262868500f07d9717e78871bb"

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
