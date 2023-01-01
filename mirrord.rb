# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.15.1/mirrord_mac_universal.zip"
    sha256 "1c45543d397029d04c10f79b76fee70065fc83e0d4ec7d9bbbdb51ac3ae9c3bb"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.15.1/mirrord_linux_aarch64.zip"
      sha256 "d9f120826e2594f1bf53ef8bdf6076ed6a55ed9dfd1631376cf8936fd66fb6bd"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.15.1/mirrord_linux_x86_64.zip"
      sha256 "c02c70fa42efe6f8e6e1ca5ea04d63e04e2670f137dd6ba12cd63c687f024c8d"

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
