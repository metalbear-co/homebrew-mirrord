# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.243.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.243.0/mirrord_mac_universal.zip"
    sha256 "ec100d9c5521b6dea923c0218dce48fa2365a1693041a9ab064334c2dbf27f9a"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.243.0/mirrord_linux_aarch64.zip"
      sha256 "20e53c67c4128c7c6d6ad55586a1ee05579d21ec4357563bfee879e20d3c56c0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.243.0/mirrord_linux_x86_64.zip"
      sha256 "022b41c8edef8cf8db4b186102817ea017cd740f70ec7c8cd3313a493c413011"
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
