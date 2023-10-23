# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.73.0/mirrord_mac_universal.zip"
    sha256 "5bfd4d1e91e146f4c9b1760120efc82b50c2e569eee26559c55f7ac1d08eb843"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.73.0/mirrord_linux_aarch64.zip"
      sha256 "b93b3441adb374e3c1b79b9a23b4154469fa15f9554b90fa6791e76103905e01"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.73.0/mirrord_linux_x86_64.zip"
      sha256 "9ceadf1b2c997be2cbe27f994d165b56afbe0499951ae415b769a5fe6dbf915d"
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
