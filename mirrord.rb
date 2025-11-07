# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.172.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.172.0/mirrord_mac_universal.zip"
    sha256 "020abdbe826177866f6690bb2eb44e0ec49066d601fdbe2698563d327e3fc318"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.172.0/mirrord_linux_aarch64.zip"
      sha256 "437c3643ee490070d23aec9d4e7c4f14e9705ff2e7299a16f8adbe3a566d616e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.172.0/mirrord_linux_x86_64.zip"
      sha256 "a1b54a3fbb535341f9859180efd23a5dc4817e6c2e323666ba3ce2575a84ac59"
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
