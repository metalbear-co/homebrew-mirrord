# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.189.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.189.0/mirrord_mac_universal.zip"
    sha256 "d84664f321bf6f5032ab4a2543b1a197a48e3eb29bd540e6266f8b9c262452bf"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.189.0/mirrord_linux_aarch64.zip"
      sha256 "90fbc149e4e9ff956558bcb9317beded5649ddc97deb01293f654fc1ff07daa2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.189.0/mirrord_linux_x86_64.zip"
      sha256 "db00579c832ba1164558ebe7adc9731a9c5b1c9c510ef512e43fea65b17d0652"
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
