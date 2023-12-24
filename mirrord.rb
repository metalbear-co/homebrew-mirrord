# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.79.2/mirrord_mac_universal.zip"
    sha256 "59ebbe8ec469a29e5c12ae799b68956016cc3166560211141c5b9fcb2e6740a4"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.79.2/mirrord_linux_aarch64.zip"
      sha256 "57ccff6e17292d1e77e0e8b51efc97032d34325e003516402f214401395b8604"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.79.2/mirrord_linux_x86_64.zip"
      sha256 "4f8b389d756b233fbfd6d660d84ce6c93cb1efcf5795e561d174d434ecdbc7bd"
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
