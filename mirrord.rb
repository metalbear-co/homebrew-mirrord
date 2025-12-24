# typed: false
# frozen_string_literal: true

class Mirrord < Formula
  desc "Connect your local process and your cloud environment"
  homepage "https://mirrord.dev"
  license "MIT"
  version "3.179.0"
  version_scheme 1

  on_macos do
    url "https://github.com/metalbear-co/mirrord/releases/download/3.179.0/mirrord_mac_universal.zip"
    sha256 "1a3307d94b392b8191cb9ac9629d988c46349bf29228166592f2934be31c7950"
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.179.0/mirrord_linux_aarch64.zip"
      sha256 "d1a4ec8e8aaf3922e21075843286ce318bd72d25f48a64177ca002f91d698bba"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/metalbear-co/mirrord/releases/download/3.179.0/mirrord_linux_x86_64.zip"
      sha256 "91cc575f9e7c803c257e3e1681fe0ef3013358c93866d2f082a4fcb60aa08e3b"
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
