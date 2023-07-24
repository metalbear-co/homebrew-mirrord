# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.53.2/mirrord_mac_universal.zip"
    sha256 "73aafe7a61711c4561d516d44465e26b668f93197fa786333d8b16e26fcaf5a7"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.53.2/mirrord_linux_aarch64.zip"
      sha256 "ba5f3b24d8ab6c682aac1225160159a07ac025dad12be887fea50324aa20ad25"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.53.2/mirrord_linux_x86_64.zip"
      sha256 "f611a9ea28d274d22a7f9d5aa0c16fcc6e6634dd7c6d51ba8994f18ae78abe5a"

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
