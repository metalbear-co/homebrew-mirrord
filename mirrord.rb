# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.18.0/mirrord_mac_universal.zip"
    sha256 "c49cb6f867f3edc868adfe94c0ea3a8cbdaeab42fc1c425cf07704993237db62"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.18.0/mirrord_linux_aarch64.zip"
      sha256 "1dbe4cb1a7c6e897d5e905431dae6d4693cffa579d552562d5318f469f4caa95"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.18.0/mirrord_linux_x86_64.zip"
      sha256 "849bf69b04ac01073abac9999c560afb42b9b96b6de929e9155f22db0fee1c08"

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
