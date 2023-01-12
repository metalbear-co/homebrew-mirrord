# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.18.1/mirrord_mac_universal.zip"
    sha256 "dc13681f2a2c136b12e0f35bc90013b1f4c9d2cf13198aec7a85a57b69f11181"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.18.1/mirrord_linux_aarch64.zip"
      sha256 "772dffaf04d58494f219dbcc78040216461453a8bac2ff00472fffe333e50553"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.18.1/mirrord_linux_x86_64.zip"
      sha256 "8fdda55a0a0cc45f62398eac7d2cdeb4fc9593b968aa1d70c028518f7000d3c3"

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
