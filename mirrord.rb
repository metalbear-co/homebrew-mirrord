# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.13.4/mirrord_mac_universal.zip"
    sha256 "d6cbf9ee7fb1a08660bd38b098c3bc500becd1b5c4c92675f9a9882650da6e1b"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.13.4/mirrord_linux_aarch64.zip"
      sha256 "de63a56459a406b3f4ae9564002255b2ee8f4a4e9e89a8a08b11203ff345e59d"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.13.4/mirrord_linux_x86_64.zip"
      sha256 "381e5be2a7f0cdb1ae582dfa4508ff8b48e34727cdc892d229d1495faa228b0d"

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
