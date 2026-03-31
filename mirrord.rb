# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.197.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.197.1/mirrord_mac_universal.zip"
    sha256 "116f8e57ea119444cdb710ffb44120c2c526bbe04b5312fbc912a314cd881423"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.197.1/mirrord_linux_aarch64.zip"
      sha256 "d8c639aff96c5240376f63c04f682ac16cb8fba135a36564087b5cd14e9c55a6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.197.1/mirrord_linux_x86_64.zip"
      sha256 "d5727b702ee43c8aa4b904209afb8f6d1e100408c6a26ab98ae296d184428ebe"
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
