# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.44.0/mirrord_mac_universal.zip"
    sha256 "e88113bf64c9bea62c1a474f0e54f448d4faba21529e5fafa0f794ad17a309d6"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.44.0/mirrord_linux_aarch64.zip"
      sha256 "0e1600cf2275c4d8cdd3d62f7c3e2809eff12614a397e14e97094703052f2fff"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.44.0/mirrord_linux_x86_64.zip"
      sha256 "7d4f4d55f33aa9e33b9ffb121378529013de0fd2dae508f66c431ee505c0bf91"

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
