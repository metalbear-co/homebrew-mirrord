# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.237.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.237.0/mirrord_mac_universal.zip"
    sha256 "9efe8aaffd0abd7553c2b01a8a7017df66e8c9b7ad75351824f3a3c8bfcf40ab"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.237.0/mirrord_linux_aarch64.zip"
      sha256 "841ab84cae671a5ac9b73c4c2c5fd0e0ab3ead61142c0122214927d410392c0e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.237.0/mirrord_linux_x86_64.zip"
      sha256 "1bbc42bd3f8d3313ea69e224ac36c1eaacdf8fe06311784b2c58d4a2b49f9bb9"
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
