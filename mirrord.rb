# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.43.0/mirrord_mac_universal.zip"
    sha256 "661b8282aa0e5aecbf7b4b6ddb2f5eb3c2d3b5df50fcc2babc54d3d120004067"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.43.0/mirrord_linux_aarch64.zip"
      sha256 "301a33fc0c8b7f0df15e9a7efeebb1a293848a8305884ace8e5c779475a6e182"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.43.0/mirrord_linux_x86_64.zip"
      sha256 "87a7199d7c214f5d914c3bd68b5d50a6083f66ed90283126ee970f9681f12bdf"

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
