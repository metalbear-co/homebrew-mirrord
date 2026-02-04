# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.185.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.185.1/mirrord_mac_universal.zip"
    sha256 "157cb0de60ad4384f9c83447d0fc9aab8771f783510597e8c560d5b698c9918b"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.185.1/mirrord_linux_aarch64.zip"
      sha256 "06fddd045d4ca631dde46c8bf26cab10a070b752f05413ff6dd45377bf1390b7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.185.1/mirrord_linux_x86_64.zip"
      sha256 "1be8f1d6bd30d826f34ff55ec19ec8747591ff136aedaf0d6190e9a4e39837a9"
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
