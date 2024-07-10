# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.109.0/mirrord_mac_universal.zip"
    sha256 "87499d26e7bc37d1d4afd68afcfb609822ad41fa49164aca862b4e8b4f975ebe"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.109.0/mirrord_linux_aarch64.zip"
      sha256 "8d0c0743a9ca1fe2d1c75e341489d9b2747672169fbd6322fba555dc8f2bd7a4"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.109.0/mirrord_linux_x86_64.zip"
      sha256 "e4787db11a432ea334964028117e95f06ccc4cee1274d8b06a7389873486c2fc"
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
