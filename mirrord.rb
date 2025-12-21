# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.178.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.178.0/mirrord_mac_universal.zip"
    sha256 "e705840736a3d51b552341855a6cbeab7c699e41a310f0330b6ecf60738e8b9c"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.178.0/mirrord_linux_aarch64.zip"
      sha256 "780d4f26eb9b18b08c87e36197f6498f2d636106e10678ef2adb43b3f54d2a02"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.178.0/mirrord_linux_x86_64.zip"
      sha256 "8690d3513ce3b3c9dd35ae23eb9a0bc009ba6e4e2f82ae5320a4aa9cd750e21d"
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
