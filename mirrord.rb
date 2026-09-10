# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.256.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.256.0/mirrord_mac_universal.zip"
    sha256 "a01bfeb3063d726def8a98efde70ed01a9a3b4b826681d107ef0bf1e307bcb92"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.256.0/mirrord_linux_aarch64.zip"
      sha256 "7a8cc690b900f01dc3725bb6b253833cf8e81371ba13bbaeb148d6699387efe8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.256.0/mirrord_linux_x86_64.zip"
      sha256 "08bd9fd00f95ffe950ef8edc751a776b8194f3779baae8a859130c60015547cf"
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
