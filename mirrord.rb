# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.139.1/mirrord_mac_universal.zip"
    sha256 "4c9729a9ba8799c02d3b7208b723f4cc4caa988ee443cebca67af72cba0e5339"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.139.1/mirrord_linux_aarch64.zip"
      sha256 "3ab134dc81882d1dc7e8db8956ae4bbe5b0873d7bdf067b6c13167bce231625d"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.139.1/mirrord_linux_x86_64.zip"
      sha256 "09469217a2f215c098fcf69af21475da49bf79e88f58371240fefde56d71d88a"
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
