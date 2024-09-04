# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.116.1/mirrord_mac_universal.zip"
    sha256 "0023b027f6c0878574ae5edfad099a5cc66dd197c3e9eace162d0a7241740bf9"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.116.1/mirrord_linux_aarch64.zip"
      sha256 "397faf9d8190cd321f6cb91b1385d593aca0ee2a187cf97e39ac00fa5742af70"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.116.1/mirrord_linux_x86_64.zip"
      sha256 "f528b9a36318eea44147a2b9dfbd61c5f55fde428c6c4e927833db946017d346"
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
