# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.131.2/mirrord_mac_universal.zip"
    sha256 "0f6bb2a19df16077231f318dd1ad5ecd04b4dc4eece2fad6df052e0b20bf4697"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.131.2/mirrord_linux_aarch64.zip"
      sha256 "bda1406e964d798e1e09728b1978547d0dcad5f5c3b0e9bbf958f6f4b3ad81e0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.131.2/mirrord_linux_x86_64.zip"
      sha256 "ab3f0f76b410b843acc2a693819d626e68709571b6f4309069634482e07ade9d"
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
