# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.132.1/mirrord_mac_universal.zip"
    sha256 "62043d82aebff9f98426a6c5a4fac29212acef1a25f5f44fb1c1413a27a5f741"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.132.1/mirrord_linux_aarch64.zip"
      sha256 "001a0cfb812b722367ed9f30b7fbf3fe685c8968f8b68cc566005e1d99d92759"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.132.1/mirrord_linux_x86_64.zip"
      sha256 "134c9b60894eda1fd9eb62124a6a76ac63d19eafdadc3185a85930400dcb91dd"
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
