# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.27.1/mirrord_mac_universal.zip"
    sha256 "eb01e5d1eb5b2b6389a15ed9172da9782f357640482520d12dc02de24a636db3"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.27.1/mirrord_linux_aarch64.zip"
      sha256 "099b6e630c431676813198eedac9bc03d796d401752784ec10ac34b32fad6428"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.27.1/mirrord_linux_x86_64.zip"
      sha256 "bb168c040d795449ec03bfe38d90ebea12dbfa4ac43a96d8450559ee686b6b6c"

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
