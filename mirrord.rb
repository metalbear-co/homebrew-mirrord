# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.143.0/mirrord_mac_universal.zip"
    sha256 "f0bb9d9a77b249b87af3c1460368b74a3945c070b1c32693917f250f066f1223"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.143.0/mirrord_linux_aarch64.zip"
      sha256 "4513b8767b89d915cf428cf9f6a875c9f5ba6f57211b13c0f033494902ccde26"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.143.0/mirrord_linux_x86_64.zip"
      sha256 "89dc43d7c946313906dd852ec49d940c6411b5093baee5223f78cfa9bd16e8bd"
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
