# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.54.1/mirrord_mac_universal.zip"
    sha256 "0748d8f95b5b428d4a136da64d9077eeadfc99ddf68a78686a174526265602a9"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.54.1/mirrord_linux_aarch64.zip"
      sha256 "266d692ebed589f440fd1e40b1209c810fb914ffd6b608ad18341917d07cfdfd"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.54.1/mirrord_linux_x86_64.zip"
      sha256 "a468bed01883b58ffe899b1430745b1ce33745c2ae05e31e2e52417cdff7cf11"

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
