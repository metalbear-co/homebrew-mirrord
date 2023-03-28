# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.33.1/mirrord_mac_universal.zip"
    sha256 "c3b62c8d1c9ef24c2a8c0efd0b0944938dc9c464c54217eeae620ae48b3932b6"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.33.1/mirrord_linux_aarch64.zip"
      sha256 "787b59efe825c80576d725f0c702813da6d73c48d0a2a416f18a50ac3040f38f"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.33.1/mirrord_linux_x86_64.zip"
      sha256 "ba0caa2972bc3827e5b810d275772b1afebbbd91788454d0d0127e0920998246"

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
