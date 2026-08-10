# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.246.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.246.0/mirrord_mac_universal.zip"
    sha256 "5a49fb844e7a8c5e68723f40dbb15cac7005b88d03c1c2b38c3e36b94f47cef2"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.246.0/mirrord_linux_aarch64.zip"
      sha256 "a6e5de48b7c257a3797921cf6342bc5c299ecb5e2d8ce67c0580fe844c6dd602"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.246.0/mirrord_linux_x86_64.zip"
      sha256 "9df23ce5e764ee7b1578122f7799c8c5aec3bae94d81e7c34b05eece2a6c0407"
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
