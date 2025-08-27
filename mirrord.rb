# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.159.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.159.1/mirrord_mac_universal.zip"
    sha256 "26c8669055594c40892173bf7eb45a5a38fdd70e82dceb85b909c22bcde58b1d"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.159.1/mirrord_linux_aarch64.zip"
      sha256 "8d7263b4f22df82da6ec8b0be7699da4ce11f13d82aa82ad83bb8a276215d7ae"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.159.1/mirrord_linux_x86_64.zip"
      sha256 "ec3673db5f4b3e72714cd2b2799015d9e3b3ad771f92553234fc26243d8901ea"
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
