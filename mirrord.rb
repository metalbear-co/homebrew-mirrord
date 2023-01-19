# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.20.0/mirrord_mac_universal.zip"
    sha256 "6bb5e0dc6eb398f5628a8a269b1cc1b940b97b68112aa8eaa996a2b96bdf16bb"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.20.0/mirrord_linux_aarch64.zip"
      sha256 "ef536d5fd69b743ec788917f44d9b2a1f2e280d37139f337a441537be85b373a"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.20.0/mirrord_linux_x86_64.zip"
      sha256 "506a9d6dd452627b640e81017ddbdab05a24aa5fd59b0a48f027da214f0fdd45"

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
