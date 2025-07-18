# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.152.0/mirrord_mac_universal.zip"
    sha256 "3e6df194d0a9eb2c971e2c779d177e4da4edb66915b2e2af1e7e7f63da0fdf61"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.152.0/mirrord_linux_aarch64.zip"
      sha256 "e73b357d59ef5352a93bdceede506ee8f7e446b840dbd14fec6b74adada80b5a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.152.0/mirrord_linux_x86_64.zip"
      sha256 "7aab90b414d76523ea83604ba6c821a8adbc7b84a56fceb0f9021f5e231457d1"
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
