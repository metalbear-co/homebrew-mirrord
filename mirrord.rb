# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.185.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.185.0/mirrord_mac_universal.zip"
    sha256 "fd3ae135a0bbdfa70a0a7951d81a4b99aa034f7efcf09e843a3cdedac0803c21"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.185.0/mirrord_linux_aarch64.zip"
      sha256 "d121e1cfe27a3734ea75a02c949c9a9b031b5e3edcafb9988b1555a02b737606"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.185.0/mirrord_linux_x86_64.zip"
      sha256 "819cc02314266eef4e8f10277c5a1c0d1dc9465ce603fcf1a5c6486db9ca974f"
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
