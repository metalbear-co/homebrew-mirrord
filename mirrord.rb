# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.112.0/mirrord_mac_universal.zip"
    sha256 "b735011aba3851f192d550d16f87c5c981b05a457d615cbad3057b50e8c3233a"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.112.0/mirrord_linux_aarch64.zip"
      sha256 "8af5e3a976c016aeb2139001c6a6cd3bc2b27adefb9386d5f7b40e9543c55478"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.112.0/mirrord_linux_x86_64.zip"
      sha256 "672fb21a193a4f924e1d537eb79f11255808368c8ba497d5bca4d98ea47cce69"
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
