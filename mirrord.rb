# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.100.0/mirrord_mac_universal.zip"
    sha256 "b82203956fa036e0cfbe38f689078450c38e2517c6aa06391e914caf7fd38662"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.100.0/mirrord_linux_aarch64.zip"
      sha256 "4110716ca01ce722c06640deea003115124f47f8115f8bdf1406fa1d9ac7499e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.100.0/mirrord_linux_x86_64.zip"
      sha256 "bc70e1ed10d1ee601445139d280e82c1d20804afcafc8921edbe9ce97406b655"
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
