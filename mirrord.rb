# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.193.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.193.0/mirrord_mac_universal.zip"
    sha256 "57494cb6d9ba41a35ba07af4f0b2258b1d02aa6906f4ed784dc1cf06c4b9954f"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.193.0/mirrord_linux_aarch64.zip"
      sha256 "8bc4e3b30b09e68cba1c294232304f7c6daefb4d2259d79abb62970837aafe5f"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.193.0/mirrord_linux_x86_64.zip"
      sha256 "d732f9fc0921986554d47db70abd0ed96d6688168f68d9481ae865857565fbf8"
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
