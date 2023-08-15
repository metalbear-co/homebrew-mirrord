# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.57.0/mirrord_mac_universal.zip"
    sha256 "62f654a8c348b34085636630f42d4500b29ee2d050d50d3c2b7753c5a2ac728a"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.57.0/mirrord_linux_aarch64.zip"
      sha256 "d32ac971df13212db3bc58997947a5aabfcd2dbe5a0dc45ed277368841f6b2e9"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.57.0/mirrord_linux_x86_64.zip"
      sha256 "f44b25b30ca5a651b8cc754ad0e0a06a5b9a63c32627f327996edb8e8f3ce6a7"

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
