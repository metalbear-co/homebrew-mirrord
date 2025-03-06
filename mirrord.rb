# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.134.2/mirrord_mac_universal.zip"
    sha256 "b99c4a5ab9fc0482b7024585740ed15b7e25ae78959d13027e421e08337d459e"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.134.2/mirrord_linux_aarch64.zip"
      sha256 "4b339bd7771b22e50d07b5c6e01c159729013cd32d9ae0711b401dc9005aced7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.134.2/mirrord_linux_x86_64.zip"
      sha256 "065e157e477dad18dbfc1a4b10136f2668ef3cc49fb6bc2c1550e24ec44f9e55"
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
