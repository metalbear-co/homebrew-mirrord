# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.137.0/mirrord_mac_universal.zip"
    sha256 "ce2faa76774308308178dafe4419d91dec67a5566a58d4f3a644dd023c7b21a2"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.137.0/mirrord_linux_aarch64.zip"
      sha256 "adc37436f7e7050cb50f3c2e468af7212a235883a5aab242e620d1300fa350ba"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.137.0/mirrord_linux_x86_64.zip"
      sha256 "c8d4c92dd69d99941425d9250b1f6ecc35823ba4a445ab030237c301b23f022e"
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
