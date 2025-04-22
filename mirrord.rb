# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.140.0/mirrord_mac_universal.zip"
    sha256 "fa5dcc76048825f22c43c7202e76195ceae517243d4da5a58bd5bae8572ffc65"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.140.0/mirrord_linux_aarch64.zip"
      sha256 "72d4cb79497c4b04989cab954267c63ea691d707ac5dde9e201303516fbba515"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.140.0/mirrord_linux_x86_64.zip"
      sha256 "abe11129861ca0c872f0c69b0e1c41c209f052a90a634b6da2c441172801f030"
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
