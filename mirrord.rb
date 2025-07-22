# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.152.1/mirrord_mac_universal.zip"
    sha256 "ffb432ccf4599ce83c9c65bce2221dd1a981580b1af16f30ac1f0b19dc50a69c"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.152.1/mirrord_linux_aarch64.zip"
      sha256 "1816228e1bd276a6871b3c6a76413b5c970044b5af43fed19e86a1bc2870c07c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.152.1/mirrord_linux_x86_64.zip"
      sha256 "21a48e1a25dee6e667d90c0b841a4888bac82eddf7180069b1332efc2dbd0e7c"
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
