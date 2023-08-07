# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.56.0/mirrord_mac_universal.zip"
    sha256 "b39c5d45bafbd5cbb68b0bb3f8ada2d0a8563be5ee2ccb8f6ff08220ffe22d14"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.56.0/mirrord_linux_aarch64.zip"
      sha256 "928f94fbdd79ac2e7fb8a3b6abe36f1cc22ba3fe0908916212cce95d11b4a308"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.56.0/mirrord_linux_x86_64.zip"
      sha256 "5ca01cc4887dd4bb09f20380ff6125eb79d86360d733c9db9528ccf8bbef2800"

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
