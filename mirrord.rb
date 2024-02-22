# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.89.0/mirrord_mac_universal.zip"
    sha256 "b2739035c9c15759d980a493d838a714bbff3027969d1e8e4250a5d4cbbe8e5f"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.89.0/mirrord_linux_aarch64.zip"
      sha256 "bb3bdb294840a0fd63dbd97f18bad7585161894d0e570ce568b1826ea679cc6b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.89.0/mirrord_linux_x86_64.zip"
      sha256 "088b87a45145e4cac171d3e3b3fe603dce21d9086553c9dfeb49454fde328b84"
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
