# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.27.0/mirrord_mac_universal.zip"
    sha256 "fffad137f982b04da6f77d7788919d03d0db04cabe1ed6a7e2390ee09d92a5ad"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.27.0/mirrord_linux_aarch64.zip"
      sha256 "abdf908a6f710df1d2ab609940559f79d8c368c76d369e0318c4745a30e19154"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.27.0/mirrord_linux_x86_64.zip"
      sha256 "d18c12d7cf9b3ee392d369de5cfab80fd57b3b302dbed2db52a2b7319149c68b"

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
