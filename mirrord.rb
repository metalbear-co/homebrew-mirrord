# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.70.0/mirrord_mac_universal.zip"
    sha256 "9d3cd68eb1169b8e5dcc13329d937435307fadef66a3c9ab9a0bfbdd2dd62e1d"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.70.0/mirrord_linux_aarch64.zip"
      sha256 "9b0b8385cd44b682e244ada3b48cff4d5660769bed92f1e7dfc3163f2be076cb"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.70.0/mirrord_linux_x86_64.zip"
      sha256 "871f39c096fc73a824344df60a45d9cf7f215e15803a94062dc65e3fb73d42e6"
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
