# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.80.0/mirrord_mac_universal.zip"
    sha256 "67beb722a88b56df3b7c0ee3fc26ec3111356a9759180cb912c11c4f79a79f02"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.80.0/mirrord_linux_aarch64.zip"
      sha256 "8acd56ad6210c54d593ce8c0ddfb41c12551fafb36adaed0402268a16f082e5c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.80.0/mirrord_linux_x86_64.zip"
      sha256 "da3a5c2c9b7caf9525c995328e4fbc413e8cfe4bc4676e171ce373837cfe2c1e"
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
