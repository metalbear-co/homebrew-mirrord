# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.142.1/mirrord_mac_universal.zip"
    sha256 "15ad0285ced8be041a7ac0a8b0d43dcef33262ab4363d8d63831b69694315f7b"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.142.1/mirrord_linux_aarch64.zip"
      sha256 "e5e41e03110470e7add106b8469fa99c29e755fe742c508e20cffa23d06ab1eb"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.142.1/mirrord_linux_x86_64.zip"
      sha256 "63c97a62be78a4648aba1209a263512aa47ecf764199a991c6d3f85e7f3cde93"
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
