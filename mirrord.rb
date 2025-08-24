# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.159.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.159.0/mirrord_mac_universal.zip"
    sha256 "2f587f7780abf8252639288934e4841a1f734b3750db0b1e646a00c5d48005a0"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.159.0/mirrord_linux_aarch64.zip"
      sha256 "9c6f868f198af0bdf29a3cb016a2b2ea292ae37dc525e867db60da1d56d58412"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.159.0/mirrord_linux_x86_64.zip"
      sha256 "c4ffb89bf37247ca4109d73344ff3e04a161c89fb200ae57bff506e691eec864"
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
