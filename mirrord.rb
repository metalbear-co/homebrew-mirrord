# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.71.0/mirrord_mac_universal.zip"
    sha256 "3739d604e978e6b029ebc8238fe9357624c800ed4920581a2e793ad9604f753c"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.71.0/mirrord_linux_aarch64.zip"
      sha256 "860829a591ee268e51420e462ee18ab2eaafe2ecce5771a3892b0189280f8b95"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.71.0/mirrord_linux_x86_64.zip"
      sha256 "1f4602c57c260806f530a6181112e10af56efc8e0a985c8d5f1c6316aa55a794"
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
