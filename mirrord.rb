# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.116.3/mirrord_mac_universal.zip"
    sha256 "517c0d6d7bcc160dc3e709adb180af54f8c78ed1793b35a52454bfc0a1d4dfd3"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.116.3/mirrord_linux_aarch64.zip"
      sha256 "800a95e427bdd10f1b11117eacdfc1cb0be49e0a60cf2bb0f2b7c8bdcf7daadd"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.116.3/mirrord_linux_x86_64.zip"
      sha256 "826041ab43538d90b9d3f40a69ce7d55acbe8a1af2b7d914ecc6c5720f076587"
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
