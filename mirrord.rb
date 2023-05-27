# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.44.1/mirrord_mac_universal.zip"
    sha256 "ddbdda5f488538a8f16ac008d5de074624c0e18c159632a6a4410a770240d848"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.44.1/mirrord_linux_aarch64.zip"
      sha256 "8b14b03e00122c7762493204fdc60a3f721acc0acc4ff30406201dd64ef6b219"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.44.1/mirrord_linux_x86_64.zip"
      sha256 "7ed8b1fe9ac41f7d496601e2419311012bb827ecbf77d9658e5d633d976ef113"

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
