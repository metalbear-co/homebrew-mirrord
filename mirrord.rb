# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.168.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.168.1/mirrord_mac_universal.zip"
    sha256 "8cfe01cdc33dd2227775f1e14ebfae06046e5b1e7cd668078a18d3eeb6477dca"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.168.1/mirrord_linux_aarch64.zip"
      sha256 "254f35d3ebcf18b1ce243e410a0c03cf368efb7911d942d1e2a248f199da8e31"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.168.1/mirrord_linux_x86_64.zip"
      sha256 "ccd1ff24d6ebf004ddc1514f2fc3f8a62da8d2edb6bd2c9d589c0704a3d46dd0"
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
