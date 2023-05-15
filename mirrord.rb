# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.42.0/mirrord_mac_universal.zip"
    sha256 "527a1125154317267c1e8486f5d2901b181ed3590a873ba8cdda01563a26443c"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.42.0/mirrord_linux_aarch64.zip"
      sha256 "e4ac72b50411be3f3342381c29d9f2dc8b9c56b04ade34c5be7375c0518f5a1d"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.42.0/mirrord_linux_x86_64.zip"
      sha256 "3420f933e3bc5603aebb97e69bd1e555bb46ba38ca7395cd924730ab24c6c082"

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
