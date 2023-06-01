# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.44.2/mirrord_mac_universal.zip"
    sha256 "23134ccb5d4b8d3db199b4735cbf3df92ff2b7fa0554299e4189109012a3804a"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.44.2/mirrord_linux_aarch64.zip"
      sha256 "d710a11581090f12d8dd0b3f040184599ba0ce0cc43324774642a078e3dc245e"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.44.2/mirrord_linux_x86_64.zip"
      sha256 "3643430348814aae9e9ed20d60c62af5601c9942e4d3b09119ae5334a90d7a00"

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
