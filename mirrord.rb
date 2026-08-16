# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.248.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.248.1/mirrord_mac_universal.zip"
    sha256 "7b3aa1426a671eb698425310316485638e063f3f7e256e881b54e658506608c3"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.248.1/mirrord_linux_aarch64.zip"
      sha256 "a26fcfe5da2202303397ea3a53b043f67bec5d2e77adb52270ab1b1f38a605b5"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.248.1/mirrord_linux_x86_64.zip"
      sha256 "40dadd81b2436d388c684bb1b8bfc30ddb404f53580e1b377fd17e6ad57a225d"
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
