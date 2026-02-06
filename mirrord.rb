# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.186.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.186.0/mirrord_mac_universal.zip"
    sha256 "636938c6fdbce5b943f5390ff9c91364cb85ffcec42787736cb22c8efe2da7a7"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.186.0/mirrord_linux_aarch64.zip"
      sha256 "eafcfc9936bc85ad2bd44763368a490ec5e18d91d12f059c62ad4e5ece667c68"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.186.0/mirrord_linux_x86_64.zip"
      sha256 "3a552a8d706065f7229eaef2f02d927a05d24e9e825515d585e9652efbef6e7e"
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
