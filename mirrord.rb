# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.127.0/mirrord_mac_universal.zip"
    sha256 "c92bd34c65b3647a7d69e50e667d70ce790983f347e3b3bc6a80422bd75bbb58"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.127.0/mirrord_linux_aarch64.zip"
      sha256 "d34123dbf4cbbdbe304100d90a2192098ae106469004a246d1f8fe7c61300886"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.127.0/mirrord_linux_x86_64.zip"
      sha256 "f4292d7464d206ea087be4896e9545ab63ed8f0421f5a1e7c0317c7bf0cc7626"
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
