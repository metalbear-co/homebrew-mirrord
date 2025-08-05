# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.155.0/mirrord_mac_universal.zip"
    sha256 "00708d1a4cdf0ba948ceaa81c5f69db5149c3f888a7cc9e441a63bfbffa58b2f"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.155.0/mirrord_linux_aarch64.zip"
      sha256 "2a8d690ecd2ec588e93290e5e29157af8aa9f790e6d2f186f88900ef7a2e6780"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.155.0/mirrord_linux_x86_64.zip"
      sha256 "2bd38e7bb5513d0c5ab6d8ec28cab9b95fff04702aef367f3b28484b995995e7"
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
