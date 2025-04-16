# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.139.0/mirrord_mac_universal.zip"
    sha256 "1d6d299708d15a783ddedbfc98ab62110cb9c36ca42e3e1fe63e38cbbd943146"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.139.0/mirrord_linux_aarch64.zip"
      sha256 "c39424accd7fc873314543cc336408da9ecc273497a64d2e8cb65a01d16f765d"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.139.0/mirrord_linux_x86_64.zip"
      sha256 "8c5fb6f73b1de765b055e2cfd7f2a78d232aff6ff2dacdb374289bdbf8e2b5b2"
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
