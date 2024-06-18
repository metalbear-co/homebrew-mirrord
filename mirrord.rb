# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.106.0/mirrord_mac_universal.zip"
    sha256 "bf2ce802eb8194a9057dccf6314834cdbefaf7e3b0902450e5fa6c8f2683314d"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.106.0/mirrord_linux_aarch64.zip"
      sha256 "7132d9de773f74551bd0af33a0cdb68e6de758b5724457f25458247997a64730"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.106.0/mirrord_linux_x86_64.zip"
      sha256 "fde9d9443afd288b12c8b4a77f4a0d7da47a4ae9631b96aacef759f91d27f2d0"
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
