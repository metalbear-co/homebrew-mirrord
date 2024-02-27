# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.90.0/mirrord_mac_universal.zip"
    sha256 "4464d9d41d866f5ff52a04d08002fc6dce5c9f177a5a1897c6d85e440b36b4f2"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.90.0/mirrord_linux_aarch64.zip"
      sha256 "79fa763114a3f1037c142e4fbd88e86f4e4ac0dbe0ed6d828b638fe332135918"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.90.0/mirrord_linux_x86_64.zip"
      sha256 "d4f9527df65e924d8bacb16f102326213d9effc8870053f80696f754a8f32197"
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
