# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.112.1/mirrord_mac_universal.zip"
    sha256 "730f80c843b96c27b806d3dcd7ccf4b9538e388b52dfbd44f0058abf3a41be3e"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.112.1/mirrord_linux_aarch64.zip"
      sha256 "8c463d0dff3b94930e8f2ba61262ad491c53b370736c0f157987b1c480189273"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.112.1/mirrord_linux_x86_64.zip"
      sha256 "8a6b6027839567b6cdfc5205e6bb6863070abce58753a5e825c388a363ed4322"
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
