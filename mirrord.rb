# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.23.0/mirrord_mac_universal.zip"
    sha256 "371b13c7a8284b303e4b5dbd4f6e60f79bdbc9bed8e0fafb217c89b2d4d0ff80"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.23.0/mirrord_linux_aarch64.zip"
      sha256 "e15811b59b9094d604ae983bc326711f465d2f9a22c3f4460a01ddac62e39d90"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.23.0/mirrord_linux_x86_64.zip"
      sha256 "955f2b35eaa9b53d617eae91bc767e95ed841b2362e99b0ba48af97aa6675ff7"

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
