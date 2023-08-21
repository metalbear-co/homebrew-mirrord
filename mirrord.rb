# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.60.0/mirrord_mac_universal.zip"
    sha256 "c4d8dcb328872a0eef0e0ec2d2b84ea22e4dbc6f9d7eaffb0a63ca73362acf57"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.60.0/mirrord_linux_aarch64.zip"
      sha256 "942433a9be49cb088cf51dc11543c81ea7fbd09fae4fb4f0deab72e5c34acdef"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.60.0/mirrord_linux_x86_64.zip"
      sha256 "75333c08dd09046e0ea86988bbfe1773062b8d2e4f8a026764e6f292d09243f1"

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
