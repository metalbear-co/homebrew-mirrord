# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.31.0/mirrord_mac_universal.zip"
    sha256 "f8bc517c71a8da408f98feb08a6c512288001f51b55bcd58664a33726ff80aad"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.31.0/mirrord_linux_aarch64.zip"
      sha256 "8969d02846134d6b27ebb0455ac75d954f431fbb12ba6ac1b5adcc3aa39b8587"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.31.0/mirrord_linux_x86_64.zip"
      sha256 "8046933e471b06eeaff339d1ee7dd94ee19ff26bd5c808dd4372b71749269792"

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
