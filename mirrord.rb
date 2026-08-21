# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.250.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.250.0/mirrord_mac_universal.zip"
    sha256 "3b6ab4c4350d5bacb05b56dad771e70f099ffc5c1661c53fcdd88e16c5e8654e"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.250.0/mirrord_linux_aarch64.zip"
      sha256 "a402bcb0d3b72a02623c3977fe7b8d1edf61fcc85544100aab3c4c30ac022e6c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.250.0/mirrord_linux_x86_64.zip"
      sha256 "f9bdc78859a7ef3b017d3a5b05c57fb133cb40bbeb9de7b179268239185e40f0"
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
