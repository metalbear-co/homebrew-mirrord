# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.13.0/mirrord_mac_universal.zip"
    sha256 "67924cd818cc01a79f6437792fada4301f10bf06412ed8087c4c884157c37c92"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.13.0/mirrord_linux_aarch64.zip"
      sha256 "041b49cf8f7124dd3674e3f3ff363868162754297c5d2fbec917548851e623a1"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.13.0/mirrord_linux_x86_64.zip"
      sha256 "6a32b1359e5606bb621b34d96c364355ab382143e21db78f13ed0f83123d1434"

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
