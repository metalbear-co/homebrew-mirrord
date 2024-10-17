# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.121.0/mirrord_mac_universal.zip"
    sha256 "5b27610a43c0ae366c11b584ab6700a6a7413d6ff151c490ab5ef0edb0d65944"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.121.0/mirrord_linux_aarch64.zip"
      sha256 "e9fa9384bd563f2c2884c791bc5e20e9aa628d083cfb4034e20abf237ff1b72f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.121.0/mirrord_linux_x86_64.zip"
      sha256 "2bae0f87f224936f0756918fb8bb5ef16a6d8ba94bb561dbc2ed50863c7f4bbb"
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
