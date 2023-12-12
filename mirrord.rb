# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.78.0/mirrord_mac_universal.zip"
    sha256 "bf74280f98ebec199dfb9459f995b449c20169f6b07c9a8cbf71b64734eef8db"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.78.0/mirrord_linux_aarch64.zip"
      sha256 "a63942d5a87e401026a06f27c6ed6ec8607ea0f08d616a27ecb305ef5f0c3418"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.78.0/mirrord_linux_x86_64.zip"
      sha256 "281bda53ba92f7193d12610c2b1fa4b839a29f912c1deca943692496cb6b4cd0"
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
