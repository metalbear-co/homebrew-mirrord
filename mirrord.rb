# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.206.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.206.0/mirrord_mac_universal.zip"
    sha256 "62c189aa5f78aa5f66493c504af14b8285ea8066686c0c612bf1923ff3b4bfaa"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.206.0/mirrord_linux_aarch64.zip"
      sha256 "24f7565ec3326393bee8f3468782fbcf29365339b413139f2b5e7fefa965e1fe"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.206.0/mirrord_linux_x86_64.zip"
      sha256 "39f9104c4f4bd47c09f30162df23e71449d195a04fb8f72941de656a434e53ed"
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
