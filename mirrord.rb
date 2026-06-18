# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.219.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.219.0/mirrord_mac_universal.zip"
    sha256 "457420b6ac039392e02ae084914c50408724992a090ea14032dfa78537498d1c"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.219.0/mirrord_linux_aarch64.zip"
      sha256 "e9fd97771b39feec606c9b021bd2ad21dce7ce9772633f26df0b4495ae6a5c59"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.219.0/mirrord_linux_x86_64.zip"
      sha256 "6d3f50ef0a4c9985491fbf739db757dc37988ffaf00acf114c4cc6ff4ef0cf6b"
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
