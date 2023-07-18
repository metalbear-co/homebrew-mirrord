# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.52.0/mirrord_mac_universal.zip"
    sha256 "362847d694be999f390e7714544055f3ebb0e95570ed33042b4bfcd21d40eaa2"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.52.0/mirrord_linux_aarch64.zip"
      sha256 "a17d888908f967c5975d159f60d3940d35943e288a427ba33ec931fb9a29a0ab"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.52.0/mirrord_linux_x86_64.zip"
      sha256 "bab6dc683daca79d658bdb0ce4fcea62cdd23edb8d1189badad64159de667d43"

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
