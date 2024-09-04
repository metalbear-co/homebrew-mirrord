# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.116.0/mirrord_mac_universal.zip"
    sha256 "edeabb618992f7b41ea7c769e4a7f0f0833332cc772ae3d21422bbf1b428d8da"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.116.0/mirrord_linux_aarch64.zip"
      sha256 "89a956e83311ded8bb73003b907451edd1a6c555521c61c112d3b595ba097661"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.116.0/mirrord_linux_x86_64.zip"
      sha256 "aba32642306e8a4fb6e167626b4678ac8aa4c7ac8b6061b5b071ffa05fe92446"
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
