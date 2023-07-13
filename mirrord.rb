# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.50.5/mirrord_mac_universal.zip"
    sha256 "7567774774f8a1e55ee6e17e14016c535c53223a0cffb3f654e5b59e6b21b29e"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.50.5/mirrord_linux_aarch64.zip"
      sha256 "60eb916b06dc952a2f86e81b263b635c4b85a862135e5e2a0142b7399f467fca"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.50.5/mirrord_linux_x86_64.zip"
      sha256 "b5737c7ec416737d47dc32be3a3a08f61d3256d64d28b1f85fa2e094e8727677"

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
