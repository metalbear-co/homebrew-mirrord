# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.61.0/mirrord_mac_universal.zip"
    sha256 "64d922c9173c313b181f1a5d02825bc115be81fb49243b2858b8a5c9d04e0eda"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.61.0/mirrord_linux_aarch64.zip"
      sha256 "472cdfe26271caa5a212acb30268b7366f265551a06f20e94b515116de936838"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.61.0/mirrord_linux_x86_64.zip"
      sha256 "8b94bdbce93f311e3e9d2dbe82725ea9dc323ff40bcd1d3c84bad4e631a4a449"

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
