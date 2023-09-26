# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.69.0/mirrord_mac_universal.zip"
    sha256 "ce6fe3661299711402148adfabc7ef604bbb67f14b95344397075e691e306bc9"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.69.0/mirrord_linux_aarch64.zip"
      sha256 "533bf8cae64430de7e4803ab6de44f74f86563685f01b4d7d399e6c4a7e2cf3c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.69.0/mirrord_linux_x86_64.zip"
      sha256 "cfb41bef56486fdf163d39399be0380e82a52484d0b79322ee33eb8da29db1d0"
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
