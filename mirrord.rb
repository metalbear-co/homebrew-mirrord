# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.84.0/mirrord_mac_universal.zip"
    sha256 "aec7fd9b10bf6423c84c1542f9b454943bef4ff3d81f9243fd315586a6f64015"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.84.0/mirrord_linux_aarch64.zip"
      sha256 "7501f578647c176c8c46b1c5401ac565f6f2f7bcd7cca1e5135c182821b0c1b7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.84.0/mirrord_linux_x86_64.zip"
      sha256 "4adcbbdd481637ad4937c672dc97478da85815d38576ab775adfebe37fab29c7"
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
