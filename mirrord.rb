# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.122.1/mirrord_mac_universal.zip"
    sha256 "d3f1b0c4c5d204936c419800d0e3ef58091d45dd9829019cf789ad1c73517f9c"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.122.1/mirrord_linux_aarch64.zip"
      sha256 "7729a2a689ef2c558b6d7761346218a45ff02c0e1da689bfa32c0f322c1f0056"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.122.1/mirrord_linux_x86_64.zip"
      sha256 "6815c37502732daccd4df30a9c974aba146646205a79fa17f238049ee73290a0"
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
