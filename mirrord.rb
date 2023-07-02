# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.49.0/mirrord_mac_universal.zip"
    sha256 "c769b3559f434113fbe3b74458b1ac0debc39132427df068c7382eafb309b19e"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.49.0/mirrord_linux_aarch64.zip"
      sha256 "f04c06d48acc19f34df5d53a0914170e4bbefc18e922d5d533b077c010b76a3d"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.49.0/mirrord_linux_x86_64.zip"
      sha256 "5115b410b80e36be4102cd0120f9c2faaf525717218febd9837b55a34bd71392"

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
