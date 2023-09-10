# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.65.2/mirrord_mac_universal.zip"
    sha256 "808b20093d56e7fe9a078e4dbab4b7c9b30368692a7a2085fd3acc1e3f4e997f"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.65.2/mirrord_linux_aarch64.zip"
      sha256 "4aef3ba5d6354ee31692fa8df3e4dac90954c2c9e4fd3384388bde25f7d1fd9c"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.65.2/mirrord_linux_x86_64.zip"
      sha256 "b1f74fab9f6366a006015fe7d009bdb842cf556f47e65d7e175acd75813ab507"

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
