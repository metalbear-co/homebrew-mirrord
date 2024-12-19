# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.128.0/mirrord_mac_universal.zip"
    sha256 "270f16b68b48534cdc6ae5f3757c65adeafd091bf96728c2c49675eb0f5c5aca"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.128.0/mirrord_linux_aarch64.zip"
      sha256 "631a9b9fdb7e86ee724c3b5bb70371242ec2eebafa2bcf350029dda855770e2b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.128.0/mirrord_linux_x86_64.zip"
      sha256 "28a1c8b0289fe3d44ee0afc8b3f53c32c23e8013cd205d72b0edaf6b660311f0"
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
