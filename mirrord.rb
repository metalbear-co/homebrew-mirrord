# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.154.1/mirrord_mac_universal.zip"
    sha256 "b02bd81a826854387dddf95164181969c73b506a627d5fbfcc8cdfa266739cf3"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.154.1/mirrord_linux_aarch64.zip"
      sha256 "09c2cd23a23420c1089311751916b412747e084fb108e6b30f694b3bb56bf7c8"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.154.1/mirrord_linux_x86_64.zip"
      sha256 "4b0412782d164bf1379f9ab766ecaad5b58b53197b1e2e8a33c728635baa776d"
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
