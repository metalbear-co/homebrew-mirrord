# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.14.3/mirrord_mac_universal.zip"
    sha256 "eb66a05966743bcbbe4866af106b3eab66b1fc3a53445d408e6aa80f54a51ba8"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.14.3/mirrord_linux_aarch64.zip"
      sha256 "e856235fcc927595f825059ee0fc1e39b2aad8d234268ff564761bc4bcb7fa61"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.14.3/mirrord_linux_x86_64.zip"
      sha256 "8666918d607fca9fc323cb74312ce041233183eb6c36125229ef4f29cee05edb"

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
