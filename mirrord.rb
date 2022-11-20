# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.11.0/mirrord_mac_universal.zip"
    sha256 "6f3c6ab26bb0e231a4361d89b156caa6d96b5e422edadc9ae27e771fecfcf52c"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.11.0/mirrord_linux_aarch64.zip"
      sha256 "1d1b95b7c188ac5163ffd94d93d4caa915f30f981a2190229a68265c02a6ba53"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.11.0/mirrord_linux_x86_64.zip"
      sha256 "be2c6eacc17fc4ab8bac341655f353f5a2d329156618b5faafeb7f766d517ec5"

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
