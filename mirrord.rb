# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.142.0/mirrord_mac_universal.zip"
    sha256 "73eff0bfe86e688e46b0b9a50495ece8581dcdd839112e1b08c0d018745981ff"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.142.0/mirrord_linux_aarch64.zip"
      sha256 "10dd7de6a7f5e014f2c4e708d4a2bf485815be411be34d109eb9344b21eea905"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.142.0/mirrord_linux_x86_64.zip"
      sha256 "eb0162f81ee5128d426ce2f4d98f5604d5d062adbbfb9b7485e63702cf70f922"
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
