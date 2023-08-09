# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.56.1/mirrord_mac_universal.zip"
    sha256 "7b7dc0a4650a22dc234550c250dda4792abffa344d4cc4f6652c8df3746a4945"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.56.1/mirrord_linux_aarch64.zip"
      sha256 "806526906930e5563ae4013c9be32c323a8887645a223a43f61605e7a3f52446"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.56.1/mirrord_linux_x86_64.zip"
      sha256 "b4c85ca4ffaa464c1f4d078b84249e6a1ea624d32c715fc24121f13f38607a3c"

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
