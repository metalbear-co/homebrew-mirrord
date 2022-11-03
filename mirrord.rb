# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.5.3/mirrord_mac_universal.zip"
    sha256 "a95facea39c581f6bccd512b3a8647264ecff21764a5ab86a3c5d4bc838e60fc"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.5.3/mirrord_linux_aarch64.zip"
      sha256 "e0044bf64449f5ee3de45f260454dbccd752d4596985eceea32191e28ccdf898"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.5.3/mirrord_linux_x86_64.zip"
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
