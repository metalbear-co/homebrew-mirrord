# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.12.1/mirrord_mac_universal.zip"
    sha256 "9e38a565c8e02544d7ecadb693076990a0125520eedb4a44759cd377fee978ae"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.12.1/mirrord_linux_aarch64.zip"
      sha256 "193ef3f949c46b7e3b32883a38f0f99be7dbf05a4b0d1b23c39ea4f03260814d"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.12.1/mirrord_linux_x86_64.zip"
      sha256 "566f42332fc020f9c021dee6671cec987110ef9f91a19413418a9c4b590b55ee"

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
