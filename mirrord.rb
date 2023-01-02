# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.16.0/mirrord_mac_universal.zip"
    sha256 "9edd4f7fd98659cbbd53e08daff7aa28263412758b6187727ddca59bb052dce2"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.16.0/mirrord_linux_aarch64.zip"
      sha256 "112715a81e4936dd21cc0dc1f136956979367360d37bded7904c9fb1686d5063"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.16.0/mirrord_linux_x86_64.zip"
      sha256 "ad468e57848c66021013fbb31ae3aec25c0da7cd580f22b04f76c88a27b81fff"

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
