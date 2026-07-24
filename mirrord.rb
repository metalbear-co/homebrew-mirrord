# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.238.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.238.0/mirrord_mac_universal.zip"
    sha256 "fe4bfb144ffcbaec0a0fd4f87ff9c8beede42132b423eb9b98bcda16b7266f07"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.238.0/mirrord_linux_aarch64.zip"
      sha256 "27477d64715c91bd7aa1445dad86318de99ea942518e65a3b6f5c78b1aae55f7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.238.0/mirrord_linux_x86_64.zip"
      sha256 "c57e21ec8f377508bffc9e27494fc7ddf5ef334db569a069fea10d8301de1d12"
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
