# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.132.0/mirrord_mac_universal.zip"
    sha256 "6def63bfe47d8cb1642fa6d4fcd17c78c0ba5557c00738bec3ce0171750e0b92"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.132.0/mirrord_linux_aarch64.zip"
      sha256 "842b87ccceb652d75d525d9395d842148fb1239a44f106ba19d9a3f5fe563d51"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.132.0/mirrord_linux_x86_64.zip"
      sha256 "e52462d9b9361988b5e5fd2aef11d9df3761c8a1727126876b6c70ae89f4b146"
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
