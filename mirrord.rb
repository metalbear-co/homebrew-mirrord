# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.221.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.221.0/mirrord_mac_universal.zip"
    sha256 "0cab2873d3e74cea3ae15486789e03e8589f56749f2c279d5cb5ffafcccb9be7"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.221.0/mirrord_linux_aarch64.zip"
      sha256 "8fca6c039e147b18b1435d759d953a5ae31582aa29add4d6e567f4dbc295f4d4"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.221.0/mirrord_linux_x86_64.zip"
      sha256 "257b10d1b7c87993f6c511177660e62feb26051956ecb674e5aa4ad573efac17"
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
