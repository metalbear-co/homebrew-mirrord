# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.18.2/mirrord_mac_universal.zip"
    sha256 "3cb6d8b5a23d3c00f02966749b472b5f7d45c1a4437ebee952aed9a792da9c83"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.18.2/mirrord_linux_aarch64.zip"
      sha256 "85b4fd1ad56adc35cde28b3d5bfff467b013c43f12ddca29ffaecfeb425d673e"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.18.2/mirrord_linux_x86_64.zip"
      sha256 "e87f6da4e3dc8ffdbeca54c014004c3e0b8ffbdaccd6b1ec485a0ff927294d7f"

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
