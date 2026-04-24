# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.205.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.205.0/mirrord_mac_universal.zip"
    sha256 "9b757ed8f730ef47e60d7db77f84ec053c94af526c18a45a6d001cfaf94ecbca"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.205.0/mirrord_linux_aarch64.zip"
      sha256 "fea6a96904fdde76de91b85f73fb4f07b682cfa3d2b3e04328f6646d5e9126f2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.205.0/mirrord_linux_x86_64.zip"
      sha256 "7b1c2e2f0ac2423362f394caf9a9136f642943bc039d62ff089c135cd78b0e99"
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
