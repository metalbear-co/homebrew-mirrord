# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.49.1/mirrord_mac_universal.zip"
    sha256 "0b336abaeb2db1c959c21a05e910e250b93126b02a054f71d987802c11392002"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.49.1/mirrord_linux_aarch64.zip"
      sha256 "5703a8c039f02c1fefa4f138c5d7d52b091f2c873ae8d06348c795801c993155"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.49.1/mirrord_linux_x86_64.zip"
      sha256 "28848f0ef87b1c8b272a4e7daffbefb0b016eada8f21ba79013d750a1a1daf30"

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
