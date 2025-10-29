# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.170.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.170.0/mirrord_mac_universal.zip"
    sha256 "127403daef76dca9a2e65b40a099078b8add7d37398271d4996bd3fd8b51e2d6"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.170.0/mirrord_linux_aarch64.zip"
      sha256 "fbb9ae600be819e930b156d40135afe58cdaee30a08e59e3654a9f839bc6ae46"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.170.0/mirrord_linux_x86_64.zip"
      sha256 "690bb3bb4a2befa17cdbdfb2cada06d81b83e9ad01fb004531f1f945175d16d3"
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
