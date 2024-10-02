# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.118.1/mirrord_mac_universal.zip"
    sha256 "d8b765acf0b35ac9d73e9cac0f026befea56cdaca34d190ae29638ecfc4a866b"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.118.1/mirrord_linux_aarch64.zip"
      sha256 "adfe54bef32912a48f32b141572888ccebc28803a8aa3aa209a7aa9df4589161"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.118.1/mirrord_linux_x86_64.zip"
      sha256 "9f953e7c0d7f1cd71a700a572f71e24760bedfd69facc13204551e1e0e083176"
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
