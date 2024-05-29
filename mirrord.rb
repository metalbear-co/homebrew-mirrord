# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.103.0/mirrord_mac_universal.zip"
    sha256 "0617ed729dc25be3c1de346116078cee17cd223b781c187eb3ae43101f35b650"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.103.0/mirrord_linux_aarch64.zip"
      sha256 "94c752484d4f72b7ed9f8cc43e83fbbd0b983eaf7a89a2b7ce05cdb69b75449c"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.103.0/mirrord_linux_x86_64.zip"
      sha256 "9c6a16788b1145f5a9482668786a3e1e12f2e87d4081c2dffb58c2caebe576f1"
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
