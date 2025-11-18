# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.173.2"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.173.2/mirrord_mac_universal.zip"
    sha256 "e6d632c96574420de8480b5084ff7725faf5c6335dd54a6e3ff1ffedfb1c7b5f"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.173.2/mirrord_linux_aarch64.zip"
      sha256 "19eb80ba7ccf26f118188b4c94bdcd98b351ad6607de9d76a556885630cbd1eb"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.173.2/mirrord_linux_x86_64.zip"
      sha256 "2faebdbf3d664c51a545f4e4529b207e0c49ee7571ddc0307874249528b1c968"
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
