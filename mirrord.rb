# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.153.0/mirrord_mac_universal.zip"
    sha256 "574096ef71473d8e828ec2ec65967d9e1a54cb66e8c5fa0e4d98a2a468cc58f5"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.153.0/mirrord_linux_aarch64.zip"
      sha256 "ef8ec744ce8fdf42c19e6a9b10fc0cec1451bbc2a73766cab650c8fa3135d26b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.153.0/mirrord_linux_x86_64.zip"
      sha256 "89c2597908bd973cb7e3745ccadfa199475ecbc75da477825b456b869388bf7a"
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
