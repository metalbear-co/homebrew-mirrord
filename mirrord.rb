# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.154.0/mirrord_mac_universal.zip"
    sha256 "5f04f2509bfa7ff2765e0ae030a33945b5d730775e136539332a39cc72d8ca56"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.154.0/mirrord_linux_aarch64.zip"
      sha256 "93c097cfb391877e9258d64589534039b1804401e24fed9fc9d872070ee75663"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.154.0/mirrord_linux_x86_64.zip"
      sha256 "ae378405b3e9f170c5d884f75fe05989db5457c3152a29ae814524afc9d51659"
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
