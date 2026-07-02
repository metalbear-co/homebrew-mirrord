# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.227.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.227.0/mirrord_mac_universal.zip"
    sha256 "fbe8218a2cab6c0d14ea013acf4c3be6df74acbb269a232f31d3f122ac716383"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.227.0/mirrord_linux_aarch64.zip"
      sha256 "4d244660330ca41e732de17768ee11afb7016b7cd570ba5ce7585f33a18039d3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.227.0/mirrord_linux_x86_64.zip"
      sha256 "e60ebaeffe0e9cd4c98eb9cd8189d1b0a9d2f98993c5c853760a09def3b119fc"
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
