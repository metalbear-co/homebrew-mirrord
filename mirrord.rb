# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.30.0/mirrord_mac_universal.zip"
    sha256 "f6f03698a7ba262c70e0dbea37d18a82fbf9ea30c20a4b83b5a972469a1c16b0"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.30.0/mirrord_linux_aarch64.zip"
      sha256 "427c6f0b6a489909bccd9ec732cbfc2151d4648d4a017d1034c4643e35c9f522"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.30.0/mirrord_linux_x86_64.zip"
      sha256 "7cc4a40fa09ed97d57e018a4c041d829b909de39bb5eb9d7b2c7edc91efc7574"

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
