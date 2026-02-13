# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.188.2"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.188.2/mirrord_mac_universal.zip"
    sha256 "b6fad8639b09727d11137d23725912ee73c482e559ca619d604f7b68af577128"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.188.2/mirrord_linux_aarch64.zip"
      sha256 "6b06f8998fd34a517681b821202c3f5f641d207144871d344235a4e317ab812f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.188.2/mirrord_linux_x86_64.zip"
      sha256 "bbf91cfc2d0d4d2106e70a6c3e4f426c5d8dfbb5bde648536ccb57a60fa229e2"
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
