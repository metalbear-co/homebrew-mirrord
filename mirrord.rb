# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.47.0/mirrord_mac_universal.zip"
    sha256 "ae17f423d38bada0e78c0b4f3b86fcfb864dc53d225aec18cff2e37871342c26"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.47.0/mirrord_linux_aarch64.zip"
      sha256 "cd02c454da60fd50efea1fcd6b8159a8eb50b0ab576f761a0f4e49a66467d0e6"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.47.0/mirrord_linux_x86_64.zip"
      sha256 "b68b3e99e3076935707339117a3923cbc4ca051ec021bb94271dceaba9f90775"

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
