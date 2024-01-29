# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.85.1/mirrord_mac_universal.zip"
    sha256 "e7e5253264c4a6c1ebc21ec2afb28fb758987c5903b63b988e6449b39b03f38f"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.85.1/mirrord_linux_aarch64.zip"
      sha256 "9d8a4a3eb67d284f8e447fdae4f978432fdd2c40dd5bc0932565cb80b3e250f0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.85.1/mirrord_linux_x86_64.zip"
      sha256 "c48574629fc1e1b76371b02654fcca38452e75f451afc050a544a23cdf4b0f37"
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
