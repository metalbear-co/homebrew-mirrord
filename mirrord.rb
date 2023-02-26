# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.29.0/mirrord_mac_universal.zip"
    sha256 "84a7a3d87625ba52d091ab7d7156ffeb3b19f6019bf006038ed1078c212a0678"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.29.0/mirrord_linux_aarch64.zip"
      sha256 "ca58aeaa74bb56d798287908123e822ecfa8f1cdb191ec9d06e368ef8f79313b"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.29.0/mirrord_linux_x86_64.zip"
      sha256 "9043bc1fc6eedb29e8094e1174673f9b53fea297b70916ecf6291de6b9c7a31f"

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
