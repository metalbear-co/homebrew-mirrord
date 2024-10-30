# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.122.0/mirrord_mac_universal.zip"
    sha256 "aed9cca6136cc253a5a2fe617b5d831fac308a8d1c6e28bd6f2017c9657c471c"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.122.0/mirrord_linux_aarch64.zip"
      sha256 "a27e129dd98a6f933b5f74bcc0eb92a65e15dc01383ac8e3c52690b2725b8812"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.122.0/mirrord_linux_x86_64.zip"
      sha256 "6af3cc142708753af9b780171c070d25f7a991b7463cfbcc79ef88aefb888b67"
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
