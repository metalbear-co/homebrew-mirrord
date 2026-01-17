# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.182.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.182.0/mirrord_mac_universal.zip"
    sha256 "96fa9550f9bca7362ba48fa475eb4b352937255d6317c89243dfb9172b7d67e6"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.182.0/mirrord_linux_aarch64.zip"
      sha256 "76d4a04242dcb20e4d059a9848b93a24cf61cd502eb61a58a9b0b7d181a65200"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.182.0/mirrord_linux_x86_64.zip"
      sha256 "76c539abc242951a8af7d4f52987c2e5f98ed17cf02f07fae90898d1142b7806"
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
