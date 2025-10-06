# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.164.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.164.0/mirrord_mac_universal.zip"
    sha256 "479565f3c739641fb1e2ed46e5a7654413e753dcc9430cc14f3294ff2a7a33c0"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.164.0/mirrord_linux_aarch64.zip"
      sha256 "8eb3850b8a3de2969b8058a269c072c64e55321197b21b74d2ecc713a7c9fb8a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.164.0/mirrord_linux_x86_64.zip"
      sha256 "7edee8db4f62c762249097f7b29eca37f1d31d15630db89b068f793d1cf8ead8"
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
