# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.82.0/mirrord_mac_universal.zip"
    sha256 "f7e608983668c0e8f6b958475bc58ecfa3cd1ff7a50e07348e228173e79921a4"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.82.0/mirrord_linux_aarch64.zip"
      sha256 "72bee33049bc4ea2fc8492e891c5ee50fac828f42d185875bd28f06af518f8b9"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.82.0/mirrord_linux_x86_64.zip"
      sha256 "7b615f5f31c5e6d3c9b4ee52858995166f0d125d705cea712d5d1390ad30fe0f"
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
