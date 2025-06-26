# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.147.0/mirrord_mac_universal.zip"
    sha256 "9b6e33b6a2ab41444ce06ee3374d9ac3ccb6d06bfb5f857a52792eef6a68df5a"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.147.0/mirrord_linux_aarch64.zip"
      sha256 "f039a509c05b31f502a051e8812931decb078f5a5efeccfb11320fc665fb84e1"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.147.0/mirrord_linux_x86_64.zip"
      sha256 "2a06d119b5d19ac61b4a11eb4a51a02b6143f0e4472cfbe5c90c597cf0d6e89a"
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
