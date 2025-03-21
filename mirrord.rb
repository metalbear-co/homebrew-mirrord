# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.136.0/mirrord_mac_universal.zip"
    sha256 "3613463b4c336a6118d8bfb9f01c6b6e41677f63df8cc1212ef22eae4156ee78"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.136.0/mirrord_linux_aarch64.zip"
      sha256 "a7eb66e5ca972e11082107d2a124d375ac45201d1bfb4ee40f3d1d35a96d0045"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.136.0/mirrord_linux_x86_64.zip"
      sha256 "962ee068b761907b68cb9ecd75a8e05b791576cad9467b61e2bdb7622edb5ab3"
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
