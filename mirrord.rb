# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.81.0/mirrord_mac_universal.zip"
    sha256 "709933ffbc016a937ae78a338273ab8edc99fb55519dd7b4107b8d366dbff472"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.81.0/mirrord_linux_aarch64.zip"
      sha256 "ac6187cddbe9294e0727eff33a45d98c9dbd606e790e40e8f9cb381caf562153"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.81.0/mirrord_linux_x86_64.zip"
      sha256 "4f3d947553d4e84ebd644adf1c6a62952cbd730f07fbd17bed9debfa20501d85"
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
