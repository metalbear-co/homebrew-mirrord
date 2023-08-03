# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.55.0/mirrord_mac_universal.zip"
    sha256 "17f485cd6890fa76db6cb86112962366c249f981ea5a00f7a8bf8f9ae99e616a"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.55.0/mirrord_linux_aarch64.zip"
      sha256 "478bee71910aad36f4ac33f4e2075e1953485a19653307030a3286db5d841621"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.55.0/mirrord_linux_x86_64.zip"
      sha256 "57676f8dc1118cc301365f864c263bef647bfff01e6b8543a3f59d303ea26abc"

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
