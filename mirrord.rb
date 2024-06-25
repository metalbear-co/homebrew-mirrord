# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.107.0/mirrord_mac_universal.zip"
    sha256 "94deb25818dda9d947a9a283e2c2f09cd156a4892cb6937f46eea65ec5863817"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.107.0/mirrord_linux_aarch64.zip"
      sha256 "c6c6a3ceb36a3c3fa1a927854c2a1693ca461394ce1b9062b8825594da33f0e9"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.107.0/mirrord_linux_x86_64.zip"
      sha256 "bf9eadafc99a71bace76d8bcd1763dd24bcd3e8fc752d5941ab4ff2fe7f384a5"
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
