# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.94.0/mirrord_mac_universal.zip"
    sha256 "6dc0d8bc5e93847dfe25eecd50d8a7dec457f02730299fbee156ee459b888403"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.94.0/mirrord_linux_aarch64.zip"
      sha256 "123403f402d6716c4197fcb564b481f5fdb53162d2aa5ff8be5c707b5b632b99"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.94.0/mirrord_linux_x86_64.zip"
      sha256 "67eb297e1d4df2f6241aa21e79152777fb0cae69404658f4f31089587da5d4e8"
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
