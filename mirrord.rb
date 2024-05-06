# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.100.1/mirrord_mac_universal.zip"
    sha256 "84c46600fd32b879c328422b2c885fb6ace47e1e2fa8e4c95dd8278ca0864bf0"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.100.1/mirrord_linux_aarch64.zip"
      sha256 "72e6515a235fe9fbb21bb63cf57189872608ca2b2f5c71419037547ad1e6486e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.100.1/mirrord_linux_x86_64.zip"
      sha256 "a22f34d8e2b617bfe0de6081e3e0f95212e23f8d75e4e027129aea2bd77e1547"
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
