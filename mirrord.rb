# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.108.0/mirrord_mac_universal.zip"
    sha256 "860997b1bf2cc144a5e900a20b3af9b51a7a35ef06e0b436f444c9b6aa690ebe"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.108.0/mirrord_linux_aarch64.zip"
      sha256 "19d30c8ec11c0ce53ebf86330164a58f4310ac01b4e0584e1c8bd156fed33de1"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.108.0/mirrord_linux_x86_64.zip"
      sha256 "675b28ac9254021a159e717817c40bcc35af9d9365c26992978273fec7f5a6cf"
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
