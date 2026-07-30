# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.242.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.242.0/mirrord_mac_universal.zip"
    sha256 "1adc1ac774c08f77913f4ff7758b933139e11d7587d34959028c7a780b7782f8"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.242.0/mirrord_linux_aarch64.zip"
      sha256 "bae58109bb07be48a1dbd269929f9c02e5a85c8a58c58f0ece32a7ee10ff88ba"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.242.0/mirrord_linux_x86_64.zip"
      sha256 "5237e61d2cfd9e6699035f2daeb2856cb99e00583c52f1db4945fe93f7e0409a"
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
