# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.165.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.165.0/mirrord_mac_universal.zip"
    sha256 "a25735d1dd7802bb1369b6a509da3cbc3272cdfaa1812bfed3f2d6b8231dfc16"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.165.0/mirrord_linux_aarch64.zip"
      sha256 "8e0796b2010b5711a43d9c27380288aea4c1031696d91d34d90d493adb8c9975"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.165.0/mirrord_linux_x86_64.zip"
      sha256 "7b92985da67f8f47ef95bc9411bd5794bbbc5953b611b110b17557b95589ac49"
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
