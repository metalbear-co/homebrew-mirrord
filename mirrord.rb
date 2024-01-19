# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.84.1/mirrord_mac_universal.zip"
    sha256 "9c0500c274254c17df68c6eb17f41eca0f0ef1f8dd2d4da6b64598edc2d6a647"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.84.1/mirrord_linux_aarch64.zip"
      sha256 "85a00e69e6f6e171d8986f2661bbe488bad463f2f9f7593578fec31f3d2e32b5"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.84.1/mirrord_linux_x86_64.zip"
      sha256 "c4db468af28fd05f2bab32da2ae336feecf07f6a2755e06d5c753aaabe4447a0"
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
