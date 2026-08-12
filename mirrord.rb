# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.247.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.247.0/mirrord_mac_universal.zip"
    sha256 "82349ea7f2c59b8bfaf500328e31c87750eda889d4375ed2f9dff948c306e2d1"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.247.0/mirrord_linux_aarch64.zip"
      sha256 "a1959ee70a4bbb0b0c81f9e8c26ea445f129af627418c7997bae3c186c0d1bdd"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.247.0/mirrord_linux_x86_64.zip"
      sha256 "2a7c4b7ae1421bf99f92390f5e941f053be6b2bc74d13bc0710c6df8eae8f9b2"
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
