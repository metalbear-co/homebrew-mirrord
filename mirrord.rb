# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.13.3/mirrord_mac_universal.zip"
    sha256 "aecc91da67c68aabd86de38e9f056dd49e936ebf5c25b3cf7e129c47c8c1e665"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.13.3/mirrord_linux_aarch64.zip"
      sha256 "fe9a1e3118ac52166438fbfabbd77484a80fa402c1db4c6dc31f9339c897851d"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.13.3/mirrord_linux_x86_64.zip"
      sha256 "d8d4e295cbacdc1447130497be671c85bff5ad86865fe070f2a361ccb83395a0"

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
