# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.50.0/mirrord_mac_universal.zip"
    sha256 "cfc6907bae7154eb3062eac60516064263ad877af67cb76a217d1675a07fbe11"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.50.0/mirrord_linux_aarch64.zip"
      sha256 "94026dd1830129558edef412fe7b589e81a76378d728d83d2790982ef6ffaac8"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.50.0/mirrord_linux_x86_64.zip"
      sha256 "e7067657ff75abba80e35b17fd88fbefe81451dc95a7d1662a2935f5c2f9e09e"

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
