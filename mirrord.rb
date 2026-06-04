# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.215.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.215.1/mirrord_mac_universal.zip"
    sha256 "e394a19cee3a5be357d996b678f23e502177c557bd3bb3686b21409df615ab81"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.215.1/mirrord_linux_aarch64.zip"
      sha256 "82c83ff77ba2f4f90a7e7371f4c8ed5858f81ecace15ae2637b353f3a5f6ee8c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.215.1/mirrord_linux_x86_64.zip"
      sha256 "d58cf8446b9d842976aae0c50e5296e9d8f0b292c9b6372d100e3de1db25d1c4"
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
