# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.209.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.209.0/mirrord_mac_universal.zip"
    sha256 "0d6d58ad44f05aadddef09a7cee38011fba2a3bdae914bc7f334785bd11a86db"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.209.0/mirrord_linux_aarch64.zip"
      sha256 "ffb340fe497e923abc8e2acef4ab773a87e5d8babdc790db35b1fd3d95582bd4"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.209.0/mirrord_linux_x86_64.zip"
      sha256 "1de5c915d3f1ca3001b78c69c98b51c317c4b4cf9c7dda5f9c44f5f585c96c9c"
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
