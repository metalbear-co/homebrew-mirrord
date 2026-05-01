# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.209.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.209.1/mirrord_mac_universal.zip"
    sha256 "20a409b1e6f44c916364f4566b155a8f88e6b51cee5fcac2c8c7afbcb213df3c"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.209.1/mirrord_linux_aarch64.zip"
      sha256 "01db5f432fc078166b3583d7e7ae54bf7e2bcb03c6a895fb70339a73e08ed7cd"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.209.1/mirrord_linux_x86_64.zip"
      sha256 "48791841954bd22146cd797645bf6205195ad46f4dbab64ff61d65ddd3805271"
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
