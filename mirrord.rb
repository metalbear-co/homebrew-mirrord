# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.10.2/mirrord_mac_universal.zip"
    sha256 "6caacc8a54998b34f2599e35595a15f0fb5eafecfead9791fb59e8a1abf96864"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.10.2/mirrord_linux_aarch64.zip"
      sha256 "e0044bf64449f5ee3de45f260454dbccd752d4596985eceea32191e28ccdf898"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.10.2/mirrord_linux_x86_64.zip"
      sha256 "2641e32a770a6279b8a4ddcd3d66ce0f7e811ac04ae80ed1fdc5e3b4eadda184"

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
