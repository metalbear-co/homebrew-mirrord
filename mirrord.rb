# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.72.1/mirrord_mac_universal.zip"
    sha256 "caeace32fe622a25bca3ded66310e9aa9a51f0736dcd17d8d3e93a48fdfc7380"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.72.1/mirrord_linux_aarch64.zip"
      sha256 "7800e0fb21d308648ff10c1c6af7f0a62c04a59fa855ba857fe48bd17ddc2138"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.72.1/mirrord_linux_x86_64.zip"
      sha256 "bb73b0fd9f78d350560803347a838709e0627f67ef0cff15128d0a65ac1ffc83"
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
