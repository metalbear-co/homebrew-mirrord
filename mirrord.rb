# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.74.1/mirrord_mac_universal.zip"
    sha256 "60fefa373e6c5a7414402a63ebc6a83e639c227ddcccbd381e4bc727e8b88d9c"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.74.1/mirrord_linux_aarch64.zip"
      sha256 "02ddb4fc763cf76de644bde9f48b2b7e5ec6b7ec09bf2d254cc6c6bd09acb559"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.74.1/mirrord_linux_x86_64.zip"
      sha256 "3ee81314b83d447640c0b6d52f3f79425a06cc6258a059417f5523c97dc618e2"
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
