# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.145.0/mirrord_mac_universal.zip"
    sha256 "e8c79ef591c8d67f130f08694f974a86f799ff0aa6fbf011617d721c4dffe443"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.145.0/mirrord_linux_aarch64.zip"
      sha256 "f4cedbe4f83f7ba8218ccfed0b3a4fda095c16e6d5e561b19f7a53afecc710e6"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.145.0/mirrord_linux_x86_64.zip"
      sha256 "26164ee9208b1bd009649735acf1464f2be2ede10130648b780014bd30eef9cc"
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
