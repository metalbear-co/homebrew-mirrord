# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.125.0/mirrord_mac_universal.zip"
    sha256 "8bba12f92640ed11043af65bd34718fef203d35693e0794b500c2c952cca6f90"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.125.0/mirrord_linux_aarch64.zip"
      sha256 "520cfe80a6fc7f4b6ab6c5d682f9e7253a2f5801779b22d209e77d97a47b4a2b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.125.0/mirrord_linux_x86_64.zip"
      sha256 "8b0144a08af7bd1c4e3e978c76c09e12c969cfa5c17d3f7b7995e685e12c8ba5"
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
