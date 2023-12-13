# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.78.1/mirrord_mac_universal.zip"
    sha256 "38438cf301cf11b6be685e2246fe8df718fe0191dfa60c913aad42b73ee4bd47"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.78.1/mirrord_linux_aarch64.zip"
      sha256 "42ac1c90bebec429b3e8c03d752998cbafa1e648abf3f4a4af7c6dfd58dd9f08"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.78.1/mirrord_linux_x86_64.zip"
      sha256 "5c45b8d7af2e05f915d57c1c33e0e2dbef074634ec264b958ef2288b17e7bb62"
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
