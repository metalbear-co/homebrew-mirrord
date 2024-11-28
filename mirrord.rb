# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.125.2/mirrord_mac_universal.zip"
    sha256 "5bedc219ff00e13d8efb583e0e735520152ce779609036a90fe570b740621671"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.125.2/mirrord_linux_aarch64.zip"
      sha256 "071db251a2a128ed1aeaa31ea2742d99461449356067c0ae77c2396c7ac84ee0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.125.2/mirrord_linux_x86_64.zip"
      sha256 "b7fca2ab0602a1fcbc10728cf98cfcc74d7f6e4b22c563d7e4a1d740fb6690b7"
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
