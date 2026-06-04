# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.215.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.215.0/mirrord_mac_universal.zip"
    sha256 "362ea8bc2b228e8d87163110703fab5993b1416bb35637f7fb9c27ed5aa33c1c"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.215.0/mirrord_linux_aarch64.zip"
      sha256 "e79ffb473bb5769c580c443e59ada9bf4e6c26a994492315c543102f2b357ae0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.215.0/mirrord_linux_x86_64.zip"
      sha256 "abc8b16ff4737f4d17a0c6e1d8b2afa0d56704e3f0937673cd07d77c9f6c017e"
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
