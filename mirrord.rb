# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.75.1/mirrord_mac_universal.zip"
    sha256 "6c6bada7e54444ff16bd63ec4f4246c197e46459cf85fc4abc08c68ff44a3721"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.75.1/mirrord_linux_aarch64.zip"
      sha256 "d899e7deac0b4fe354d6d509abacf23df917bf0f00a0e6e877999d350b89de72"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.75.1/mirrord_linux_x86_64.zip"
      sha256 "4697a361328bc706b46af4b962b0cc698ba65a02d7d03462ef5b713b020d712c"
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
