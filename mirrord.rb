# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.28.3/mirrord_mac_universal.zip"
    sha256 "a7a73501673d51171bb0f263f4b11278864b181a980d95c9c09b3a3937543bb3"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.28.3/mirrord_linux_aarch64.zip"
      sha256 "ab16c0a6140e6708468d637c356965594d8428a1b0479192202b483c6a8c6a93"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.28.3/mirrord_linux_x86_64.zip"
      sha256 "52f5a9f1d9659b857dc69cce23f2b1ea546666198219a1519c79fb4ded3d82ae"

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
