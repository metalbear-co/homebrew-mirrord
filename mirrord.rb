# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.12.0/mirrord_mac_universal.zip"
    sha256 "8edf217b55e60709dca32c96e9cde4b6653efce82770e7f111c7c6ee7c57956c"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.12.0/mirrord_linux_aarch64.zip"
      sha256 "1deb4e108554301fd4f7f91366439821fa3a1c64dbf93d1fc64f0b8f88784867"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.12.0/mirrord_linux_x86_64.zip"
      sha256 "88964e0f9ed6c7dd4634f34d32506bc99102f81f5a5fd4960e0e65e5bf73208d"

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
