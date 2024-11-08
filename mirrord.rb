# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.124.2/mirrord_mac_universal.zip"
    sha256 "6b58d78648a2d7fc0d6591f3519a1dd3b0ece296d1084f60549079f2cf734679"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.124.2/mirrord_linux_aarch64.zip"
      sha256 "18ec7562ba6354b6ca05697e97bbe36dc76f7c04cb6a30d37d57fd6045e61c3b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.124.2/mirrord_linux_x86_64.zip"
      sha256 "842a4fe996e0cf9a1d4cca6fe0911f5eec0ba62342ef7ede69a9d4e931ccff68"
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
