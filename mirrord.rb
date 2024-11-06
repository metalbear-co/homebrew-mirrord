# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.124.0/mirrord_mac_universal.zip"
    sha256 "90ab2cc3be2a4f6a3632ed485f22c33f55b99674d7570f9bf40843c98bec05f2"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.124.0/mirrord_linux_aarch64.zip"
      sha256 "588b5fb4530b9e2f8f12c273c2e8a68e98247174331b47c17117f40c065d595b"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.124.0/mirrord_linux_x86_64.zip"
      sha256 "bd28e30d34f4022c5280448bf430fe4ed40c6f705506d49b139517ae92be1657"
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
