# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.141.0/mirrord_mac_universal.zip"
    sha256 "c1e6e81480246a1f46b63de1966a1894ad41ae65bf24486af2af2f5debf12bc6"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.141.0/mirrord_linux_aarch64.zip"
      sha256 "bb564bcd07a5dd128dfc9231b8b1671225fba01076d0c0683656185ac6d8519a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.141.0/mirrord_linux_x86_64.zip"
      sha256 "87104bcbe9842ecc347eef53c414349574f97b5d2ee50876db11457eccd9b43d"
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
