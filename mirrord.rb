# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.234.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.234.0/mirrord_mac_universal.zip"
    sha256 "1796291ced761ccd7545165982950b747d9ed036e62d934210a7a63d0ce622e1"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.234.0/mirrord_linux_aarch64.zip"
      sha256 "2e733585c4e4d963d967b6764a3204bf6b0293aaf3608af0012f6f2f73e71b98"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.234.0/mirrord_linux_x86_64.zip"
      sha256 "cb7e682d7d59e86f9bc18ad7b54fb6189e2e7f24ce7339ac064fb5ddd35ba4b3"
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
