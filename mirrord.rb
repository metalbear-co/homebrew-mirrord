# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.217.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.217.0/mirrord_mac_universal.zip"
    sha256 "9b0f72f16eb83a330a74f83cfa1716ca77885b5c6e14b283e8ae43eb5a7fc112"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.217.0/mirrord_linux_aarch64.zip"
      sha256 "b243f4f3267c353cc7a1b7f878dda2694c2a65b6a64220fa2da63c273382ce9b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.217.0/mirrord_linux_x86_64.zip"
      sha256 "4162910ef5771f40c6848121d2a0834d3e17866cf6d364c307adb2ad8a288721"
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
