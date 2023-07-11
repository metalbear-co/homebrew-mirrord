# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.50.4/mirrord_mac_universal.zip"
    sha256 "36659f87d56c487bfa246ea512732f2d6aaa96322ffdaa68f1db2e46197708a2"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.50.4/mirrord_linux_aarch64.zip"
      sha256 "9bce61d71c1951eaaaa52191b9273ba428b4c945bf53a41b845e7f5ddff14299"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.50.4/mirrord_linux_x86_64.zip"
      sha256 "36d31d0d6dca409126c1a4bf4d96f0842b018c263510b7755f246eb5ad427a41"

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
