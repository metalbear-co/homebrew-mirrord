# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.95.2/mirrord_mac_universal.zip"
    sha256 "20121e2fd8929708f43015c7da8cc5c348f491e261bf106c4c011f6063d76594"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.95.2/mirrord_linux_aarch64.zip"
      sha256 "6c4dd7f1dec5a946f3066b31c2aa03675fff64707b8b8294f9888c8317fc60d2"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.95.2/mirrord_linux_x86_64.zip"
      sha256 "0fe569cf5676ed9335cbe9170d97b24f48042180ff6ea4ef56afc0bb8d937e5f"
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
