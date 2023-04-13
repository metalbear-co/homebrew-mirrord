# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.36.0/mirrord_mac_universal.zip"
    sha256 "8510afc6623eaf01f1ad282f21d7bed36e3eca6da8efe432a7e2426211a8e8e5"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.36.0/mirrord_linux_aarch64.zip"
      sha256 "80dce6041bf501bc2b438a582cc63e1df2821a078c8ad401bc71077a09ed7564"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.36.0/mirrord_linux_x86_64.zip"
      sha256 "2871817a88234e521483c0a8a48727a227cca8b7050af849c3830121cd08f88b"

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
