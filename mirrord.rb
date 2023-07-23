# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.53.1/mirrord_mac_universal.zip"
    sha256 "2994ecd4ac8f055acccae22497b125a882c3597154048661ddb1dd14651ec29f"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.53.1/mirrord_linux_aarch64.zip"
      sha256 "588f2b610f5926958417b4c713f959267d8bf18bff8c16988da0b98591c4ed47"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.53.1/mirrord_linux_x86_64.zip"
      sha256 "64c2322b6877b3c6a97216aa83603ecd1576a1c34eec41cff9f6f8c85ce43391"

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
