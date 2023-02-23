# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.28.2/mirrord_mac_universal.zip"
    sha256 "641d2f29a9d3eafdc39052c15c948a5d9deebae214aefa7a4d89ab6764a68468"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.28.2/mirrord_linux_aarch64.zip"
      sha256 "5aae18c0c4f352b770a49728fbf0bb9d2cceb1e5dd735815c68272e7943d9cb6"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.28.2/mirrord_linux_x86_64.zip"
      sha256 "7b24a79b9ed7f9d944f41d803ac39ee6826f2d3ec9dc221ac3eec2aa5132f40b"

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
