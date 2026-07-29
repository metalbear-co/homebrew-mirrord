# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.241.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.241.0/mirrord_mac_universal.zip"
    sha256 "845998525287c635c44f9f75a156675400193dd401f9050f37ca4f8bb0b38a13"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.241.0/mirrord_linux_aarch64.zip"
      sha256 "071e44b6fd158c59da9ab102d41edd9336ca9894d014b94611ae0843f73ae53b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.241.0/mirrord_linux_x86_64.zip"
      sha256 "454a9f79f9ad6bd2c67fc6def29cb1149e6fe17656f2238b60f2bf3ca6e09643"
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
