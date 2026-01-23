# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.183.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.183.0/mirrord_mac_universal.zip"
    sha256 "aad0b0820a22a944e03199c9132e924ac61c17f4400c4ca8f62baa364c49aa61"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.183.0/mirrord_linux_aarch64.zip"
      sha256 "4120ddc7ca7264bba00fdc38852627948fba13ed61024b9f3c7bba6d22082906"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.183.0/mirrord_linux_x86_64.zip"
      sha256 "02c9d2fbbf3bd874ff4dca0ff38587c356a866aa696d3287c93a4a5ae8b0cfc0"
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
