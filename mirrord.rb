# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.89.1/mirrord_mac_universal.zip"
    sha256 "e567b5e39f667f760522d4eadb5c12507bcf6c40c3fa40f460021c546fd0afce"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.89.1/mirrord_linux_aarch64.zip"
      sha256 "3ee21155849f5d857258e9027ccd45910d2a8abb10fa3c02136e55795db4b231"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.89.1/mirrord_linux_x86_64.zip"
      sha256 "2f0ce4e461a4f8867558d31ebe320d2967fe0f69ec113b1a01ccd6f606c4e5a6"
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
