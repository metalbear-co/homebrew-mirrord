# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.200.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.200.0/mirrord_mac_universal.zip"
    sha256 "cfa5fc8aa87d76a1f8d3fcad833b4b9a6b083a74bbc9fd5b347e9436f0f45808"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.200.0/mirrord_linux_aarch64.zip"
      sha256 "7742b20a7031a9a344f9ae9cf469f7d20a829137635c66b3ac349edd9324acd4"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.200.0/mirrord_linux_x86_64.zip"
      sha256 "23a46ce4373fc99de7aeaf5307db88999ac9820a54385a3718b4a98d36f237aa"
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
