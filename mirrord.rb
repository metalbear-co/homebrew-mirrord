# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.169.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.169.0/mirrord_mac_universal.zip"
    sha256 "3e3b6ccbb2739c7ca6a46ad64c0b3a72426b1a30ed254a691f09880d661cd3dc"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.169.0/mirrord_linux_aarch64.zip"
      sha256 "546ce8e4afacfbe09ce4ce1d927d30440147cde44807f2d97ff42606b3cd9b33"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.169.0/mirrord_linux_x86_64.zip"
      sha256 "34f305e5ff68c4c05239f2fc40530a94fd5439275faa8e0b717a91589eb1a2e7"
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
