# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.168.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.168.0/mirrord_mac_universal.zip"
    sha256 "0fb35514b93fc6bf7e63a73774a3af3a58cceb1a27a5fc91ebdc9eb8843d7fc9"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.168.0/mirrord_linux_aarch64.zip"
      sha256 "20857ff6d9333d19143f12b104edd32758dad3844c435fb93cb5f10c5445603e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.168.0/mirrord_linux_x86_64.zip"
      sha256 "cf0afed5c633760309c3aff5677cf8450af0cd8e717afab65ed3ae8b908a7258"
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
