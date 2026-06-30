# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.225.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.225.0/mirrord_mac_universal.zip"
    sha256 "7cc7431724f2ecc69079402d04786120354ee90102c85e6bd5f970a113d2ed72"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.225.0/mirrord_linux_aarch64.zip"
      sha256 "e207fca00d9556d0439d3f41b2b3c2abac7cf386c52c1bd0dafb58fa1fc1517b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.225.0/mirrord_linux_x86_64.zip"
      sha256 "cc881d36f3440e601141c21139b53fa3885acc2ad081a2c8448ce14d8517148a"
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
