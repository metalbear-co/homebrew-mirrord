# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.26.0/mirrord_mac_universal.zip"
    sha256 "8eca1d8324afbfa22d473a28834da5b0cb423fe23dfeda5eb00fc757f317eb58"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.26.0/mirrord_linux_aarch64.zip"
      sha256 "34d25a2092bfad9bcc1a40632493af461c8e12a5e310419851f09fce8b92d1e7"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.26.0/mirrord_linux_x86_64.zip"
      sha256 "14154f855aabdda1c6f02ec63abe9d3b0d078dd7b8929377bb5c4cd100ebc714"

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
