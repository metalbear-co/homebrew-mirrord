# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.131.1/mirrord_mac_universal.zip"
    sha256 "889e7a58a8ae4c0966e68e6c9728d96b567c90156f46fa3fe2fb7b2d92b043b1"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.131.1/mirrord_linux_aarch64.zip"
      sha256 "a1ae2bf111b98a4476b5086bd27f17c7d49a4d13f90f3a0550b58954cd6e4477"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.131.1/mirrord_linux_x86_64.zip"
      sha256 "a79cab558a7001ccf359b826b99dde2c4952748685219718c5c1b34b2e3d7e7a"
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
