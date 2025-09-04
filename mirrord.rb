# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.161.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.161.0/mirrord_mac_universal.zip"
    sha256 "2ab1319a8c512a0cb1795d78b01ea5f34d0b42900bb0e82a80807d3493c4ce82"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.161.0/mirrord_linux_aarch64.zip"
      sha256 "181988bd3fe0b346340cfea9d51567ec60aa8b05d09c10fb5210ccc1de7a73e4"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.161.0/mirrord_linux_x86_64.zip"
      sha256 "6a0430392ea57c533d653c44550de49de31042ca646370db5dfebd9f370bc8e3"
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
