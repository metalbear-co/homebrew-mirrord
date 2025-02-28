# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.134.1/mirrord_mac_universal.zip"
    sha256 "192909ddcd3a568bbc9ef06e129dffe5862368a40eee91ad6896d3f0566a0686"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.134.1/mirrord_linux_aarch64.zip"
      sha256 "ff645218ba15fdc610e0f8366749e40ac34b0c0061ffc3358aa819e5d525a5e0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.134.1/mirrord_linux_x86_64.zip"
      sha256 "5bf11e9257d767c56473f3b364b189d0320b1b9a205f853c1fda2fb241539736"
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
