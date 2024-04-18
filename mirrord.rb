# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.98.0/mirrord_mac_universal.zip"
    sha256 "2c967df90bec76daa4fda30095a567457d5f7b07f4f617f12978161e5b24b0bb"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.98.0/mirrord_linux_aarch64.zip"
      sha256 "cfa9bcfe88d7c92aa7013d9311936a3462d17e772b672c750fdc458164a920b4"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.98.0/mirrord_linux_x86_64.zip"
      sha256 "4d61c80b690a6c553099978ed0739841d7a404ef29314b60cc143f485335147b"
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
