# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.24.0/mirrord_mac_universal.zip"
    sha256 "57bd6f8e78093bef32dbf9b86fddd72f420a8b86f2e46aecd2147d8d6d687d99"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.24.0/mirrord_linux_aarch64.zip"
      sha256 "961ec38816a2c27254e360a7d2c4865f2d3023cd597104dd3980b3b93d832c8b"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.24.0/mirrord_linux_x86_64.zip"
      sha256 "4c09cf7436002bdfacdbd0888bb00e7d83deadab806d5cb148b9970e52fff149"

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
