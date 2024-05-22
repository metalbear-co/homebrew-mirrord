# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.102.0/mirrord_mac_universal.zip"
    sha256 "d61563ca5d17c610abfbfc433d4612a5f394521ab0937c6f9e7253dad9265f8b"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.102.0/mirrord_linux_aarch64.zip"
      sha256 "af9675b777fc887d1f0a3d13873e4af2bdd8c20713fc293597958b1b5c248222"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.102.0/mirrord_linux_x86_64.zip"
      sha256 "591cb22661c894618c5895c140c8eb32d2c569861cd52ede0477c6654582b0a0"
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
