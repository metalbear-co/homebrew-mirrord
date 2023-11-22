# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.75.2/mirrord_mac_universal.zip"
    sha256 "22a277d8d073a3662f4a78d9bdbc514476013842bf776e94dae6ac1b56a43a4d"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.75.2/mirrord_linux_aarch64.zip"
      sha256 "9a445d20f9e8f68abfa78c817768c30e79b22182304bca72fbac6c24f1da17d1"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.75.2/mirrord_linux_x86_64.zip"
      sha256 "b19222788d25f40c5d50ff2899856cd7c84c14e16ee4d2314b42742cbcb3a89a"
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
