# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.91.0/mirrord_mac_universal.zip"
    sha256 "b80b6fb8a7cde4d2817fa3d05a86e14961637877c797256a3b0d365c747856c6"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.91.0/mirrord_linux_aarch64.zip"
      sha256 "7a79cc568d9bb9b2e1e5290b8927ddb617b40715ddb50be406d0cf0847a9888e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.91.0/mirrord_linux_x86_64.zip"
      sha256 "6f7ba54aa5a2044d3d5dce85ab0cc6cb294ece61695145f70b8a041162fcd9d0"
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
