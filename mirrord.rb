# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.77.1/mirrord_mac_universal.zip"
    sha256 "098161ca4c5a788f2027bdbe4022b545e30e79b11e3cbfce9515b6394186d0ef"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.77.1/mirrord_linux_aarch64.zip"
      sha256 "c24e533bb994cbab82191a3514e62c84a26053ad520654013026965e87ed2053"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.77.1/mirrord_linux_x86_64.zip"
      sha256 "1290cdbf315e793e184fb5bb1ff71729d9c3b44bb1e1a1cc73d279c2552ea0da"
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
