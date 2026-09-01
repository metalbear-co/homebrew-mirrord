# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.253.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.253.0/mirrord_mac_universal.zip"
    sha256 "3d698d3cffa4095aaa0d035a2b8b82a6f5c397c22ba39bf3de23bc07d620a9d1"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.253.0/mirrord_linux_aarch64.zip"
      sha256 "5a23b86c191d335e7f2877eceb8a2829038a8ef7910d17bc94a4a36d1cc5fd05"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.253.0/mirrord_linux_x86_64.zip"
      sha256 "bdb7a4b08fd731889c07eb9d666730b1226eecf2c0b45668184150bdc617501f"
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
