# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.76.0/mirrord_mac_universal.zip"
    sha256 "bc21d47e7a10c1c7a2390a4c54f940293dfcff9cd9d79adebdc90a40e30d34ab"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.76.0/mirrord_linux_aarch64.zip"
      sha256 "58d871211b0484200a86b40d83bb412a0037c0ec170e03ab6df12c93a1db8b74"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.76.0/mirrord_linux_x86_64.zip"
      sha256 "0bb2465146332938c2296101e3e1fd12ba20cb6aa29d05ce6804eaf28f7264a3"
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
