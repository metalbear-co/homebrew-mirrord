# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.88.0/mirrord_mac_universal.zip"
    sha256 "5b1a5561a686632796533fda6c81166e655a0d3b3618730ab000053186ac6e6c"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.88.0/mirrord_linux_aarch64.zip"
      sha256 "807d9fdbc303bfe5debd28f5f4a1449873d1d6bfd25c61d5f82df7a58dfdf861"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.88.0/mirrord_linux_x86_64.zip"
      sha256 "8dffac0b44ee63d6ff64edeb526a70fa17f295055724bfcde8a0fd35365da770"
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
