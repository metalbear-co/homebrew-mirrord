# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.192.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.192.0/mirrord_mac_universal.zip"
    sha256 "fd98ba2d0f781985a9f51c9eb429ed25a7ad0f41a3396f8590f6e39fb5d4dc46"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.192.0/mirrord_linux_aarch64.zip"
      sha256 "6996ff232d2859cf50318087ad3f010b2826b881e97650cc4d92d766650b5535"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.192.0/mirrord_linux_x86_64.zip"
      sha256 "60bcbf5395e616f0d52b1a9746e5393ebe53c77bc0b98387d80a94c9c90c1ddc"
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
