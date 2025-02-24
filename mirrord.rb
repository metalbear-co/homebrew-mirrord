# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.134.0/mirrord_mac_universal.zip"
    sha256 "a6da4ce4a63690190ac41d37dd61b2d13b5f1bd2fdec0c8e8aa6d55269191073"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.134.0/mirrord_linux_aarch64.zip"
      sha256 "c4707cdc03eba11314058cfbe3ef479be0dff94ba0d0f03f7a3e1a6505591de0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.134.0/mirrord_linux_x86_64.zip"
      sha256 "a16b3df8b4a41b4bfe7f76a0e7e5fdaed5b8a20838db7c51a6f0fb9bfa2b8a57"
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
