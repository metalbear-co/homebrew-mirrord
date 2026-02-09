# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.187.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.187.0/mirrord_mac_universal.zip"
    sha256 "782fb38320efde02c7f8a696a2ae4b67d5cf45f9d7e958c5bc709b95d90d9491"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.187.0/mirrord_linux_aarch64.zip"
      sha256 "e23769c0cfe41258bb8b10773117b8fcfb367b0954c1dafda4de71b6021b4eee"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.187.0/mirrord_linux_x86_64.zip"
      sha256 "4914e79ff5c2d59f49187ace1a0e495a94b5e014bfc8bbf06c959d9a3a0bf16c"
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
