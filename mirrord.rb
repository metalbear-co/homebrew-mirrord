# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.133.0/mirrord_mac_universal.zip"
    sha256 "2ac365adfb8fe6d0738ec3a085811b6b8750cb8fe6c712defc23834913ca559b"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.133.0/mirrord_linux_aarch64.zip"
      sha256 "a41f9485978ce28a3acaa1f7c2ed894f334709b19860d6ea1264807c05658989"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.133.0/mirrord_linux_x86_64.zip"
      sha256 "c7b5fa7d863eb72fceeab86ac8e975f8e8377108fa91fa8312816edfa771426a"
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
