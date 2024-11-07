# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.124.1/mirrord_mac_universal.zip"
    sha256 "a4d6a59d6f2b852b18ac46a144ac20b0e0769b415c36ee8456ff35a1eb135332"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.124.1/mirrord_linux_aarch64.zip"
      sha256 "b1bedfe5b161b0ea52e7f24dbc32f5fab7d4200fbffb91f11c7a155ea28f3085"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.124.1/mirrord_linux_x86_64.zip"
      sha256 "44b8d00ffcdcb51aaab31f92dda62fb912f7770f6b9d74fcc4ad6078c2617a84"
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
