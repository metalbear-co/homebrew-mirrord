# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.92.1/mirrord_mac_universal.zip"
    sha256 "af51c9484ffaceb78a4287db2ff24bbc560456eba48ee383a94466f7a215573b"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.92.1/mirrord_linux_aarch64.zip"
      sha256 "e8199f14bf7bbba364adb6b9581b6ede783d537f000cae692194fbf3c1d67e11"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.92.1/mirrord_linux_x86_64.zip"
      sha256 "6db2c10080cb089b147aa95dc7b9b05c97ba14b51fec9e4cba34f7310c56a641"
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
