# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.116.2/mirrord_mac_universal.zip"
    sha256 "bce5b3a71ebf69d0a93285954d32782cd758adac3d85287b6b603edfb1929085"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.116.2/mirrord_linux_aarch64.zip"
      sha256 "c60e6d99040adde1a4d450ec2cd4ce51ccbf5409fc30c35a327e0a034c682e66"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.116.2/mirrord_linux_x86_64.zip"
      sha256 "a787ab82517708fc39a748c5ce5473c8470eed092e0a546c502b94133d9732cb"
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
