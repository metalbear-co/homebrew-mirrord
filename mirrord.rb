# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.101.0/mirrord_mac_universal.zip"
    sha256 "57d6b561a9b2aa55d586d7a38d068389f7c69f6b30f4984f79d1bb6eb0313c2e"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.101.0/mirrord_linux_aarch64.zip"
      sha256 "fee50f87f4cb14c7525dc3630412877bb134cde8b6644086c2c13613a382ec71"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.101.0/mirrord_linux_x86_64.zip"
      sha256 "6ddd747980c541566ee5f6d1cee3f33722a9de5d957a68206650e66844f7ee2c"
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
