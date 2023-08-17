# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.58.0/mirrord_mac_universal.zip"
    sha256 "6c9dd6aade0e50226c6e27a0c401b695e72ed6895263c7469a57afe0f3623c9e"

    def install
      bin.install "mirrord"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.58.0/mirrord_linux_aarch64.zip"
      sha256 "94460f0f6e8608b76a5596420e5eb21af7add89d5420fc14e65b446a894af91f"

      def install
        bin.install "mirrord"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.58.0/mirrord_linux_x86_64.zip"
      sha256 "d5121b66418f432d250fb954168554a60b1f75f32513798143aa5806ee1b513b"

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
