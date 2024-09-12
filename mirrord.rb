# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.117.0/mirrord_mac_universal.zip"
    sha256 "e35864ae7d1bb428456c1ff01515a8fb783d5d264d62fad0e688b27d6d30d1e8"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.117.0/mirrord_linux_aarch64.zip"
      sha256 "235124be2dc99c21b3a58baf40af2ce395ee3100e242e0e79d9f3b602cea1a1f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.117.0/mirrord_linux_x86_64.zip"
      sha256 "c07d2c5945b36a2bd4581a287aee909513dd520eecc42612d12057a99ed2272d"
    end
  end

  def install
    bin.install "mirrord"
  end

  def caveats
    <<~EOS
      mirrord has been installed, but if you'd like shell completions you'll
      need to manually generate the completions for your shell like

        mirrord completions <bash|zsh|fish>

      To ensure it's always available you can add it to Homebrew's default locations.
      Follow their instructions here: https://docs.brew.sh/Shell-Completion
    EOS
  end

  test do
    output = shell_output("mirrord --version")
    assert_match "mirrord #{version}\n", output
  end
end
