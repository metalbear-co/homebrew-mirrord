# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.50.3/mirrord_mac_universal.zip"
    sha256 "b559f9aba89b40622f6c5f734427a2252c092efeee7576dcc9f3e425b05af306"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.50.3/mirrord_linux_aarch64.zip"
      sha256 "770da83ebdc7b8c718f8cd7a1ba0dc86101a4339f90d0b1504288c9daf42238e"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.50.3/mirrord_linux_x86_64.zip"
      sha256 "a02e2da4ffeba238ffee36b8a8287f59e42b834ea368104a8c30e4511aff7a4b"

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
