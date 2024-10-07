# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.119.0/mirrord_mac_universal.zip"
    sha256 "29ab1786d01cc7716c0209af33b3b45ca305c9f3a794495a5a6cde60a7848b59"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.119.0/mirrord_linux_aarch64.zip"
      sha256 "ed4838057a0817156cad4586077f39b2f2c40dfc009b978c80d2b1d0f3ef9ab6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.119.0/mirrord_linux_x86_64.zip"
      sha256 "f6e87affb37b9c861a07cefb9f21739f35cb336aa5c4c2e600cedb1f54374fe1"
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
