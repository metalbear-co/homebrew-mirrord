# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.32.3/mirrord_mac_universal.zip"
    sha256 "48be72d4417addd95a7006d716c4c87ddfaf048d24f39d2272ce6b42cababf59"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.32.3/mirrord_linux_aarch64.zip"
      sha256 "ec08ef7a6c4d0b82b1b726ea553ae51090f606788635bf22801dc58c3eff1523"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.32.3/mirrord_linux_x86_64.zip"
      sha256 "c3fdcbcbf97522627d03fbc62ba7a208fe582ad15bb615986490b5b3e895c90d"

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
