# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.126.0/mirrord_mac_universal.zip"
    sha256 "5832b8dc352df241576d4e729fbae8d6ca0d1eb3cab46d905d362ed8fd3c1c94"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.126.0/mirrord_linux_aarch64.zip"
      sha256 "dee6e147a8fd30332f2393a48e63940016a32d7ca5f6ac6636c97c09197c9157"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.126.0/mirrord_linux_x86_64.zip"
      sha256 "34b084fe7fa5e74e4463e88051fae0ffe803d43fb04d2e8591c0914efe89e9d0"
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
