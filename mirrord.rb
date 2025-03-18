# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.135.0/mirrord_mac_universal.zip"
    sha256 "6afe9689a3e83c03a4943c3fd4103621c9370814773229851735f7df1aafa6ba"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.135.0/mirrord_linux_aarch64.zip"
      sha256 "e0881037667080ed64ab219c6e99f941fd535389cf1142f5380a5587597a019d"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.135.0/mirrord_linux_x86_64.zip"
      sha256 "429f45ddbc6942fd68fc79597cbfcb63a87eb35ded6a382f0bad455cd5b7c7e2"
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
