# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.19.2/mirrord_mac_universal.zip"
    sha256 "27b373f7844c67a602a68543b36211c836b30180c2808d203a5f6eeada6d5277"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.19.2/mirrord_linux_aarch64.zip"
      sha256 "220390a29c92614660e8cc0d56738ee651562bab144d6da7c2aad0c55e184559"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.19.2/mirrord_linux_x86_64.zip"
      sha256 "21cc02bd6b2dddcc3785331ed64020813306a7781d9a2d7f8b6075805ec69376"

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
