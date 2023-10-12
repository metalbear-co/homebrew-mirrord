# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.72.0/mirrord_mac_universal.zip"
    sha256 "d9bd79485ad22a8ae20110e9d4c113da2d9101968953c0bd9b0ba5703373a10f"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.72.0/mirrord_linux_aarch64.zip"
      sha256 "f69fde8a7d63cdbd6eac9cec2bef07d6d53c70f6985e2472c0bd9cc1a54d127f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.72.0/mirrord_linux_x86_64.zip"
      sha256 "071c68033563d307093c80b8a68ae345650f44d5751916f8ad3cb3b88f578809"
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
