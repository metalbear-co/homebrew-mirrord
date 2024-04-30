# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.99.1/mirrord_mac_universal.zip"
    sha256 "979c73027a56802aaf371fd90d2b63e80518961d76425ef70cf25386caa02dc4"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.99.1/mirrord_linux_aarch64.zip"
      sha256 "a013cb3fa849594031eeba60d72294d80afd13bd4b12732667d1408edd17b279"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.99.1/mirrord_linux_x86_64.zip"
      sha256 "ef3bedb450a2bd9fb9a4b6bc6bb67b51006a9671ca3951591dabfe98dc8d5220"
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
