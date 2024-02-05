# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.86.1/mirrord_mac_universal.zip"
    sha256 "707259cac408ac12c48a5fec1fcf8f5b5ef66c54feec7970e6f4ead823c8fc35"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.86.1/mirrord_linux_aarch64.zip"
      sha256 "03bd05d06ea750a1ce565bfd2d91e1319d84c16a4765f16170f515e274f4b06b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.86.1/mirrord_linux_x86_64.zip"
      sha256 "6256843aa0716aeb1ec2bc0ebf80a10b4af973cd69ed916c0a15d1e345918126"
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
