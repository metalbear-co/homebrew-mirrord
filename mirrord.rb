# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.230.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.230.0/mirrord_mac_universal.zip"
    sha256 "86ef229fcaab463f03570fcf6b191bc7b4b57cc680646432d0983459ad4d39c2"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.230.0/mirrord_linux_aarch64.zip"
      sha256 "59790a9bb1c76106373f11c385743dff78a646418daeabff503c7e2430025975"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.230.0/mirrord_linux_x86_64.zip"
      sha256 "0d77cff3081b030d1de2cdca1b01a1e0ed3317efcbb6c2636f22a30eda4a5a6e"
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
