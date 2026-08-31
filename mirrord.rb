# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.252.1"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.252.1/mirrord_mac_universal.zip"
    sha256 "a8e532de3f1636f32e2f4ba6b1e0532a61a32e2264343645485ddb80f83a0740"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.252.1/mirrord_linux_aarch64.zip"
      sha256 "e8bea9a3af7bb569f92230bf529537df5d4cef5489a1137afe09f8edf6ae4410"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.252.1/mirrord_linux_x86_64.zip"
      sha256 "a0469b85b85dc3d1a0640daf7a24525dc5a972969677d79185f5921fa29c659d"
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
