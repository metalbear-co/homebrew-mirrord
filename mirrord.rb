# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.148.0/mirrord_mac_universal.zip"
    sha256 "1ab83198e77cde26c1155b65676526913141fe61874f784b0b0d9637d3236e56"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.148.0/mirrord_linux_aarch64.zip"
      sha256 "89c73dd86291659c10c18a5c86c4eabf5cdfa0dfb0a1a5da75a6bfa155e39607"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.148.0/mirrord_linux_x86_64.zip"
      sha256 "e1e6cde42ac6cc66ccd40659f21fd1609be972268d321b3a4b45430e9ad9cc8d"
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
