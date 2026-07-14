# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.233.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.233.0/mirrord_mac_universal.zip"
    sha256 "3c867330750364775fde57eabe595bd33e63e678ecfbd5139d134b52e9ca6bfe"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.233.0/mirrord_linux_aarch64.zip"
      sha256 "1cf2f52a79e0ec00a6e393c60125d0d4ca9eca6511c446973e4772630856aa54"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.233.0/mirrord_linux_x86_64.zip"
      sha256 "d2a377fc77675d5b7aa95bd8ee31e03177cb3e5eacbcfd15548ddd9aa27bacf1"
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
