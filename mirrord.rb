# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.159.2"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.159.2/mirrord_mac_universal.zip"
    sha256 "bdd0d258b7e7926a391eb5b3a74146028f8474f2f9c655b5fe18a66f9922fcc2"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.159.2/mirrord_linux_aarch64.zip"
      sha256 "13b2c1bf6822eb7fa2afbfea1091bcf7a4573ce1040b134363b28ede753910a0"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.159.2/mirrord_linux_x86_64.zip"
      sha256 "f3f7ae5e12e5e2fed5252eca49ad0b9648290fe6be4075498f010e52b4189fc0"
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
