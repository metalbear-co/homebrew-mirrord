# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.206.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.206.1/mirrord_mac_universal.zip"
    sha256 "95132dd79bce9d4926c2b3bbbf0a0a932fa7438cd74f9d7848f0314480f85053"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.206.1/mirrord_linux_aarch64.zip"
      sha256 "1a763ef213011ea5674ca63599f4a9a9f15e92e3013a4d5447a876c112df42c8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.206.1/mirrord_linux_x86_64.zip"
      sha256 "dbbe8bdf173339195bb5b14696b0823fe957822d52f2f5dc4300faf0aa0316b4"
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
