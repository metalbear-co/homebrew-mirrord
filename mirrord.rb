# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.32.0/mirrord_mac_universal.zip"
    sha256 "40dfbfa1b887ff1c8397dc71db0550c5566b87d1295e483884f3e1fb10aac401"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.32.0/mirrord_linux_aarch64.zip"
      sha256 "23ced9ab238350725763f38bbb84d4580152d3a1f7c1185aedc5aa1e8932d7dd"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.32.0/mirrord_linux_x86_64.zip"
      sha256 "fcbd6de8fe5db5c18fb52997f40051451f66fa545146c2c5919c332e4e4c65ac"

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
