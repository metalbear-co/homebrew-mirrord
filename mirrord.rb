# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.149.0/mirrord_mac_universal.zip"
    sha256 "3a83ed9555f3e71706f57f927b3e9b28054e91f05af8ca26f2bd97f128524135"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.149.0/mirrord_linux_aarch64.zip"
      sha256 "5d1bdc0fecc128abfd15f80100511701770390a505f8ce1265d3cf475e78ac29"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.149.0/mirrord_linux_x86_64.zip"
      sha256 "2a28d3da929ed3a144a2d37f86ea8d3db9870cd9c34218d95607067d28f5ca59"
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
