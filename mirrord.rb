# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.39.0/mirrord_mac_universal.zip"
    sha256 "c61c9547fa5161784c0f03780583a16a0125c799de793fe0e18bb14845e54efb"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.39.0/mirrord_linux_aarch64.zip"
      sha256 "4d1702cf7d36108100c4fbebd1ed1ddd4032f4d25330f9ba2015636ad7ad23d0"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.39.0/mirrord_linux_x86_64.zip"
      sha256 "e59287754e213a0e797fc37fa7f3beb29a6e54d18e6fbd7f4ad4065401b14dac"

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
