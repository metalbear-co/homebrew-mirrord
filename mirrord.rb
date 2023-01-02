# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.16.1/mirrord_mac_universal.zip"
    sha256 "2caf49fdebf59660048a4cd5f07e96449cc8273431464e199f2396040bed27c8"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.16.1/mirrord_linux_aarch64.zip"
      sha256 "7a9c9bf240ff0ebe970eab4f3288fbc1c40dc09c5e5e6db397ab33e7d08ccd50"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.16.1/mirrord_linux_x86_64.zip"
      sha256 "4ec47900bcdc33527a90d48df8d6fce75a32af094cd15412f5ffabea77d550ec"

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
