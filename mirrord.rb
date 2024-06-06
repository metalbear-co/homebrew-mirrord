# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.104.0/mirrord_mac_universal.zip"
    sha256 "ae3f6ba0f3d4f9b960b76a163888ea2b34f08ede76272b80e5bb7b4e651cc5ae"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.104.0/mirrord_linux_aarch64.zip"
      sha256 "423f4851c4be9972cb1a6f912b4c55c73991505172f66ee7ed84013a871d311a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.104.0/mirrord_linux_x86_64.zip"
      sha256 "fef27456edbdd27055bc5b2e972f5ece8324d905d99e2a567c224a7651985e11"
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
