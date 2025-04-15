# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.138.0/mirrord_mac_universal.zip"
    sha256 "a4ff6fdd17277f4d1bb1738b392cf1ea3f7aacaf5b8ddca17448381877dea523"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.138.0/mirrord_linux_aarch64.zip"
      sha256 "184ba6b1c0b71a6be6d318ef0a6ee4c772fd1586a8ae0664b20bd28c8bdc0da6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.138.0/mirrord_linux_x86_64.zip"
      sha256 "9999cdd57f824f09a0ec46e53ebe85ed7a95e578cde11a37a149bd2c57ef9542"
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
