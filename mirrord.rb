# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.22.0/mirrord_mac_universal.zip"
    sha256 "b9d5900f180801a6d8738d71b6fb4348b38701de23d3f56ce3fcd69f89a08ee2"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.22.0/mirrord_linux_aarch64.zip"
      sha256 "c374f65d33b90217bc8349fc14585ccf86583c95998939ddbd08ace3b4fbd728"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.22.0/mirrord_linux_x86_64.zip"
      sha256 "89682acca1f346110812b835abf196ded855b0e03203873ecaf0683ce4a16c91"

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
