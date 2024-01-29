# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.86.0/mirrord_mac_universal.zip"
    sha256 "ca81375e532291686cb226aaf2c4a356e00499f0eea830c54c6cfbc485d22c0c"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.86.0/mirrord_linux_aarch64.zip"
      sha256 "b7e2e84edd2757f86ca08191738c3a8ccb3c59a0f64916a923b40aea667abcd6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.86.0/mirrord_linux_x86_64.zip"
      sha256 "0be8a04945a6a5ac4d49d0f7e4a08d27b6f06f0080657250223ea520590e9639"
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
