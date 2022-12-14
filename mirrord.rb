# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.14.0/mirrord_mac_universal.zip"
    sha256 "46859e26a03b4aefd9faf74e2d66018eee5f785d729081bdf9ba1e94334a7b12"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.14.0/mirrord_linux_aarch64.zip"
      sha256 "1c9e8894f303656e345df1ab76890692451d53f055434b1858382ad0f41b6c7c"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.14.0/mirrord_linux_x86_64.zip"
      sha256 "b6146e02e485b6098ba90f9e3393cdd195e47fbbc2b5b7f2205caa1068679bc3"

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
