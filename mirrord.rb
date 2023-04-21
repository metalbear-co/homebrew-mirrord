# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.39.1/mirrord_mac_universal.zip"
    sha256 "a335e1a8c8425d537d0474fb7e5ad871ad080b22837fe706c50b8850c4337d99"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.39.1/mirrord_linux_aarch64.zip"
      sha256 "90ff8e04b5ba71396b7a738f9c9a54ab626f91973b7d20204ac5e56d700c6c73"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.39.1/mirrord_linux_x86_64.zip"
      sha256 "67868a1f094bff73aa9e566ba243a23eadce587719714874a9cbb96796518976"

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
