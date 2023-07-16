# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.51.1/mirrord_mac_universal.zip"
    sha256 "ed4a40f9a3d7830fa87b77ea8709a9f6750c9e30e5299201a9006cbc2b45fe5a"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.51.1/mirrord_linux_aarch64.zip"
      sha256 "e212e6196dc80f041c6a7dfd0c973aa0b4986d2c911aad224dc10414f1e71765"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.51.1/mirrord_linux_x86_64.zip"
      sha256 "5dd8e3aaae8e48a522cd86bfb3c0d3291eba6cfbb3ad1b0362757a619d78699a"

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
