# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.92.0/mirrord_mac_universal.zip"
    sha256 "166699e96503688e915f6553130bfc85734bb5459f23674bcfdf9acfdbd8df56"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.92.0/mirrord_linux_aarch64.zip"
      sha256 "8cd243dbb882136e32d9cafc10ad4147ad71909f32c7592cb1684002d137a8b6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.92.0/mirrord_linux_x86_64.zip"
      sha256 "78f9aa335fa9073ee3d60c504d2181379aed2448d41500ab3b55bf33e92fc080"
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
