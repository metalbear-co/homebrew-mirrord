# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.204.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.204.1/mirrord_mac_universal.zip"
    sha256 "6bafa406ddeadf2fb0e57df45fa2349fd5ecce10f7524f449976b5524c408e21"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.204.1/mirrord_linux_aarch64.zip"
      sha256 "2f6d343d7ce8e7e3c1204add492eff802b667ecf6e76e7387aafa028a679f696"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.204.1/mirrord_linux_x86_64.zip"
      sha256 "07606c8989f843d58a003502a77cb5469d10e222bb3c0a091ba298e8163b5bb5"
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
