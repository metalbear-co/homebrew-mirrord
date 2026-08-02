# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.244.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.244.1/mirrord_mac_universal.zip"
    sha256 "2b0144d5d8ca1b0fd182bf1da12ea78ebfae376c488dfe12fd7773c0846abac6"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.244.1/mirrord_linux_aarch64.zip"
      sha256 "f807c8e70134e4fe4867200c67d7e0413c966442aace274d4f7b6bea476adc71"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.244.1/mirrord_linux_x86_64.zip"
      sha256 "203dca252f32b6885c5c73ca26563d45a81464bb75b8c172cac8e029d0bdd029"
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
