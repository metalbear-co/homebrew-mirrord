# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.254.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.254.0/mirrord_mac_universal.zip"
    sha256 "4ae8a73f9cb3af5c68ab2040aed5a92e8148e0973ee7f407493d42df0f9ec18f"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.254.0/mirrord_linux_aarch64.zip"
      sha256 "962c81d3f2e7b9c06cb2f19d87b5ebfd5c39adad0fc58aa7407f5201f8ca41e2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.254.0/mirrord_linux_x86_64.zip"
      sha256 "a8e9a23132375ed8573ecf9b802c0148189c4a2c8d638cb327554737e20c2367"
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
