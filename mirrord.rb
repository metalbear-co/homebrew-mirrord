# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.17.0/mirrord_mac_universal.zip"
    sha256 "2e871d974dafbf49c6a78b97386fee8e72d248f7eee80b142c509f51276d348e"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.17.0/mirrord_linux_aarch64.zip"
      sha256 "334b5f4a81152b3c6dd660b1b523ac871541d7fed95c2227b9321a1ecd4f2919"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.17.0/mirrord_linux_x86_64.zip"
      sha256 "e210426525eaec0836358ec14afaba01098d9b433d03cb04234b43e1f19ea9d2"

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
