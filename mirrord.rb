# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.87.0/mirrord_mac_universal.zip"
    sha256 "2ba1093ea23d90d7045fdde969c49b79aeb786d66f178fa6996c6cba0f8af193"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.87.0/mirrord_linux_aarch64.zip"
      sha256 "c4c918e5aa6d9f3d3e02412998ff8e6028136020145a0f29e069537d4236354a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.87.0/mirrord_linux_x86_64.zip"
      sha256 "f5cca7215d9bc84d5f6f3328f8cde3d41b3e9740a512ad83b11344d9b4877f99"
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
