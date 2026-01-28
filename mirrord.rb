# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.184.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.184.0/mirrord_mac_universal.zip"
    sha256 "3a1e759e63b3bcc73e0da29074bfcf83994d84816917e4c0ed0e70518bdbef98"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.184.0/mirrord_linux_aarch64.zip"
      sha256 "36a9d469196f21cbedcdd6c81a2571950c7ad4d0b64bddb2b3ddc82131a33207"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.184.0/mirrord_linux_x86_64.zip"
      sha256 "2260263333184f11971deb98c5099708ec6e7b7abf54bd50b44d1f44ec3669e6"
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
