# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.48.0/mirrord_mac_universal.zip"
    sha256 "b9811d8adcbec6b6351c8ce47ffb28fae81af52142a1e8f211a4c23f8c0cf279"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.48.0/mirrord_linux_aarch64.zip"
      sha256 "a5fdc33c02ffc06dea7793f05cd8f3f98c0c420f6d8f37f6908eaf7e79bb7739"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.48.0/mirrord_linux_x86_64.zip"
      sha256 "bd17e64612d72510ad36ac28a844d5e2ec9d18dc4051752171a42ef9e0631102"

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
