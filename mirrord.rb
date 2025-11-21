# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.174.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.174.0/mirrord_mac_universal.zip"
    sha256 "7b605dce9711f51d239abdd91f4245fe3f30e5c98fea43ec2b3c54d497bc1300"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.174.0/mirrord_linux_aarch64.zip"
      sha256 "346259513fa0ae76f4847220253345a2ba77b463179fea3f657d3808dc95db51"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.174.0/mirrord_linux_x86_64.zip"
      sha256 "53573bc73c7a31b30bebc10ba3b5a560ee07ee5f321397b52a5e5f537dca4d74"
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
