# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.98.1/mirrord_mac_universal.zip"
    sha256 "0900270cdaceca9bc22edcbf45ad294db10d4d947772e797d406de9276036141"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.98.1/mirrord_linux_aarch64.zip"
      sha256 "eb79fb267c6d0743af8604dee0b2c27e398e9a0969f01b1f169c77ebf99fa22b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.98.1/mirrord_linux_x86_64.zip"
      sha256 "285f423e3cd8cc4992a83d3f29a234df97d6023483662ce04b447f10a74a643a"
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
