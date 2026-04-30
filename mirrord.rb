# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.208.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.208.0/mirrord_mac_universal.zip"
    sha256 "61892e4b6c7a579a8ab76535b5b37456718c99236e53e2b64f316df84433c540"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.208.0/mirrord_linux_aarch64.zip"
      sha256 "84a34400f084466274b803c950d2a61800c601035ccb0c7c44ae0540c572e2aa"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.208.0/mirrord_linux_x86_64.zip"
      sha256 "4eb7dac988de23649a9fa3fe1c96d13cd5604c86d6894bf104b8e83d3e94a6f9"
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
