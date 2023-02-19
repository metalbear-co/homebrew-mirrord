# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.26.1/mirrord_mac_universal.zip"
    sha256 "5025fb65fa2dabf05865d28606ec37a261935c8c76c1420777b7a02511786c05"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.26.1/mirrord_linux_aarch64.zip"
      sha256 "1301d2300eb751bf130e6561aa48c280d12724e9f785bb38e2db17fec18910cf"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.26.1/mirrord_linux_x86_64.zip"
      sha256 "31f795759958c04fe5094ad327f3cfc04f50c139866df3dcf6b20f4d0690dd47"

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
