# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.151.0/mirrord_mac_universal.zip"
    sha256 "142032e9020b833ce81a2a173daeb9a716df7cfb8af82d2bf39c84ea67d9bac6"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.151.0/mirrord_linux_aarch64.zip"
      sha256 "d310e939c08521e33cb21295f16bf71d8d58bd4c23d9dfb88a13a0a6b2425fcc"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.151.0/mirrord_linux_x86_64.zip"
      sha256 "34d960f6ecf845c2d3a9543c7310b941344d98b6284d1b35db0379ffd04face8"
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
