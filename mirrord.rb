# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.77.0/mirrord_mac_universal.zip"
    sha256 "b0b0047bd17bed1bd8c374bd3056567267450d0bfddaeedc677fa3ac8cdb4161"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.77.0/mirrord_linux_aarch64.zip"
      sha256 "498bbb994148310d99fe19851eb2776be5902ddbe8566dc065c96bea36b9155e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.77.0/mirrord_linux_x86_64.zip"
      sha256 "14994868a966eb03d0c5d2e32d9684a75eca13283ad1c1dca84afa37ec0010fc"
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
