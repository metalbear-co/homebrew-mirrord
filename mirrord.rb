# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.96.1/mirrord_mac_universal.zip"
    sha256 "995787115439288eccd8c2d7ac19c6cc562ce0b35e9884b2129f7843068df158"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.96.1/mirrord_linux_aarch64.zip"
      sha256 "27218ded229422fc9e35fa006f8a04c2c3b17122b4d0e3b60eb2d4a71510c963"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.96.1/mirrord_linux_x86_64.zip"
      sha256 "0ccd985c6336a8da082cc4724baeb92ffe2f572bf80db7129422da8639e28f96"
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
