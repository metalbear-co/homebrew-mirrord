# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.130.0/mirrord_mac_universal.zip"
    sha256 "cc0e38845c210e42a391b7ec83a3bde2c885bfe9893c32c7c784c47c6386d73b"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.130.0/mirrord_linux_aarch64.zip"
      sha256 "d790eff6688acaaf2075a3a1713fac4c74cfd4052b3aa213a56ed3a1b9dfbd08"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.130.0/mirrord_linux_x86_64.zip"
      sha256 "5c4039916292aab95a78e71eb5d9ba3fbe3f71058b459e7685ed3419acd8b2ca"
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
