# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.79.1/mirrord_mac_universal.zip"
    sha256 "e17e8b2ea56d5c9819e84710e38e255bd982bd507e32d4b1c51fffb2dcdf75e8"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.79.1/mirrord_linux_aarch64.zip"
      sha256 "5d82d96d86455b03089ffab6f33f31da3d7d0939cfc877f377a14ec1d74cdd7b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.79.1/mirrord_linux_x86_64.zip"
      sha256 "3ff52e82b1614f6db580042331e17f13385ca3f27a08d5bc9958a0bb53bcb624"
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
