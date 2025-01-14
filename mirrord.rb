# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.129.0/mirrord_mac_universal.zip"
    sha256 "69323d6a75071e2f830be0a78e13236df1c65c791854a549887bf098c0cca6e4"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.129.0/mirrord_linux_aarch64.zip"
      sha256 "5d70f20f71555075bdf0e8e53e7d52abc741e63ba1c8c85327f3ddec2df17206"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.129.0/mirrord_linux_x86_64.zip"
      sha256 "7a8be9c6b0121c0ec75fcf0798b6c92a774e6a11503c2e2f4cf08a70e129a47b"
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
