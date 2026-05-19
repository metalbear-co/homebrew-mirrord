# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.211.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.211.0/mirrord_mac_universal.zip"
    sha256 "796f6581a0811659aa6e9f5b354c0a163b20e18ba7e65ee74f5193560a1e1af4"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.211.0/mirrord_linux_aarch64.zip"
      sha256 "bf1076474e60a18c1012525ba29534ea7582dbb9947b1f2b140327e0aefda48e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.211.0/mirrord_linux_x86_64.zip"
      sha256 "0a0644dfd4e95629b67212a1bd497675d7b964ec6490eb40c348ebbc344d8fa3"
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
