# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.14.1/mirrord_mac_universal.zip"
    sha256 "c735f570ac6b8322ef3690a58cb6a59551d940e5c494524fdb8624cffcbb5fc6"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.14.1/mirrord_linux_aarch64.zip"
      sha256 "99f53dad2ad8c55a38f87143a89cf89c205f7d42f2b27cb345bac57cd7eeca80"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.14.1/mirrord_linux_x86_64.zip"
      sha256 "488320199990a84af775df907a7a4d49126f31658bd3701723bc4953140992a8"

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
