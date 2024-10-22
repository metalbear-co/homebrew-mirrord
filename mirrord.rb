# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.121.1/mirrord_mac_universal.zip"
    sha256 "d6a045b9ec83a559524121cccef57cb4bcc18cc963d3e59b2aa24c694b2a4bfa"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.121.1/mirrord_linux_aarch64.zip"
      sha256 "8a62acc9d9d49f63be912b69348208c98507ed45626a1339143036c21920b91d"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.121.1/mirrord_linux_x86_64.zip"
      sha256 "fe7c4cdcb2cc435f733c4962e2f0e460eb08827f04253b0a22a69b556d6fcd1f"
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
