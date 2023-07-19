# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.52.1/mirrord_mac_universal.zip"
    sha256 "aa0c6b423ffcdaddaa0c6aa956b2257bc3888d2c7c7974beed0b4b9766fdc5a1"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.52.1/mirrord_linux_aarch64.zip"
      sha256 "f984afe7623a15da12f91518418da584f28a8d40c05a00e98071b0d8ba72a61c"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.52.1/mirrord_linux_x86_64.zip"
      sha256 "8f733f96f293939ed1d4bae9910059cdefc8d0a0b6ae31cc2e07b9ec8e640a6d"

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
