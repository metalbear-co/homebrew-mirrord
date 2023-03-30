# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.34.0/mirrord_mac_universal.zip"
    sha256 "13cc82d92a1daef15cb618ceaee0d788be866a62217ef489a6f11926dd9464a0"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.34.0/mirrord_linux_aarch64.zip"
      sha256 "8ac1ea68ef788932978d405b2812450b47f90ddc906ac51bcc032b385d648588"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.34.0/mirrord_linux_x86_64.zip"
      sha256 "c190ca90b27f4496ea3f44ad884d04d646924002701e90906088a03b19143299"

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
