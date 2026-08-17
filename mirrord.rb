# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.249.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.249.0/mirrord_mac_universal.zip"
    sha256 "9d24b67dc3d497285a8fafcd1a4c4383990ed2397ce76f28c91727acb85b1186"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.249.0/mirrord_linux_aarch64.zip"
      sha256 "9c8e8274924c6934fea14c9dc039f612271dc827125a6d8aaaae80aa62acee84"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.249.0/mirrord_linux_x86_64.zip"
      sha256 "c5c8bff4b6fc9f8b569a8bea4f3d6227584771238597f2445e43ca8b94c5d775"
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
