# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.245.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.245.0/mirrord_mac_universal.zip"
    sha256 "9bc33c44c8e28be53e602ba4b85f0067d7b51b2667c7caf92be6d5487b6c2b13"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.245.0/mirrord_linux_aarch64.zip"
      sha256 "c464dd09a86fc84b05e71b6b4e0223fcd1cae45772f76200793ad3daf6e07d60"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.245.0/mirrord_linux_x86_64.zip"
      sha256 "ad725c2a0086382b993cce72d3a8a5884f8269e3bb71589185d0b521590fb096"
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
