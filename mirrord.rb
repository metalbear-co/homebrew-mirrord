# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.57.1/mirrord_mac_universal.zip"
    sha256 "e6fb9720932f09372939214a0c182c31c8f2735b10d1d2dbb5da1ecac83047ef"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.57.1/mirrord_linux_aarch64.zip"
      sha256 "bbebfcad42b152e6c14a5183484961e56b12579bd5af71c02e696a0133ed3459"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.57.1/mirrord_linux_x86_64.zip"
      sha256 "57b2a78486dcae718714efaae71a417b83b079a466909e5edd08425507193d85"

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
