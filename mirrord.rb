# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.203.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.203.1/mirrord_mac_universal.zip"
    sha256 "fb627419cbebefa80c01f543ed78b7e27ff74009498038ac4052a1adfbde515c"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.203.1/mirrord_linux_aarch64.zip"
      sha256 "c737e35cfabf6d37ed0c731c3735265de4aadb9a92dfec0a79e8465b9d313de3"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.203.1/mirrord_linux_x86_64.zip"
      sha256 "2bea7576175722fba55558a6eda8c057342aee365fd7c90276e96d2d44d6dc15"
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
