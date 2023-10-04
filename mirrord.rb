# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.71.1/mirrord_mac_universal.zip"
    sha256 "2aad16fad1aaabc123f51aa93ce23c9cc4ec4b2e22e250800cd4c44261ccb346"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.71.1/mirrord_linux_aarch64.zip"
      sha256 "2f72740f887c871391147f1704c9da1bd5a75c34ce26c92f29823bb01aa2a8f7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.71.1/mirrord_linux_x86_64.zip"
      sha256 "5138e43f7a277e423f9b3756125426b143be31759d720863bf6023ea6ff270d0"
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
