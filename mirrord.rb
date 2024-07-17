# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.111.0/mirrord_mac_universal.zip"
    sha256 "83bb2dd67fcde846e7046ca5352f395fb9e47e895e0052c980fc2bc6af7af978"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.111.0/mirrord_linux_aarch64.zip"
      sha256 "71d74bc44a6b393ecee365ca3b7a935ba4ff0e75d53def96b7ecb84680562219"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.111.0/mirrord_linux_x86_64.zip"
      sha256 "941d67bc8ae8d455f6c99a64ccbae8c1d7bdb7e10abaf5f8b0644fd0842de493"
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
