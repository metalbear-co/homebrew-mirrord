# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.156.0/mirrord_mac_universal.zip"
    sha256 "d9ef16829b6c9e56e3ce1a760d5dee9852c5ae20c0e782f9132519f95cbcadf1"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.156.0/mirrord_linux_aarch64.zip"
      sha256 "78724f13733274c74126b69eedf189984a655130e68b817008e48281eba78be8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.156.0/mirrord_linux_x86_64.zip"
      sha256 "fdcb2365f1cb72d87144403aa5b265c7193c7c90deb48d578de790a3497ff950"
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
