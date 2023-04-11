# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.35.0/mirrord_mac_universal.zip"
    sha256 "387edb8884d90621c9d7ef750c6c83c425646c210ea431bc4a162c97776249ac"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.35.0/mirrord_linux_aarch64.zip"
      sha256 "90c643472bed631a2fa885d26b11c58ecbce4a076ae0854dfc67c126fc99753a"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.35.0/mirrord_linux_x86_64.zip"
      sha256 "d585e3b20d66ebdebb533b7a85d04e6c0c6cb1dd2d0692714cd25104f3b64903"

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
