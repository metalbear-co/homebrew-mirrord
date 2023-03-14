# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.32.2/mirrord_mac_universal.zip"
    sha256 "22fb41d5b076c7e3dba319919c19fc8bb2cd7bcf2fc550fe8aa569f63734e3c0"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.32.2/mirrord_linux_aarch64.zip"
      sha256 "fafe03968711c124e9ffcdc8c0db1ee9b31039c403a8517424eba099a4b1f5fb"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.32.2/mirrord_linux_x86_64.zip"
      sha256 "122662f30bd05267472199cb3e381404f15d6ec7277bbec22ffcfbd5ee26381a"

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
