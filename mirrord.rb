# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.53.0/mirrord_mac_universal.zip"
    sha256 "7af1035ce131c2d54c1c8847eac3a3c81d5956f96167ccbec74a6b0a9209eca5"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.53.0/mirrord_linux_aarch64.zip"
      sha256 "56ca2410c66c0d3aba7f65d370db732e0c573417dbd616df617c0d2f04acbd06"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.53.0/mirrord_linux_x86_64.zip"
      sha256 "d3352ba6980c37241c4f81ce28d1eb6ed1746ad8b12d46888065e2d1b122dfce"

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
