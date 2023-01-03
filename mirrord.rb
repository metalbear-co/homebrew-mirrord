# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.16.2/mirrord_mac_universal.zip"
    sha256 "198cfecdd5cd7fc9f70fc91264f76dfd83ea1e45e4b9a3b3e6f1f0f45d5594bc"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.16.2/mirrord_linux_aarch64.zip"
      sha256 "c6c36d20605051e8c7d431c65f267f17ac0224ac4430df0daea64c707db290fe"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.16.2/mirrord_linux_x86_64.zip"
      sha256 "806aa52c49b6490bfade713d76558595b10b5e553824066de2eaaaa5590bf0c9"

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
